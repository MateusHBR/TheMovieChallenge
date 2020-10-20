import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:the_movie_challenge/app/modules/movie/models/current_movie_model.dart';
import 'package:the_movie_challenge/app/shared/constants/api_key.dart';

class CurrentMovieRepository {
  final Dio _dio;

  CurrentMovieRepository(this._dio);

  Future<CurrentMovieModel> getMovieData({@required String id}) async {
    var response = await _dio.get("/movie/$id?api_key=$API_KEY&language=pt-BR");

    CurrentMovieModel movie = CurrentMovieModel.fromJson(
      response.data,
    );

    return movie;
  }
}
