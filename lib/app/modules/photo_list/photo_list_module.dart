import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_albums/app/modules/photo_list/stores/photo_list_store.dart';
import 'package:photo_albums/app/modules/photo_list/view/photo_list_view.dart';

class PhotoListModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(() => PhotoListStore());

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (_)=> PhotoListView());
  }
}
