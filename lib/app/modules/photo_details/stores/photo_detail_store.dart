import 'package:mobx/mobx.dart';
import 'package:photo_albums/app/modules/photo_details/repository/photo_detail_repository.dart';
import 'package:photo_albums/app/modules/photo_list/models/photo_model.dart';
import 'package:photo_albums/app/modules/photo_details/models/user_model.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_model.dart';


part 'photo_detail_store.g.dart';

class PhotoDetailStore = _PhotoDetailStoreBase with _$PhotoDetailStore;

abstract class _PhotoDetailStoreBase with Store {
  @observable
  UserModel? authorDetails;

  @observable
  PhotoModel? photoDetail;

  @observable
  ObservableList<CommentModel> comments = ObservableList<CommentModel>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @action
  Future<void> fetchPhotoDetails(int id) async {
    try {
      isLoading = true;
      errorMessage = '';

      photoDetail = await PhotoDetailRepository.fetchPhotoDetails(id);
      authorDetails = await PhotoDetailRepository.fetchAuthorDetails(id);
      final commentsData = await PhotoDetailRepository.fetchComments(id);
      comments.addAll(commentsData);
    } catch (e) {
      errorMessage = "Erro ao carregar detalhes da foto: $e";
    } finally {
      isLoading = false;
    }
  }

}
