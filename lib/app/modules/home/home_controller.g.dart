// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<GenreRepository>(), i<MovieRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$genreFutureAtom = Atom(name: '_HomeControllerBase.genreFuture');

  @override
  ObservableFuture<List<GenreModel>> get genreFuture {
    _$genreFutureAtom.reportRead();
    return super.genreFuture;
  }

  @override
  set genreFuture(ObservableFuture<List<GenreModel>> value) {
    _$genreFutureAtom.reportWrite(value, super.genreFuture, () {
      super.genreFuture = value;
    });
  }

  final _$genreListAtom = Atom(name: '_HomeControllerBase.genreList');

  @override
  ObservableList<GenreModel> get genreList {
    _$genreListAtom.reportRead();
    return super.genreList;
  }

  @override
  set genreList(ObservableList<GenreModel> value) {
    _$genreListAtom.reportWrite(value, super.genreList, () {
      super.genreList = value;
    });
  }

  final _$movieFutureAtom = Atom(name: '_HomeControllerBase.movieFuture');

  @override
  ObservableFuture<List<MovieModel>> get movieFuture {
    _$movieFutureAtom.reportRead();
    return super.movieFuture;
  }

  @override
  set movieFuture(ObservableFuture<List<MovieModel>> value) {
    _$movieFutureAtom.reportWrite(value, super.movieFuture, () {
      super.movieFuture = value;
    });
  }

  final _$movieListAtom = Atom(name: '_HomeControllerBase.movieList');

  @override
  ObservableList<MovieModel> get movieList {
    _$movieListAtom.reportRead();
    return super.movieList;
  }

  @override
  set movieList(ObservableList<MovieModel> value) {
    _$movieListAtom.reportWrite(value, super.movieList, () {
      super.movieList = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic fetchGenres() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchGenres');
    try {
      return super.fetchGenres();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fetchMovies() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.fetchMovies');
    try {
      return super.fetchMovies();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
genreFuture: ${genreFuture},
genreList: ${genreList},
movieFuture: ${movieFuture},
movieList: ${movieList}
    ''';
  }
}