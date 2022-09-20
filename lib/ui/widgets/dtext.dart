import 'package:flutter/material.dart';

class DText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;

  DText({
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily ?? 'Ubuntu',

        // fontFamily: 'Cera Regular',
        color: color ?? Colors.black45,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
