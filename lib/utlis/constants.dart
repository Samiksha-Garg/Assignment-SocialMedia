import 'package:assign_social_media/models/comment.model.dart';
import 'package:assign_social_media/models/post.model.dart';

class CommentConstants {
  static CommentModel commentModel = CommentModel(
      profilePic: "assets/images/profile3.webp",
      user: "Mameer",
      comment: "Wow, I love the color way",
      time: "30m");

  static CommentModel commentModel2 = CommentModel(
    profilePic: "assets/images/profile4.jpg",
    user: "Dita Rahardian",
    time: "12m",
    comment: "I don't know what store it is, please tell me",
  );

  static CommentModel commentModel3 = CommentModel(
    profilePic: "assets/images/profile5.png",
    user: "Maira Shah",
    time: "10m",
    comment: "Giving spooky vibes!",
  );
}

class PostConstants {
  static PostDeatils postDetails1 = PostDeatils(
      imageLink: "assets/images/circus.jpg",
      caption:
          'This circus nearby my apartment looks so nice and cool, and makes me feel so happy',
      uploader: "Michelle Jonas",
      uploaderImage: "assets/images/profile2.jpg",
      hashtags: ['asthetics', 'analog', 'colors'],
      likes: 725,
      comments: 63,
      commentList: [
        CommentConstants.commentModel,
        CommentConstants.commentModel2,
        CommentConstants.commentModel3
      ],
      liked: false);

  static PostDeatils postDeatils2 = PostDeatils(
      imageLink: "assets/images/postImage3.webp",
      caption: "Home Sweet Home!",
      uploader: "Sara Williams",
      uploaderImage: "assets/images/profile6.png",
      hashtags: ["asthetics", "comfort", "backToBay"],
      likes: 50,
      comments: 10,
      commentList: [],
      liked: true);
}
