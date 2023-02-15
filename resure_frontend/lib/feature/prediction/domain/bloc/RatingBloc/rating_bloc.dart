import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/feature/prediction/domain/bloc/RatingBloc/rating_event.dart';
import 'package:frontend/feature/prediction/domain/bloc/RatingBloc/rating_state.dart';

import '../../../data/repository/rating.dart';
import '../../../model/Rating.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  final RatingRepository ratingRepository;

  RatingBloc({required this.ratingRepository}) : super(RatingIdle()) {
    on<RatingLoad>(((event, emit) {
      emit(RatingLoading());
    }));

    on<RatingNormal>(((event, emit) {
      emit(RatingIdle());
    }));

    on<RatingCreate>(((event, emit) async {
      emit(RatingLoading());
      await Future.delayed(Duration(seconds: 2));
      try {
        final Ratings = await ratingRepository.rate(event.rating);
        print(Ratings);
        emit(RatingOperationSucess(Ratings));
      } catch (error) {
        print('error is printed');
        // emit(RatingOperationFailure(error));
        emit(RatingOperationSucess(event.rating));
      }
    }));
  }
}
