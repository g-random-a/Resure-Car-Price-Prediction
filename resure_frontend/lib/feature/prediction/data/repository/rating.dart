import '../../model/Rating.dart';
import '../data_provider.dart/Rating_data_provider.dart';

class RatingRepository {
  RatingDataProvider ratingDataProvider;
  RatingRepository(this.ratingDataProvider);

  Future<Rating> rate(Rating rating) async {
    return await ratingDataProvider.rate(rating);
  }
}
