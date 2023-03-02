// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/profilescreen_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).primaryColor),
          child: IconButton(
              onPressed: () => Navigator.maybePop(context),
              icon: Icon(CupertinoIcons.arrow_turn_up_left)),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).primaryColor),
            child: IconButton(
                onPressed: () => Navigator.maybePop(context),
                icon: Icon(Icons.more_horiz)),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            height: 180,
            child: Row(
              children: [
                Container(
                  width: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage('assets/face1.jpg'),
                        ),
                      ),
                      Text(
                        "Emma",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "@emmarocks",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FollowCard(type: 'Followers', count: '32k'),
                            FollowCard(type: 'Following', count: '250'),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text("Follow"),
                              style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                  backgroundColor: MaterialStatePropertyAll(
                                      Colors.orangeAccent)),
                            ),
                            SizedBox(width: 20),
                            IconButton(
                                style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStatePropertyAll(Colors.white),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.deepPurple)),
                                onPressed: () {},
                                icon: Icon(CupertinoIcons.chat_bubble_text))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SegmentedButton(
                    showSelectedIcon: false,
                    style: ButtonStyle(
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 50)),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return Colors.black;
                          }
                          return Colors.grey;
                        },
                      ),
                    ),
                    segments: [
                      ButtonSegment(value: 1, label: Text("Photos(56)")),
                      ButtonSegment(value: 2, label: Text("Videos(18)"))
                    ],
                    selected: {
                      1
                    }),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                    child: GridView.builder(
                        itemCount: 56,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) => PhotosCard()),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

// Photos card
class PhotosCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 110,
            width: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://i0.wp.com/digital-photography-school.com/wp-content/uploads/2016/02/Headshot-Photography-London-0997.jpg?ssl=1"),
                    fit: BoxFit.cover)),
          ),
          Positioned(bottom: 10, child: GlassWrite()),
        ],
      ),
    );
  }
}

class GlassWrite extends StatelessWidget {
  const GlassWrite({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade700.withOpacity(0.6)),
            child: Row(children: [
              Icon(
                CupertinoIcons.heart,
                color: Colors.white,
              ),
              Text(
                "2k",
                style: TextStyle(color: Colors.white),
              )
            ]),
          ),
        ));
  }
}
