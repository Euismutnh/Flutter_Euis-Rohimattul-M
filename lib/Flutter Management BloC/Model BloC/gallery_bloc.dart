import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery_event.dart';
import 'gallery_state.dart';

// gallery_bloc.dart

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc()
      : super(GalleryState(imageAsset: const [], newImageAsset: const []));

  Stream<GalleryState> mapEventToState(GalleryEvent event) async* {
    if (event is EditPhotoEvent) {
      yield state.copyWith(
        newImageAsset: _editPhoto(event.index, state.newImageAsset),
      );
    }
  }

  List<String> _editPhoto(int index, List<String> currentList) {
    if (index >= 0 && index < currentList.length) {
      currentList[index] = 'New Photo Name';
      return List.from(currentList);
    }
    return currentList;
  }
}
