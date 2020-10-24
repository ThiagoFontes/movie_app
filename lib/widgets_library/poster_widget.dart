import 'package:flutter/cupertino.dart';
import 'package:movie_app/consts/app_colors.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({
    Widget child,
    double width,
    double height,
    DecorationImage image,
    Key key,
  })  : _child = child,
        _width = width,
        _height = height,
        _image = image,
        super(key: key);

  final Widget _child;
  final double _width;
  final double _height;
  final DecorationImage _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _child,
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: AppColors.gray[3],
        borderRadius: BorderRadius.circular(10),
        image: _image,
      ),
    );
  }
}
