import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(color: Color(0xfff7f7f9)),
                  child: Row(
                    children: const [
                      CircleAvatar(
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
                const Icon(Icons.notifications_outlined)
              ],
            )
          ],
        ),
      ),
    );
  }
}
