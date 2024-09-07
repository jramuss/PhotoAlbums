import 'package:flutter_modular/flutter_modular.dart';
import 'package:photo_albums/app/modules/photo_details/stores/photo_detail_store.dart';
import 'package:photo_albums/app/modules/photo_details/view/photo_detail_view.dart';

class PhotoDetailModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(PhotoDetailStore.new);
  }

  @override
  void routes(r) {
    r.child(
      '/:id',
      child: (context) {
        final args = Modular.args;
        final photoId = int.parse(args.params['id']);
        return PhotoDetailsView(photoId: photoId);
      },
    );
  }
}
