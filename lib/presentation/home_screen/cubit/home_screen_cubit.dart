import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/usecases/movie_list_category_usecase.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit({
    @required MovieListCategoryUsecase categoryUsecase,
  })  : categoryUsecase = categoryUsecase,
        super(HomeScreenInitial());

  final MovieListCategoryUsecase categoryUsecase;
}
