import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  final String title;
  final Color color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration decoration;
  final double? letterSpacing;
  final double leftSpacing;
  final TextStyle? textStyle;

  const AppText(
    this.title, {
    super.key,
    this.color = AppColors.appBlack,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.textAlign,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.leftSpacing = 0.0,
    this.textStyle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftSpacing),
      child: Text(
        title,
        textAlign: textAlign,
        maxLines: maxLines,
        style: textStyle ?? TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 16,
          height: height,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          overflow: overflow,
          decoration: decoration,
          decorationColor: AppColors.appGrey.withValues(alpha: 0.5),
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
