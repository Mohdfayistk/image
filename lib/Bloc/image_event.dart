part of 'image_bloc.dart';

@immutable
abstract class ImageEvent {}
class FetchImage extends ImageEvent {
  final String text;
  FetchImage({required this.text});
}

