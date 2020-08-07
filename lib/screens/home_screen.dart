import 'package:flutter/material.dart';
import '../shared_ui/navigation_drawer.dart';
import '../screens/home_tab/whats_new.dart';
import '../screens/home_tab/popular.dart';
import '../screens/home_tab/favourites.dart';
import 'pages/about.dart';
import 'pages/settings.dart';
import 'pages/help.dart';
import 'pages/contact.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

enum PopOutMenu { Help, about, Contact, setting }

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
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
        title: Text('Explore'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          _popOutMenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: 'Whats New',
            ),
            Tab(
              text: 'POPULAR',
            ),
            Tab(
              text: 'FAVOURITES',
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favourites(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }

  Widget _popOutMenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(
      itemBuilder: (context) {
        return [
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.about,
            child: Text('About'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Contact,
            child: Text('Contact'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.setting,
            child: Text('Settings'),
          ),
          PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.Help,
            child: Text('Help'),
          ),
        ];
      },
      onSelected: (PopOutMenu menu) {
        switch (menu) {
          case PopOutMenu.about:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return AboutUs();
            }));
            break;
          case PopOutMenu.setting:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Settings();
            }));
            break;
          case PopOutMenu.Help:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Help();
            }));
            break;
          case PopOutMenu.Contact:
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return ContactUs() ;
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
