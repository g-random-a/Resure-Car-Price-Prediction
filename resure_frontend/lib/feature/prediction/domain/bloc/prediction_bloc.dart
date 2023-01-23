import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/prediction/data/repository/repository.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_event.dart';
import 'package:frontend/feature/prediction/domain/bloc/prediction_state.dart';

class PredictionBloc extends Bloc<PredictionEvent, PredictionState> {
  final PredictionRepository predictionRepository;

  PredictionBloc({required this.predictionRepository})
      : super(PredictionLoading()) {
    on<PredictionLoad>(((event, emit) {
      emit(PredictionLoading());
    }));

    on<PredictionCreate>(((event, emit) async {
      try {
        final predictions = await predictionRepository.create(event.prediction);
        print(predictions);
        emit(PredictionOperationSucess(predictions));
      } catch (error) {
        print('error is printed');
        emit(PredictionOperationFailure(error));
      }
    }));
  }
}
