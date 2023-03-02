import 'package:flutter/material.dart';

class FollowCard extends StatelessWidget {
  final String type, count;

  const FollowCard({super.key, required this.type, required this.count});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 60,
        width: 90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: AssetImage('assets/face1.jpg'),
                  ),
                ),
                Positioned(
                  left: 15,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/face1.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/face1.jpg'),
                    ),
                  ),
                ),
                Positioned(
                  left: 45,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('assets/face1.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                count,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                type,
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              )
            ])
          ],
        ),
      ),
    );
  }
}
