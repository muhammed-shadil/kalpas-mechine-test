import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalbas_mechine_test/controller/bloc/newsdata_bloc.dart';
import 'package:kalbas_mechine_test/model/news_model.dart';
import 'package:kalbas_mechine_test/utils/resources/constands.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/maintile.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/slidable.dart';
import 'package:kalbas_mechine_test/view/description/screen/description.dart';

class NewsScreenWrpper extends StatelessWidget {
  const NewsScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsdataBloc(),
      child: const NewsScreen(),
    );
  }
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsdataBloc>(context).add(NewsfetchEvent());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  late Newsfetch fetchdatas;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          controller: _tabController,
          indicator: const BoxDecoration(
              color: Constants.lightblue,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          tabs: const [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu_rounded,
                    size: 30,
                  ),
                  SizedBox(width: 8.0), // Space between icon and text
                  Text(
                    'News',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    size: 30,
                    color: Constants.red,
                  ),
                  SizedBox(width: 12.0), // Space between icon and text
                  Text(
                    'Favs',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildNewsList(),
          _buildFavoritesList(),
        ],
      ),
    );
  }

  // Build News List
  Widget _buildNewsList() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: BlocBuilder<NewsdataBloc, NewsdataState>(
        builder: (context, state) {
          if (state is Loading) {
            return const CircularProgressIndicator();
          } else if (state is SuccessFetching) {
            fetchdatas = state.newsdata;

            return ListView.separated(
              padding: const EdgeInsets.all(8.0),
              itemCount: fetchdatas.totalResults, // Sample count
              itemBuilder: (context, index) {
                return MySlidableCard(
                    index: index,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DescriptionScreen(
                                        title: fetchdatas.articles[index].title,
                                        content:
                                            fetchdatas.articles[index].content,
                                        publishedAt: fetchdatas
                                            .articles[index].publishedAt,
                                        image: fetchdatas
                                                .articles[index].urlToImage ??
                                            "https://techdenbd.com/backend/img/placeholder_image/Wyov47ZqxJID67GksbXO.gif",
                                      )));
                        },
                        child: MainTile(
                          title: fetchdatas.articles[index].title,
                          description: fetchdatas.articles[index].description,
                          publishedAt: fetchdatas.articles[index].publishedAt,
                          image: fetchdatas.articles[index].urlToImage ??
                              "https://techdenbd.com/backend/img/placeholder_image/Wyov47ZqxJID67GksbXO.gif",
                        )));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                height: 10,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  // Build Favorites List
  Widget _buildFavoritesList() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: 3, // Sample count
        itemBuilder: (context, index) {
          return const MainTile(
            title: '',
            description: '',
            publishedAt: '',
            image:
                "https://lightwidget.com/wp-content/uploads/localhost-file-not-found.jpg",
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
