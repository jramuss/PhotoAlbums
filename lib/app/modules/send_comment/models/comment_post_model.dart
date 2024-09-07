import 'package:photo_albums/app/modules/send_comment/models/domain/comment_post.dart';

class CommentPostModel extends CommentPost {
  CommentPostModel({
    required super.title,
    required super.body,
  });

  factory CommentPostModel.fromJson(Map<String, dynamic> json) {
    return CommentPostModel(
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }
}
