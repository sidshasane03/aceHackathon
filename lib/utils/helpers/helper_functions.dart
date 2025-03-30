import 'dart:math';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:safeguardher_flutter_app/utils/constants/colors.dart';

import '../../models/user_model.dart';
import '../../screens/home_screen/home_screen.dart';

class AppHelperFunctions
{
  static String extractTodayDate()
  {
    return DateTime.now().toString().split(' ')[0];
  }

  static String extractTodayTime()
  {
  return DateTime.now().toString().split(' ')[1].split('.')[0];
  }

  static int generateSafeCodeForRescue()
  {
    final random = Random();
    final code = 1000 + random.nextInt(9000);
    return code;
  }

  void goToScreenAndComeBack(BuildContext context, Widget nextScreen)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  void goToScreenAndDoNotComeBack(BuildContext context, Widget nextScreen)
  {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  void goBack(BuildContext context)
  {
    Navigator.pop(
      context
    );
  }

  void goToHomeScreen(BuildContext context, User user)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(),
      ),
    );
  }


  static void showAlert(BuildContext context, String title, String message)
  {
    showDialog(
        context: context,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close')
              )
            ],
          );
        }
    );
  }

  Widget appLoader(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: AppColors.logoPrimary,
          rightDotColor: AppColors.logoSecondary,
          size: 50.0,
        ),
      ),
    );
  }
}
