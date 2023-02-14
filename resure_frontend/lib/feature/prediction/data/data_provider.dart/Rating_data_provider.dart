import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../model/Rating.dart';

class RatingDataProvider {
  @override
  Future<Rating> rate(Rating rating) async {
    const url = 'http://127.0.0.1:8000/rate/';
    final http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({'id': rating.id, 'rate': rating.rate}));

    if (response.statusCode == 200) {
      final res_json = jsonDecode(response.body);
      Rating res_rating = Rating(id: res_json['id'], rate: res_json['rate']);
      return res_rating;
    }
    {
      throw Exception(response.body);
    }
  }
}
