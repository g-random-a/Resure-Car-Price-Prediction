import 'package:equatable/equatable.dart';

abstract class RatingState extends Equatable {
  const RatingState();

  @override
  List<Object> get props => [];
}

class RatingIdle extends RatingState {}

class RatingLoading extends RatingState {}

class RatingOperationSucess extends RatingState {
  final String price;
  RatingOperationSucess(this.price);

  @override
  List<Object> get props => [price];
}

class RatingOperationFailure extends RatingState {
  final Object error;
  RatingOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
