import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../Repository/Api/api.dart';
import '../Repository/Modelclass/image.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  late Image1 image;
  AnimeApi animeApi = AnimeApi();
  ImageBloc() : super(ImageInitial()) {
    on<ImageEvent>((event, emit)async {
      emit(ImageLoading());
      try {
        image = await animeApi.getAnime(event.toString());
        emit(ImageLoaded());
      } catch (e) {
        print(e);
        emit(ImageError());
    }});
  }
}
