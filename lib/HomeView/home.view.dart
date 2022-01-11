import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfffcf2f5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/profile.png"),
                          radius: 15,
                        ),
                        Text(
                          '  @dhimsraysad ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Octicons.verified,
                          size: 15,
                          color: Colors.blueAccent,
                        )
                      ],
                    ),
                  ),
                ),
                IconButton(
                  icon: Stack(
                    children: <Widget>[
                      const Icon(
                        Icons.notifications_outlined,
                        size: 25,
                      ),
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          padding: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 9,
                            minHeight: 9,
                          ),
                        ),
                      )
                    ],
                  ),
                  onPressed: () {},
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: size.height * 0.60,
                        width: double.infinity,
                        child: FittedBox(
                            child: Image(
                              image: const AssetImage(
                                  "assets/images/postImage2.jpg"),
                              height: size.height * 0.65,
                            ),
                            fit: BoxFit.fill),
                      ),
                      Positioned(
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.18),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    sideButton(FontAwesome5.heart, Colors.red),
                                    const Text(
                                      '725',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sideButton(FontAwesome.comment_empty,
                                        Colors.white),
                                    const Text(
                                      '63',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    sideButton(Icons.send, Colors.white),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        top: size.height * 0.09,
                        right: 5,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ClipRect sideButton(IconData iconData, Color color) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.3),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                iconData,
                color: color,
              )),
        ),
      ),
    );
  }
}
