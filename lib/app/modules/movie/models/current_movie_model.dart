import 'package:the_movie_challenge/app/modules/movie/models/cast_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/credits_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/crew_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/production_company.dart';
import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

class CurrentMovieModel {
  String title;
  String originalTitle;
  String overview;
  String releaseDate;
  String posterPath;
  double voteAverage;
  List<GenreModel> genres;
  int runtime;
  double budget;
  List<ProductionCompany> productionCompanies;
  CreditsModel creditsModel;

  CurrentMovieModel({
    this.title,
    this.originalTitle,
    this.overview,
    this.releaseDate,
    this.genres,
    this.productionCompanies,
    this.posterPath,
    this.voteAverage,
    this.runtime,
    this.creditsModel,
    this.budget,
  });

  CurrentMovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    runtime = json['runtime'];
    budget = json['budget'];
    if (json['genres'] != null) {
      genres = new List<GenreModel>();
      json['genres'].forEach((v) {
        genres.add(new GenreModel.fromJSON(v));
      });
    }
    if (json['production_companies'] != null) {
      productionCompanies = new List<ProductionCompany>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(new ProductionCompany.fromJson(v));
      });
    }
    creditsModel = json['credits'] != null
        ? new CreditsModel.fromJson(json['credits'])
        : null;
  }
}
