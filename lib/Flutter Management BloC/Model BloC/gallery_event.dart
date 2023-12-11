import 'package:equatable/equatable.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class EditPhotoEvent extends GalleryEvent {
  final int index;
  final String newName;

  const EditPhotoEvent(this.index, this.newName);

  @override
  List<Object?> get props => [index, newName];
}
