import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:photo_albums/app/modules/photo_details/stores/photo_detail_store.dart';

class PhotoDetailsView extends StatelessWidget {
  final int photoId;
  final PhotoDetailStore store = Modular.get<PhotoDetailStore>();

  PhotoDetailsView({required this.photoId});

  @override
  Widget build(BuildContext context) {
    store.fetchPhotoDetails(photoId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Observer(
        builder: (_) {
          if (store.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (store.errorMessage.isNotEmpty) {
            return Center(child: Text(store.errorMessage));
          }

          if (store.photoDetail == null) {
            return Center(child: Text('Photo not found'));
          }

          final photo = store.photoDetail!;
          final author = store.authorDetails;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(photo.url),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on),
                      onPressed: () {
                        MapsLauncher.launchQuery('${author!.company}, ${author.address}');
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.email),
                      onPressed: () async {
                        final email = Uri(
                          scheme: 'mailto',
                          path: author!.email,
                          query: 'subject=Contato sobre a foto ${photo.title}',
                        );
                        if (await canLaunchUrl(email)) {
                          await launchUrl(email);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Não foi possível enviar o e-mail')),
                          );
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.comment),
                      onPressed: () {
                        Modular.to.pushNamed('/send_comment', arguments: photo.id);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        photo.title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('Author: ${author?.name}'),
                      SizedBox(height: 20),
                      Text('Comments:'),
                      SizedBox(height: 10),
                      ...store.comments.map((comment) {
                        return ListTile(
                          title: Text(comment.name),
                          subtitle: Text(comment.body),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
