import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:the_movie_challenge/app/shared/constants/api_key.dart';

import '../models/movie_model.dart';

class MovieRepository {
  final Dio _dio;
  MovieRepository(this._dio);

  Future<List<MovieModel>> getMovies({@required int page}) async {
    var response = await _dio.get(
      "/movie/popular?api_key=$API_KEY&language=pt-BR&page=$page",
    );

    List<MovieModel> movieList = <MovieModel>[];

    for (var json in (response.data["results"] as List)) {
      var movieModel = MovieModel.fromJSON(json);
      movieList.add(movieModel);
    }

    return movieList;
  }
}
