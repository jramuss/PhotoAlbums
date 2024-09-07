import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_albums/app/modules/photo_details/photo_detail_module.dart';
import 'package:photo_albums/app/modules/photo_list/stores/photo_list_store.dart';
import 'package:photo_albums/app/modules/send_comment/send_comment_module.dart';

import 'app/modules/photo_list/photo_list_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(PhotoListStore.new);
  }

  @override
  void routes(r) {
    r.module('/', module: PhotoListModule());
    r.module('/photo_details', module: PhotoDetailModule());
    r.module('/send_comment', module: SendCommentModule());
  }
}
