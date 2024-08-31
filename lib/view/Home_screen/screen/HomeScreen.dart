import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/maintile.dart';
import 'package:kalbas_mechine_test/view/Home_screen/widgets/slidable.dart';
import 'package:kalbas_mechine_test/view/description/screen/description.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
              color: Color.fromARGB(255, 226, 233, 247),
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
                    color: Colors.red,
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
      child: ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: 5, // Sample count
        itemBuilder: (context, index) {
          return MySlidableCard(
              index: index,
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => DescriptionScreen()));
                  },
                  child: MainTile()));
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
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
          return MainTile();
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
