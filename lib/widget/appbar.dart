import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/Theme/text_theme.dart';


AppBar buildAppBar(String Title) {
  return AppBar(
    backgroundColor: AppColors.primaryblue,
    elevation: 0,
    iconTheme: const IconThemeData(color: AppColors.white),
    // centerTitle: true,
    title: Text(
          Title,
          style:AppTextTheme.appbartitle,
          
        ),
  );
}
