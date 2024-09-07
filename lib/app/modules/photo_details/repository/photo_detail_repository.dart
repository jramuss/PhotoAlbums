import 'package:photo_albums/app/core/repository/app_repository.dart';
import 'package:photo_albums/app/modules/photo_list/models/photo_model.dart';
import 'package:photo_albums/app/modules/photo_details/models/user_model.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_model.dart';

class PhotoDetailRepository {
  static String endpointDetail = "/photos/";

  static Future<PhotoModel> fetchPhotoDetails(int id) async {
    final response = await AppRepository.getDio()!.get('${AppRepository.baseUrl}$endpointDetail$id');
    return PhotoModel.fromJson(response.data);
  }

  static Future<List<CommentModel>> fetchComments(int id) async {
    final response = await AppRepository.getDio()!.get('${AppRepository.baseUrl}/posts/$id/comments');
    return (response.data as List)
        .map((json) => CommentModel.fromJson(json))
        .toList();
  }
  static Future<UserModel> fetchAuthorDetails(int id) async {
    final response = await AppRepository.getDio()!.get('${AppRepository.baseUrl}/users/$id');
    return UserModel.fromJson(response.data);
  }

}
