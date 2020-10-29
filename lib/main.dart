import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/consts/app_colors.dart';
import 'package:movie_app/presentation/home_screen/cubit/home_screen_cubit.dart';
import 'package:movie_app/presentation/home_screen/home_screen_widget.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  await di.setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.white,
      ),
      home: BlocProvider(
        create: (context) => sl<HomeScreenCubit>(),
        child: HomeScreenWidget(),
      ),
    );
  }
}
