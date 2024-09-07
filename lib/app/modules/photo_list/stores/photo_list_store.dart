import 'package:mobx/mobx.dart';
import 'package:photo_albums/app/modules/photo_list/models/photo_model.dart';
import 'package:photo_albums/app/modules/photo_list/repository/photo_list_repository.dart';

part 'photo_list_store.g.dart';

class PhotoListStore = _PhotoListStoreBase with _$PhotoListStore;

abstract class _PhotoListStoreBase with Store {
  @observable
  ObservableList<PhotoModel> photos = ObservableList<PhotoModel>();

  @observable
  String error = '';

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchPhotos() async {
    isLoading = true;
    error = '';
    try {
      final fetchedPhotos = await PhotoListRepository.getPhotos();
      photos.clear();
      photos.addAll(fetchedPhotos);
    } catch (e) {
      error = 'Erro ao carregar fotos';
      throw e;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> filterPhotos({String? photoTitle, String? albumTitle}) async {
    isLoading = true;
    error = '';
    try {
      final filteredPhotos = await PhotoListRepository.filterPhotos(
        photoTitle: photoTitle,
        albumTitle: albumTitle,
      );
      photos.clear();
      photos.addAll(filteredPhotos);
    } catch (e) {
      error = 'Erro ao filtrar fotos';
      throw e;
    } finally {
      isLoading = false;
    }
  }
}
