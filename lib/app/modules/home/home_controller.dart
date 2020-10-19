import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:the_movie_challenge/app/modules/home/repositories/genre_repository.dart';
import 'package:the_movie_challenge/app/shared/models/genre_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GenreRepository _genreRepository;

  _HomeControllerBase(this._genreRepository) {
    fetchGenres();
  }

  @observable
  ObservableFuture<List<GenreModel>> genreFuture = ObservableFuture.value([]);

  @observable
  ObservableList<GenreModel> genreList = <GenreModel>[].asObservable();

  @action
  fetchGenres() {
    genreFuture = _genreRepository.getGenres().asObservable();

    genreFuture.whenComplete(
      () => genreList.addAll(genreFuture.value),
    );
  }
}
