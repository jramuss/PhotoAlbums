import 'package:mobx/mobx.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_post_model.dart';
import 'package:photo_albums/app/modules/send_comment/repository/send_comment_repository.dart';

part 'send_comment_store.g.dart';

class SendCommentStore = _SendCommentStoreBase with _$SendCommentStore;

abstract class _SendCommentStoreBase with Store {

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';

  @observable
  CommentPostModel? postedComment;

  @action
  Future<void> sendComment(CommentPostModel comment) async {
    try {
      isLoading = true;
      errorMessage = '';
      postedComment = await SendCommentRepository.postComment(comment);

    } catch (e) {
      errorMessage = 'Erro ao enviar comentário: $e';
    } finally {
      isLoading = false;
    }
  }
}
