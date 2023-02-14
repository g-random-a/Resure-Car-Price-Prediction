import 'package:equatable/equatable.dart';
import 'package:frontend/feature/prediction/model/Rating.dart';

abstract class RatingState extends Equatable {
  const RatingState();

  @override
  List<Object> get props => [];
}

class RatingIdle extends RatingState {}

class RatingLoading extends RatingState {}

class RatingOperationSucess extends RatingState {
  final Rating rating;
  RatingOperationSucess(this.rating);

  @override
  List<Object> get props => [rating];
}

class RatingOperationFailure extends RatingState {
  final Object error;
  RatingOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
