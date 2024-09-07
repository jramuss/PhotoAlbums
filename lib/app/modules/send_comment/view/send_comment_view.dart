import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_albums/app/modules/send_comment/models/comment_post_model.dart';
import 'package:photo_albums/app/modules/send_comment/stores/send_comment_store.dart';

class SendCommentView extends StatefulWidget {
  @override
  State<SendCommentView> createState() => _SendCommentPageState();
}

class _SendCommentPageState extends State<SendCommentView> {
  final SendCommentStore _store = SendCommentStore();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Comentário'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Título',
                border: OutlineInputBorder(),
              ),
              maxLength: 50,
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Comentário',
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
              ),
            ),
            SizedBox(height: 16.0),
            Observer(
              builder: (_) {
                return ElevatedButton(
                  onPressed: _store.isLoading ? null : _sendComment,
                  child: _store.isLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text('Enviar Comentário'),
                );
              },
            ),
            Observer(
              builder: (_) {
                if (_store.errorMessage.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      _store.errorMessage,
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _sendComment() async {
    final title = _titleController.text;
    final body = _commentController.text;

    if (title.isNotEmpty && body.isNotEmpty) {
      final comment = CommentPostModel(
        title: title,
        body: body,
      );
      await _store.sendComment(comment);

      if (_store.errorMessage.isEmpty) {
        _showSnackBar('Comentário enviado com sucesso!');

        _titleController.clear();
        _commentController.clear();
      } else {}
    } else {
      setState(() {
        _store.errorMessage = 'Por favor, preencha todos os campos.';
      });
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
