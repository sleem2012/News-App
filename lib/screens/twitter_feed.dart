import 'package:flutter/material.dart';
import '../shared_ui/navigation_drawer.dart';

class TwitterFeeds extends StatefulWidget {
  @override
  _TwitterFeedsState createState() => _TwitterFeedsState();
}

class _TwitterFeedsState extends State<TwitterFeeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Card(

              child: Column(
                children: <Widget>[
                  _cardHeader(),
                  _cardBody(),
                  _drawLine(),
                  _cardFooter(),
                ],
              ),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _cardHeader() {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage:
                ExactAssetImage('assets/images/placeholder_bg.png'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Chrisina Meyers',
                    style: TextStyle(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  width: 18,
                ),
                Text(
                  '@ch_meyrs',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Fri, 12 may 2020   14.30',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        )
      ],
    );
  }

  Widget _cardBody() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
        child: Text(
          'We also talk about the future of work as the robots advance , and we ask whether a retro phone',
          style: TextStyle(fontSize: 16,height: 1.2,color: Colors.grey.shade900),
        ),
      ),
    );
  }

  Widget _cardFooter() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.repeat,size: 28,),
                color: Colors.orange,
                onPressed: () {},
              ),
              Text('25',style: TextStyle(color: Colors.grey,fontSize: 16)),
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                  onPressed: () {},
                  child: Text(
                    'Share',
                    style: TextStyle(
                      color: Colors.orange,
                    ),
                  )),
              FlatButton(
                  onPressed: () {},
                  child: Text('Open',
                      style: TextStyle(
                        color: Colors.orange,
                      ))),
            ],
          )
        ],
      ),
    );
  }

 Widget _drawLine() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
      margin: EdgeInsets.only(top: 16),
    );
 }
}
