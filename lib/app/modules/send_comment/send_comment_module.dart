import 'package:flutter_modular/flutter_modular.dart';

import 'package:photo_albums/app/modules/send_comment/stores/send_comment_store.dart';
import 'package:photo_albums/app/modules/send_comment/view/send_comment_view.dart';

class SendCommentModule extends Module{
  @override
  void binds(i) {
    i.addLazySingleton(() => SendCommentStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_)=> SendCommentView());
  }
}