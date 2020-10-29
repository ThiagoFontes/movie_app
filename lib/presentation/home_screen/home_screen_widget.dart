import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/domain/entities/movie_categories.dart';
import 'package:movie_app/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:movie_app/widgets_library/category_button.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final Map<MovieCategories, String> categorieNameMap = {
    MovieCategories.acao: 'Ação',
    MovieCategories.aventura: 'Aventura',
    MovieCategories.comedia: 'Comedia',
    MovieCategories.fantasia: 'Fantasia',
  };

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

            return SingleChildScrollView(
              child: Column(
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        MovieCategories.values.length,
                        (index) => CategoryButton(
                          name: categorieNameMap[MovieCategories.values[index]],
                          isSelected: cubit.currentCategory ==
                              MovieCategories.values[index],
                          onClick: () =>
                              cubit.setCategory(MovieCategories.values[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
