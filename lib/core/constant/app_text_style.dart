import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyle{

  static TextStyle titleStyle =  TextStyle(
    color: AppColors.appBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle smallTitleStyle =  TextStyle(
    color: AppColors.appBlack400,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static TextStyle mediumTitleStyle = TextStyle(
    color: AppColors.appBlack600,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static TextStyle regularStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.appBlack600,
  );

  static TextStyle dialogTitleStyle = TextStyle(
    fontSize: 16,
    color:AppColors.appBlack600.withOpacity(0.8),
    fontWeight: FontWeight.bold,
  );

}