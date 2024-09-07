// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PhotoListStore on _PhotoListStoreBase, Store {
  late final _$photosAtom =
      Atom(name: '_PhotoListStoreBase.photos', context: context);

  @override
  ObservableList<PhotoModel> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<PhotoModel> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_PhotoListStoreBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PhotoListStoreBase.isLoading', context: context);

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

  late final _$fetchPhotosAsyncAction =
      AsyncAction('_PhotoListStoreBase.fetchPhotos', context: context);

  @override
  Future<void> fetchPhotos() {
    return _$fetchPhotosAsyncAction.run(() => super.fetchPhotos());
  }

  late final _$filterPhotosAsyncAction =
      AsyncAction('_PhotoListStoreBase.filterPhotos', context: context);

  @override
  Future<void> filterPhotos({String? photoTitle, String? albumTitle}) {
    return _$filterPhotosAsyncAction.run(() =>
        super.filterPhotos(photoTitle: photoTitle, albumTitle: albumTitle));
  }

  @override
  String toString() {
    return '''
photos: ${photos},
error: ${error},
isLoading: ${isLoading}
    ''';
  }
}
