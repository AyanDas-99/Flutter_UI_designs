import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_app/ThemeManager.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
      height: 80,
      child: Row(children: [
        Expanded(
            child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => Navigator.pushNamed(context, '/profile'),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('assets/face1.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Morning!",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Text(
                      "Ahmed Asif",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.person_add_alt_1_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications_none)),
        IconButton(
          onPressed: context.read<ThemeManger>().toggleTheme,
          icon: context.watch<ThemeManger>().themeMode == ThemeMode.light
              ? Icon(Icons.sunny)
              : Icon(Icons.wb_sunny_outlined),
        ),
      ]),
    );
  }
}
