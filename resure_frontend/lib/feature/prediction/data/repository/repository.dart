import 'package:frontend/feature/prediction/data/data_provider.dart/data_provider.dart';
import 'package:frontend/feature/prediction/model/prediction.dart';

class PredictionRepository {
  PredictionDataProvider predictionDataProvider;
  PredictionRepository(this.predictionDataProvider);

  Future<Prediction> create(Prediction prediction) async {
    return await predictionDataProvider.create(prediction);
  }
}
