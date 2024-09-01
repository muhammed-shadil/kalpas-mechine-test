import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalbas_mechine_test/controller/favorite_list/bloc/favorte_list_bloc.dart';
import 'package:kalbas_mechine_test/controller/newsfetching/bloc/newsdata_bloc.dart';
import 'package:kalbas_mechine_test/model/news_model.dart';
import 'package:kalbas_mechine_test/utils/resources/constands.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/maintile.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/shimmer.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/slidable.dart';
import 'package:kalbas_mechine_test/view/description/screen/description.dart';

class NewsScreenWrpper extends StatelessWidget {
  const NewsScreenWrpper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsdataBloc(),
        ),
        BlocProvider(
          create: (context) => FavorteListBloc(),
        ),
      ],
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
                  Constants.width8, // Space between icon and text
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
                  Constants.width12,
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
            return const ShimmerLoading();
          } else if (state is FaildFetching) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SuccessFetching) {
            fetchdatas = state.newsdata;

            return ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: fetchdatas.totalResults, // Sample count
                itemBuilder: (context, index) {
                  bool isfavorite = false;
                  return MySlidableCard(
                      onPressed: (_) {
                        isfavorite = !isfavorite;
                        BlocProvider.of<FavorteListBloc>(context).add(
                            FavoriteEvent(
                                data: fetchdatas.articles[index],
                                isfavorite: isfavorite));
                      },
                      index: index,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DescriptionScreen(
                                          title:
                                              fetchdatas.articles[index].title,
                                          content: fetchdatas
                                              .articles[index].content,
                                          publishedAt: fetchdatas
                                              .articles[index].publishedAt,
                                          image: fetchdatas
                                                  .articles[index].urlToImage ??
                                              Constants.notFoundImage,
                                        )));
                          },
                          child: MainTile(
                            title: fetchdatas.articles[index].title,
                            description: fetchdatas.articles[index].description,
                            publishedAt: fetchdatas.articles[index].publishedAt,
                            image: fetchdatas.articles[index].urlToImage ??
                                Constants.notFoundImage,
                          )));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Constants.height10);
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
      child: BlocBuilder<FavorteListBloc, FavorteListState>(
        builder: (context, state) {
          if (state is Loading) {
            return const CircularProgressIndicator();
          } else if (state is Favoritestate) {
            final favorites = state.data;
            if (favorites.isEmpty) {
              return const Center(child: Text('No favorites added yet.'));
            }
            return ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  return MainTile(
                    title: favorites[index].title,
                    description: favorites[index].description,
                    publishedAt: favorites[index].publishedAt,
                    image:
                        favorites[index].urlToImage ?? Constants.notFoundImage,
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Constants.height10);
          }
          return const Center(
            child: SizedBox(
              child: Text("Nothing in favorite list"),
            ),
          );
        },
      ),
    );
  }
}
