import 'package:flutter/material.dart';

class CommentModel {
  String profilePic;
  String user;
  String comment;
  String time;

  CommentModel(
      {required this.profilePic,
      required this.user,
      required this.comment,
      required this.time});
}
