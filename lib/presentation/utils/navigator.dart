import 'package:flutter/material.dart';


class AppNavigator {
  /// NAVIGATOR PUSH
  static void push({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  /// NAVIGATOR PUSH AND REMOVE
  static void pushAndRemove({
    required BuildContext context,
    required Widget screen,
  }) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=>screen),
            (route) => false,
    );
  }
  /// NAVIGATOR PUSH AND REPLACEMENT
 static void navigationAndFinish({
   required BuildContext context,
   required Widget screen,
}){
    Navigator.pushReplacement(
      context, MaterialPageRoute(
      builder: (context)=> screen,
    ),
      result: (Route <dynamic>route) => false,
    );
  }
  static void pop({
    required BuildContext context,
  }) {
    Navigator.pop(context);
  }
}
