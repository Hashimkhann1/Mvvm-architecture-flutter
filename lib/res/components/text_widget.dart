import 'package:flutter/material.dart';


class TextWidget extends StatelessWidget {
  TextWidget({Key? key,this.title,this.fontWeight,this.textSize,this.textCOlor}) : super(key: key);

  String? title;
  double? textSize;
  FontWeight? fontWeight;
  Color? textCOlor;

  @override
  Widget build(BuildContext context) {
    return Text(title.toString(),style: TextStyle(
      color: textCOlor,
      fontSize: textSize,
      fontWeight: fontWeight
    ),);
  }
}
