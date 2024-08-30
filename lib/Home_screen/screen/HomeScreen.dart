import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/Home_screen/widgets/maintile.dart';

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
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 5, // Sample count
      itemBuilder: (context, index) {
        return
         Dismissible(
            background: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 250, 202, 200),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
              alignment: Alignment.topRight,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  SizedBox(width: 8.0),
                  Text(
                    textAlign: TextAlign.center,
                    'Add to \n Favorites',
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            key: ValueKey(index),
            direction: DismissDirection.endToStart,
            child: MainTile());
      },
    );
  }

  // Build Favorites List
  Widget _buildFavoritesList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 3, // Sample count
      itemBuilder: (context, index) {
        return MainTile();
      },
    );
  }
}
