import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:movie_app/widgets_library/category_button.dart';
import 'package:movie_app/widgets_library/poster_widget.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeScreenCubit>(context).getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {
            // TODO(thiago): implement listener
          },
          builder: (context, state) {
            final cubit = context.bloc<HomeScreenCubit>();

            if (state is HomeScreenInitial) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 25,
                    bottom: 4,
                  ),
                  child: Text('Filmes'),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CupertinoTextField(
                    controller: TextEditingController(),
                    placeholder: 'Pesquise filmes',
                    decoration: BoxDecoration(
                      color: AppColors.gray[8],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    prefix: Padding(
                      padding: const EdgeInsets.all(17.0),
                      child: Icon(
                        Icons.search,
                        color: AppColors.gray[2],
                        size: 13.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        cubit.listOfGenres.length,
                        (index) => CategoryButton(
                          name: cubit.listOfGenres[index].name,
                          isSelected:
                              cubit.currentGenre == cubit.listOfGenres[index],
                          onClick: () =>
                              cubit.setCategory(cubit.listOfGenres[index]),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(20),
                    itemCount: cubit.listOfMovies.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16,
                    ),
                    itemBuilder: (context, index) => PosterWidget(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 24,
                              ),
                              child: Text(
                                cubit.listOfMovies[index].title.toUpperCase(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 32,
                                left: 24,
                                right: 24,
                              ),
                              child: Text(
                                cubit.listOfMovies[index].genreIds.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
