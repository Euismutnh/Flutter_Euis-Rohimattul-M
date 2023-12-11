import 'package:equatable/equatable.dart';

class GalleryState extends Equatable {
  final List<String> imageAsset;
  final List<String> newImageAsset;

  GalleryState({required this.imageAsset, required this.newImageAsset});

  GalleryState copyWith({List<String>? newImageAsset}) {
    return GalleryState(
      imageAsset: this.imageAsset,
      newImageAsset: newImageAsset ?? this.newImageAsset,
    );
  }

  @override
  List<Object?> get props => [imageAsset, newImageAsset];
}
