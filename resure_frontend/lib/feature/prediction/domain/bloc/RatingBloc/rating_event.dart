import 'package:equatable/equatable.dart';

import '../../../model/Rating.dart';

abstract class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

class RatingLoad extends RatingEvent {
  const RatingLoad();

  @override
  List<Object> get props => [];
}

class RatingCreate extends RatingEvent {
  final Rating rating;

  const RatingCreate(this.rating);

  @override
  List<Object> get props => [rating];
}

class RatingNormal extends RatingEvent {
  const RatingNormal();

  @override
  List<Object> get props => [];
}
