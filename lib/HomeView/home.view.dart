import 'dart:ui';

import 'package:assign_social_media/PostView/post.view.dart';
import 'package:assign_social_media/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:assign_social_media/models/post.model.dart';

class FeedView extends StatefulWidget {
  const FeedView({Key? key}) : super(key: key);

  @override
  State<FeedView> createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  @override
  Widget build(BuildContext context) {
    List<PostDeatils> postDeatils = [
      PostConstants.postDetails1,
      PostConstants.postDeatils2
    ];

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
                child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: postDeatils.length,
                    itemBuilder: (BuildContext context, int index) {
                      return postTile(
                          size: size, postDetails: postDeatils[index]);
                    }))
          ],
        ),
      ),
    );
  }
}

class postTile extends StatelessWidget {
  final Size size;
  final PostDeatils postDetails;

  const postTile({Key? key, required this.size, required this.postDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.60,
            width: double.infinity,
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * 0.60,
                  width: double.infinity,
                  child: FittedBox(
                      child: Image(
                        image: AssetImage(postDetails.imageLink),
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
                              sideButton(
                                  iconData: postDetails.liked
                                      ? FontAwesome5.heart
                                      : FontAwesome.heart_empty,
                                  color: postDetails.liked
                                      ? Colors.red
                                      : Colors.white),
                              Text(
                                postDetails.likes.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const sideButton(
                                  iconData: FontAwesome.comment_empty,
                                  color: Colors.white),
                              Text(
                                postDetails.comments.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              const sideButton(
                                  iconData: Icons.send, color: Colors.white),
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
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(postDetails.uploaderImage),
                            radius: 15,
                          ),
                          Text(
                            ' ' + postDetails.uploader + ' ',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Text(
                        postDetails.caption,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        postDetails.hasthagsToString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PostView(
                      postDeatils: postDetails,
                    )));
      },
    );
  }
}

class sideButton extends StatelessWidget {
  final IconData iconData;
  final Color color;

  const sideButton({Key? key, required this.iconData, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
