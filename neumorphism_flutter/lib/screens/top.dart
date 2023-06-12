import 'package:flutter/material.dart';
import 'package:neo/components/neomorphism.dart';
import 'package:neo/data/datalist.dart';

class TopScreen extends StatefulWidget {
  const TopScreen({super.key});

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  final Color color = const HSLColor.fromAHSL(1, 210, 0.57, 0.91).toColor();
  final Map data = neumorphismDataList;
  final List users = neumorphismDataList['users'] as List;

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(data['logo']),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Hi, ${data['name']}",
                      style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                    ),
                  ),
                  NeomorphismButton(
                      icon: Icons.search, onPressed: () => print('Search'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 25),
              child: Row(
                children: [
                  Column(
                    children: [
                      NeomorphismButton(
                        icon: Icons.add,
                        width: 64,
                        height: 64,
                        isRounded: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Your\nHistory",
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          for (var i in users)
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 64,
                                        height: 64,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          border:
                                              Border.all(color: Colors.cyan),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              i['logo'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (i['is_active'])
                                        Positioned(
                                            bottom: 0,
                                            right: 0,
                                            child: Icon(
                                              Icons.circle,
                                              color: Colors.green[700],
                                              size: 18,
                                            ))
                                    ],
                                  ),
                                  const SizedBox(height: 15),
                                  SizedBox(
                                    width: 48,
                                    child: Text(
                                      i['name'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: NeomorphismButton(
        icon: Icons.add,
        onPressed: () {},
        isRounded: true,
        width: 64,
        height: 64,
      ),
    );
  }
}
