part of 'image_bloc.dart';

@immutable
abstract class ImageState {}

class ImageInitial extends ImageState {}
class ImageLoading extends  ImageState {}
class ImageLoaded extends  ImageState {}
class ImageError extends  ImageState{}