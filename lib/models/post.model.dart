import 'package:flutter/material.dart';

class PostDeatils {
  final String imageLink;
  final String caption;
  final String uploader;
  final String uploaderImage;
  final List<String> hashtags;
  int likes = 0;
  int comments = 0;
  int sent = 0;

  PostDeatils(
      {required this.imageLink,
      required this.caption,
      required this.uploader,
      required this.uploaderImage,
      required this.hashtags});
}
