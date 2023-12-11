import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edit_event.dart';
import 'edit_state.dart';

class EditPhotoBloc extends Bloc<EditPhotoEvent, EditPhotoState> {
  final List<String> imageAsset;

  EditPhotoBloc(this.imageAsset) : super(EditPhotoInitial());

  Stream<EditPhotoState> mapEventToState(EditPhotoEvent event) async* {
    if (event is EditPhotoNameEvent) {
      yield* _mapEditPhotoNameToState(event.index, event.newName);
    }
  }

  Stream<EditPhotoState> _mapEditPhotoNameToState(
      int index, String newName) async* {
    try {
      List<String> updatedImageAsset = List.from(imageAsset);
      updatedImageAsset[index] = newName;

      // Simulasi delay untuk menunjukkan operasi asynchronous
      await Future.delayed(const Duration(seconds: 1));

      yield EditPhotoSuccess(updatedImageAsset);
    } catch (e) {
      yield const EditPhotoError('Error editing photo name');
    }
  }
}
