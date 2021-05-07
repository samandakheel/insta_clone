import 'package:flutter/material.dart';
import 'package:insta_clone/auth/auth.dart';
import 'package:insta_clone/widgets/post_item.dart';

class TimeLinePage extends StatefulWidget {
  @override
  _TimeLinePageState createState() => _TimeLinePageState();
}

class _TimeLinePageState extends State<TimeLinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 1.0,
        backgroundColor: Color(0xFFF9F9FA),
        title: Image.asset(
          'assets/images/insta_logo2.png',
          height: 40.0,
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/camera.png',
            width: 24.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/dm.png',
              width: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Container(
                  child: ListView.builder(
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return PostItem('Saman',
                          "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1001&q=80");
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/home.png"),
                        width: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/search.png"),
                        width: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/add_post.png"),
                        width: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/like.png"),
                        width: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image(
                        image: AssetImage("assets/images/profile.png"),
                        width: 24,
                      ),
                      onPressed: () {
                        final AuthRepo _auth = AuthRepo.instance;
                        _auth.logOut();
                        Navigator.of(context).pushReplacementNamed('/login');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
