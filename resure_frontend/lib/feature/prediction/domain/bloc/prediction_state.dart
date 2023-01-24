import 'package:equatable/equatable.dart';

abstract class PredictionState extends Equatable {
  const PredictionState();

  @override
  List<Object> get props => [];
}

class PredictionIdle extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionOperationSucess extends PredictionState {
  final String price;
  PredictionOperationSucess(this.price);

  @override
  List<Object> get props => [price];
}

class PredictionOperationFailure extends PredictionState {
  final Object error;
  PredictionOperationFailure(this.error);

  @override
  List<Object> get props => [error];
}
