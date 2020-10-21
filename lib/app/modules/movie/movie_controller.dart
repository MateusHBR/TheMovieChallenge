import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/app/modules/movie/models/cast_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/crew_model.dart';
import 'package:the_movie_challenge/app/modules/movie/models/current_movie_model.dart';
import 'package:the_movie_challenge/app/modules/movie/repositories/current_movie_repository.dart';

part 'movie_controller.g.dart';

@Injectable()
class MovieController = _MovieControllerBase with _$MovieController;

abstract class _MovieControllerBase with Store {
  final CurrentMovieRepository _currentMovieRepository;

  _MovieControllerBase(this._currentMovieRepository);

  @observable
  String id;

  @observable
  ObservableFuture<CurrentMovieModel> currentMovieFuture;

  @observable
  CurrentMovieModel currentMovieData;

  @observable
  bool status = false;

  @action
  getId(String currentId) {
    status = false;
    id = currentId;
    print(id);
    currentMovieFuture = _currentMovieRepository
        .getMovieData(
          id: id,
        )
        .asObservable();

    currentMovieFuture.whenComplete(
      () => currentMovieData = currentMovieFuture.value,
    );
    // currentMovieData.creditsModel.cast
    status = true;
  }

  String convertCast(List<CastModel> cast) {
    return '${cast.map((person) => person.name)}'
        .replaceAll('(', '')
        .replaceAll(')', '');
  }

  String convertDirector(List<CrewModel> crew) {
    String directors = '';

    crew.forEach(
      (currentCrew) => {
        if (currentCrew.job.contains("Director"))
          {
            directors = directors + "${currentCrew.name}, ",
          }
      },
    );

    return directors.substring(0, directors.length - 2);
  }

  String convertTime(int value) {
    int hour = value ~/ 60;
    int minutes = value % 60;

    return '${hour.toString()}h ${minutes.toString().padLeft(2, "0")}min';
  }
}
