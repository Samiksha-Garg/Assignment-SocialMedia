import 'package:assign_social_media/HomeView/home.view.dart';
import 'package:assign_social_media/models/comment.model.dart';
import 'package:assign_social_media/models/post.model.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class PostView extends StatefulWidget {
  PostDeatils postDeatils;

  PostView({Key? key, required this.postDeatils}) : super(key: key);

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool liked = widget.postDeatils.liked;
    return WillPopScope(
      onWillPop: () {
        // print("Back Pressed");

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FeedView()));
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.60 * size.height,
                        width: size.width,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image(
                            image: AssetImage(widget.postDeatils.imageLink),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 32 + size.height * 0.08,
                              ),
                              Text(
                                widget.postDeatils.uploader,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    liked = !liked;
                                    widget.postDeatils.setLike = liked;
                                  });
                                },
                                icon: Icon(
                                  liked == false
                                      ? FontAwesome.heart_empty
                                      : FontAwesome.heart,
                                  color:
                                      liked == false ? Colors.grey : Colors.red,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.send,
                                  color: Colors.grey,
                                )),
                          ]),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 10, bottom: 10),
                        child: Text(widget.postDeatils.caption),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 32, right: 10, bottom: 10),
                        child: Text(
                          widget.postDeatils.hasthagsToString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: widget.postDeatils.commentList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return commentTile(
                                  commentModel:
                                      widget.postDeatils.commentList[index],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundImage:
                          AssetImage(widget.postDeatils.uploaderImage),
                      radius: size.height * 0.04,
                    ),
                    top: 0.57 * size.height,
                    left: 32,
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xfff7f7f9),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 20),
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/profile.png",
                      ),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: TextField(
                        readOnly: true,
                        showCursor: true,
                        decoration:
                            InputDecoration(hintText: 'Write Comment Here..'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class commentTile extends StatelessWidget {
  final CommentModel commentModel;

  const commentTile({Key? key, required this.commentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
              backgroundColor: Colors.pink,
              backgroundImage: AssetImage(commentModel.profilePic),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commentModel.user,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    commentModel.comment,
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ]),
        ),
        Text(commentModel.time)
      ],
    );
  }
}
