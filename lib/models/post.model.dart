import 'package:assign_social_media/models/comment.model.dart';
import 'package:flutter/material.dart';

class PostDeatils {
  final String imageLink;
  final String caption;
  final String uploader;
  final String uploaderImage;
  final List<String> hashtags;
  final int likes;
  final int comments;
  final List<CommentModel> commentList;
  bool liked;

  PostDeatils(
      {required this.imageLink,
      required this.caption,
      required this.uploader,
      required this.uploaderImage,
      required this.hashtags,
      required this.likes,
      required this.comments,
      required this.commentList,
      required this.liked});

  String hasthagsToString() {
    String s = "";

    for (String str in hashtags) {
      s += "#" + str + " ";
    }

    return s;
  }

  set setLike(bool val) {
    liked = val;
  }
}
