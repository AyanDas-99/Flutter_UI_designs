import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/homescree_topbar.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                      height: 130,
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "Let's Make\nNew Friends",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w900),
                          )),
                          Image.asset(
                            'assets/react_icon.png',
                            scale: 1.2,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
                        child: Column(
                          children: [
                            Header(text: "Discover Feed"),
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return DiscoverCard();
                                },
                                itemCount: 4,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
              height: 200,
              child: BottomBar(),
            )
          ],
        ),
      ),
    );
  }
}

class DiscoverCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 320,
            width: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                    image: AssetImage('assets/face1.jpg'), fit: BoxFit.cover)),
          ),
          Positioned(bottom: 10, child: GlassWrite()),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(text: "People Near You"),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => ProfileCard(),
            itemCount: 5,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            CircleAvatar(
                radius: 38, backgroundImage: AssetImage('assets/face1.jpg')),
            SizedBox(
              height: 5,
            ),
            Text("Kyle", style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              "@kyel32",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            )
          ],
        ));
  }
}

class Header extends StatelessWidget {
  final String text;

  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.more_horiz,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class GlassWrite extends StatelessWidget {
  const GlassWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 8),
        child: Container(
          padding: EdgeInsets.all(10),
          width: 240,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey.shade200.withOpacity(0.2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/face1.jpg'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Emma",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '1min ago',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              Text(
                "New Project for ZARA",
                textScaleFactor: 0.8,
                style: TextStyle(color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "#phorography #model",
                    textScaleFactor: 0.6,
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.heart,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Icon(
                          CupertinoIcons.chat_bubble_text,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
