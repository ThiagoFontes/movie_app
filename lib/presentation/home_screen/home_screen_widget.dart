import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/consts/app_colors.dart';

class HomeScreenWidget extends StatefulWidget {
  HomeScreenWidget({Key key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
