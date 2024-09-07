import 'package:photo_albums/app/core/repository/app_repository.dart';
import 'package:photo_albums/app/modules/photo_list/models/album_model.dart';

class AlbumRepository{
  static String albumsEndpoint = "/albums";

  static Future<List<AlbumModel>> getAlbums() async {
    final response = await AppRepository.getDio()!.get('${AppRepository.baseUrl}$albumsEndpoint');
    final responseJson = AppRepository.returnResponse(response);
    return (responseJson.data as List).map((item) => AlbumModel.fromJson(item)).toList();
  }


}