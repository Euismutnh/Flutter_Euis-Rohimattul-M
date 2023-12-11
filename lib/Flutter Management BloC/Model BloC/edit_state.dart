import 'package:equatable/equatable.dart';

abstract class EditPhotoState extends Equatable {
  const EditPhotoState();

  @override
  List<Object?> get props => [];
}

class EditPhotoInitial extends EditPhotoState {}

class EditPhotoSuccess extends EditPhotoState {
  final List<String> updatedImageAsset;

  const EditPhotoSuccess(this.updatedImageAsset);

  @override
  List<Object?> get props => [updatedImageAsset];
}

class EditPhotoError extends EditPhotoState {
  final String errorMessage;

  const EditPhotoError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
