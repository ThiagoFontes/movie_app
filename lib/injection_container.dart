import 'package:get_it/get_it.dart';
import 'package:movie_app/data/datasource/tmdb_datasource.dart';
import 'package:movie_app/data/repository/genre_list_repository_imp.dart';
import 'package:movie_app/data/repository/movie_list_repository_imp.dart';
import 'package:movie_app/domain/repositories/genre_list_repository.dart';
import 'package:movie_app/domain/repositories/movie_list_repository.dart';
import 'package:movie_app/domain/usecases/genre_list_usecase.dart';
import 'package:movie_app/domain/usecases/movie_list_category_usecase.dart';
import 'package:movie_app/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  sl.registerFactory(
      () => HomeScreenCubit(categoryUsecase: sl(), genreUsecase: sl()));

  sl.registerFactory(() => MovieListCategoryUsecase(repository: sl()));

  sl.registerFactory(() => GenreListUsecase(sl()));

  sl.registerFactory<MovieListRepository>(
    () => MovieListRepositoryImp(remoteDatasource: sl()),
  );

  sl.registerFactory<GenreListRepository>(() => GenreListRepositoryImp(sl()));

  sl.registerLazySingleton(() => TMDBDatasource(client: sl()));

  sl.registerLazySingleton(() => http.Client());
}
