import 'package:equatable/equatable.dart';

import 'gallery_event.dart';

// Event untuk mengedit nama foto.
class EditPhotoNameEvent extends GalleryEvent with EquatableMixin {
  final int index;
  final String newName;

  EditPhotoNameEvent(this.index, this.newName);

  @override
  List<Object?> get props => [index, newName];
}

class EditPhotoEvent extends GalleryEvent {
  final int index;
  final String newName;
  const EditPhotoEvent(this.index, this.newName);

  @override
  List<Object?> get props => [index, newName];
}
