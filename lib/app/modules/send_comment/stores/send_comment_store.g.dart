// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_comment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SendCommentStore on _SendCommentStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SendCommentStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_SendCommentStoreBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$postedCommentAtom =
      Atom(name: '_SendCommentStoreBase.postedComment', context: context);

  @override
  CommentPostModel? get postedComment {
    _$postedCommentAtom.reportRead();
    return super.postedComment;
  }

  @override
  set postedComment(CommentPostModel? value) {
    _$postedCommentAtom.reportWrite(value, super.postedComment, () {
      super.postedComment = value;
    });
  }

  late final _$sendCommentAsyncAction =
      AsyncAction('_SendCommentStoreBase.sendComment', context: context);

  @override
  Future<void> sendComment(CommentPostModel comment) {
    return _$sendCommentAsyncAction.run(() => super.sendComment(comment));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
postedComment: ${postedComment}
    ''';
  }
}
