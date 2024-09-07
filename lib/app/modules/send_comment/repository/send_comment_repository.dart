import 'package:photo_albums/app/core/repository/app_repository.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_post_model.dart';


class SendCommentRepository {
  static String commentsEndpoint = "/comments";


  static Future<CommentPostModel> postComment(CommentPostModel comment) async {
    final response = await AppRepository.getDio()!.post('${AppRepository.baseUrl}$commentsEndpoint',data: comment.toJson());

    return CommentPostModel.fromJson(response.data);
  }
}
