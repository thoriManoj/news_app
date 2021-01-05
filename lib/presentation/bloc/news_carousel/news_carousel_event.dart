import 'package:equatable/equatable.dart';

abstract class NewsCarouselEvent extends Equatable {
  const NewsCarouselEvent();

  @override
  List<Object> get props => [];
}

class CarouselLoadEvent extends NewsCarouselEvent {}
