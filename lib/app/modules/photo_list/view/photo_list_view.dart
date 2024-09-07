import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_albums/app/modules/photo_list/stores/photo_list_store.dart';


class PhotoListView extends StatefulWidget {

  @override
  _PhotoListViewState createState() => _PhotoListViewState();
}

class _PhotoListViewState extends State<PhotoListView> {
  final PhotoListStore photoStore = Modular.get<PhotoListStore>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    photoStore.fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Fotos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por título da foto ou do álbum...',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                photoStore.filterPhotos(photoTitle: value, albumTitle: value);
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (photoStore.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (photoStore.error.isNotEmpty) {
                    return Center(child: Text(photoStore.error));
                  }

                  if (photoStore.photos.isEmpty) {
                    return Center(child: Text('Nenhuma foto encontrada'));
                  }

                  return ListView.builder(
                    itemCount: photoStore.photos.length,
                    itemBuilder: (context, index) {
                      final photo = photoStore.photos[index];
                      return ListTile(
                        title: Text(photo.title),
                        leading: Image.network(photo.thumbnailUrl),
                        onTap: () {
                          Modular.to.pushNamed('/photo_details/${photo.id}');
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
