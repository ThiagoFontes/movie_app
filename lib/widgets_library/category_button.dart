import 'package:flutter/cupertino.dart';
import 'package:movie_app/consts/app_colors.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    @required String name,
    @required Function onClick,
    bool isSelected = false,
    Key key,
  })  : _name = name,
        _isSelected = isSelected,
        _onClick = onClick,
        super(key: key);

  final String _name;
  final bool _isSelected;
  final Function _onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _onClick,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 12,
              ),
              child: Text(
                _name,
                style: TextStyle(
                  color: _isSelected ? AppColors.white : AppColors.darkBlue,
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: _isSelected ? AppColors.darkBlue : AppColors.white,
            border: !_isSelected
                ? Border.all(
                    color: AppColors.gray[8],
                    width: 1,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
