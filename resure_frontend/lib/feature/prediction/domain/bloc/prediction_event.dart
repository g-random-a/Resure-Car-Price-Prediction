import 'package:equatable/equatable.dart';
import 'package:frontend/feature/prediction/model/prediction.dart';

abstract class PredictionEvent extends Equatable {
  const PredictionEvent();

  @override
  List<Object> get props => [];
}

class PredictionLoad extends PredictionEvent {
  const PredictionLoad();

  @override
  List<Object> get props => [];
}

class PredictionCreate extends PredictionEvent {
  final Prediction prediction;

  const PredictionCreate(this.prediction);

  @override
  List<Object> get props => [prediction];
}
