import 'package:flutter/material.dart';

class PostDeatils {
  final String imageLink;
  final String caption;
  final String uploader;
  final String uploaderImage;
  final List<String> hashtags;
  final int likes;
  final int comments;

  PostDeatils(
      {required this.imageLink,
      required this.caption,
      required this.uploader,
      required this.uploaderImage,
      required this.hashtags,
      required this.likes,
      required this.comments});
}
