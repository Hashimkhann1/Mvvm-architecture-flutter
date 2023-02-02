import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/colors.dart';

class RoundButtonWidget extends StatelessWidget {
  String? title;
  final bool loading;
  VoidCallback? onPress;

  RoundButtonWidget(
      {Key? key, required this.title, this.loading = false, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: 44.0,
        width: 200.0,
        decoration: BoxDecoration(
            color: AppColors.greenColor,
            borderRadius: BorderRadius.circular(10.0)),
        child: loading ? CircularProgressIndicator(color: AppColors.whiteColor,) : Text(
          title.toString(),
          style: TextStyle(
            color: AppColors.whiteColor
          ),
        ),
      ),
    );
  }
}
