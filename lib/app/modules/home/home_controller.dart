import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/app/modules/home/models/movie_model.dart';

import 'package:the_movie_challenge/app/shared/models/genre_model.dart';
import 'package:the_movie_challenge/app/modules/home/repositories/genre_repository.dart';
import 'package:the_movie_challenge/app/modules/home/repositories/movie_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GenreRepository _genreRepository;
  final MovieRepository _moviesRepository;

  _HomeControllerBase(this._genreRepository, this._moviesRepository) {
    fetchGenres();
  }

  @observable
  ObservableFuture<List<GenreModel>> genreFuture = ObservableFuture.value([]);
  @observable
  ObservableList<GenreModel> genreList = <GenreModel>[].asObservable();

  @observable
  ObservableFuture<List<MovieModel>> movieFuture = ObservableFuture.value([]);
  @observable
  ObservableList<MovieModel> movieList = <MovieModel>[].asObservable();

  @observable
  int selectedCategory = 0;

  @observable
  int currentPage = 0;

  @action
  onChangeCategory({@required int index, @required int id}) {
    print(id);
    selectedCategory = index;
    filterMovies();
  }

  @action
  fetchGenres() {
    genreFuture = _genreRepository.getGenres().asObservable();

    genreFuture.whenComplete(
      () => {
        genreList.addAll(genreFuture.value),
        fetchMovies(),
      },
    );
  }

  @action
  fetchMovies() {
    movieFuture = _moviesRepository.getMovies().asObservable();
    List<MovieModel> filteredMovies = [];

    movieFuture.whenComplete(
      () => {
        filteredMovies = movieFuture.value
            .where(
              (movie) =>
                  movie.genreIds.contains(genreList[selectedCategory].id),
            )
            .toList(),
        movieList.addAll(filteredMovies),
      },
    );
  }

  @action
  filterMovies() {
    List<MovieModel> filteredMovies = [];

    filteredMovies = movieFuture.value
        .where(
            (movie) => movie.genreIds.contains(genreList[selectedCategory].id))
        .toList();

    movieList.replaceRange(0, movieList.length, filteredMovies);
  }

  @action
  String getGenresFromMovies(List<int> listOfgenreId) {
    String currentGenre = "";

    listOfgenreId.forEach(
      (id) {
        genreList.forEach(
          (item) {
            if (item.id == id) {
              currentGenre.length == 0
                  ? currentGenre = "${item.name}"
                  : currentGenre = currentGenre + " - ${item.name}";
            }
          },
        );
      },
    );

    return currentGenre;
  }
}
