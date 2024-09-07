
import 'package:flutter_test/flutter_test.dart';
import 'package:photo_albums/app/modules/photo_details/repository/photo_detail_repository.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_post_model.dart';
import 'package:photo_albums/app/modules/send_comment/repository/send_comment_repository.dart';



void main() {
  test('deve retornar verdadeiro detalhes da fotos selecionada', () async {
    dynamic retorno = await PhotoDetailRepository.fetchPhotoDetails(1);
    expect(true, retorno != null);
  });

  test('deve retornar verdadeiro para uma lista de comentarios', () async {
    dynamic retorno = await PhotoDetailRepository.fetchComments(1);
    expect(true, retorno != null);
  });

  test('deve retornar verdadeiro para detalhes do autor', () async {
    dynamic retorno = await PhotoDetailRepository.fetchAuthorDetails(1);
    expect(true, retorno != null);
  });

  test('deve retornar verdadeiro para enviar comentario',() async{
    final comment = CommentPostModel(title: "title", body: "body");
      dynamic retorno = await SendCommentRepository.postComment(comment);
      expect(true, retorno != null);
  });

}
