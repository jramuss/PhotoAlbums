import 'package:photo_albums/app/core/repository/app_repository.dart';
import 'package:photo_albums/app/modules/photo_list/models/album_model.dart';
import 'package:photo_albums/app/modules/photo_list/models/photo_model.dart';
import 'package:photo_albums/app/modules/photo_list/repository/album_repository.dart';

class PhotoListRepository {
  static String photosEndpoint = "/photos";

  static Future<List<PhotoModel>> getPhotos() async {
    final response = await AppRepository.getDio()!.get('${AppRepository.baseUrl}$photosEndpoint');
    final responseJson = AppRepository.returnResponse(response);
    return (responseJson.data as List)
        .map((item) => PhotoModel.fromJson(item))
        .toList();
  }

  static Future<List<PhotoModel>> filterPhotos({String? photoTitle, String? albumTitle}) async {
    final photos = await getPhotos();
    final albums = await AlbumRepository.getAlbums();

    final filteredPhotos = photos.where((photo) {
      final album = albums.firstWhere(
        (album) => album.id == photo.albumId,
        orElse: () => AlbumModel(id: 0, title: 'Album', userId: 0),
      );

      final isPhotoTitleMatch = photoTitle == null ||
          photo.title.toLowerCase().contains(photoTitle.toLowerCase());
      final isAlbumTitleMatch = albumTitle == null ||
          album.title.toLowerCase().contains(albumTitle.toLowerCase());

      return isPhotoTitleMatch || isAlbumTitleMatch;
    }).toList();

    return filteredPhotos;
  }
}
