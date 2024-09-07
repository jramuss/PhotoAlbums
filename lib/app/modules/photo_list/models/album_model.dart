import 'package:photo_albums/app/modules/photo_list/models/domain/album.dart';

class AlbumModel extends Album {
  AlbumModel({
    required super.userId,
    required super.id,
    required super.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}