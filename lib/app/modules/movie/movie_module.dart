import 'package:dio/dio.dart';
import 'package:the_movie_challenge/app/modules/movie/repositories/current_movie_repository.dart';

import 'movie_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'movie_page.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => MovieController(
            i.get<CurrentMovieRepository>(),
          ),
        ),
        Bind(
          (i) => CurrentMovieRepository(
            i.get<Dio>(),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/:id',
          child: (_, args) => MoviePage(
            id: args.params["id"],
            posterPath: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<MovieModule>.of();
}
