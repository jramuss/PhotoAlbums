// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotoDetailStore on _PhotoDetailStoreBase, Store {
  late final _$authorDetailsAtom =
      Atom(name: '_PhotoDetailStoreBase.authorDetails', context: context);

  @override
  UserModel? get authorDetails {
    _$authorDetailsAtom.reportRead();
    return super.authorDetails;
  }

  @override
  set authorDetails(UserModel? value) {
    _$authorDetailsAtom.reportWrite(value, super.authorDetails, () {
      super.authorDetails = value;
    });
  }

  late final _$photoDetailAtom =
      Atom(name: '_PhotoDetailStoreBase.photoDetail', context: context);

  @override
  PhotoModel? get photoDetail {
    _$photoDetailAtom.reportRead();
    return super.photoDetail;
  }

  @override
  set photoDetail(PhotoModel? value) {
    _$photoDetailAtom.reportWrite(value, super.photoDetail, () {
      super.photoDetail = value;
    });
  }

  late final _$commentsAtom =
      Atom(name: '_PhotoDetailStoreBase.comments', context: context);

  @override
  ObservableList<CommentModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PhotoDetailStoreBase.isLoading', context: context);

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
      Atom(name: '_PhotoDetailStoreBase.errorMessage', context: context);

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

  late final _$fetchPhotoDetailsAsyncAction =
      AsyncAction('_PhotoDetailStoreBase.fetchPhotoDetails', context: context);

  @override
  Future<void> fetchPhotoDetails(int id) {
    return _$fetchPhotoDetailsAsyncAction
        .run(() => super.fetchPhotoDetails(id));
  }

  @override
  String toString() {
    return '''
authorDetails: ${authorDetails},
photoDetail: ${photoDetail},
comments: ${comments},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
