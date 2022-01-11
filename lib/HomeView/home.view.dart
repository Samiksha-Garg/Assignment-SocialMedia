import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:assign_social_media/models/post.model.dart';

class FeedView extends StatelessWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostDeatils postDeatils1 = PostDeatils(
        imageLink: "assets/images/circus.jpg",
        caption:
            'This circus nearby my apartment looks so nice and cool, and makes me feel so happy',
        uploader: "Michelle Jonas",
        uploaderImage: "assets/images/profile2.jpg",
        hashtags: ['asthetics', 'analog', 'colors'],
        likes: 725,
        comments: 63);

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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    postWidget(size, postDeatils1),
                    const SizedBox(
                      height: 20,
                    ),
                    // postWidget(size, postDeatils1)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox postWidget(Size size, PostDeatils postDeatils) {
    return SizedBox(
      height: size.height * 0.60,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.60,
            width: double.infinity,
            child: FittedBox(
                child: Image(
                  image: AssetImage(postDeatils.imageLink),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sideButton(FontAwesome5.heart, Colors.red),
                        Text(
                          postDeatils.likes.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        sideButton(FontAwesome.comment_empty, Colors.white),
                        Text(
                          postDeatils.comments.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(postDeatils.uploaderImage),
                      radius: 15,
                    ),
                    Text(
                      ' ' + postDeatils.uploader + ' ',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  postDeatils.caption,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.visible,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '#asthetics #analog #colors',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          )
        ],
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
