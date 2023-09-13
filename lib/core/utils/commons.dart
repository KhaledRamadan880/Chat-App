import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//! Navigate Methods
void navigateReplacement({
  required BuildContext context,
  required String route,
}) {
  Navigator.pushReplacementNamed(context, route);
}

void navigateNamed({
  required BuildContext context,
  required String route,
}) {
  Navigator.pushNamed(context, route);
}

//! Toast
void toast({
  required String message,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: getColor(state),
  );
}

enum ToastStates { success, error, warning }

Color getColor(ToastStates state) {
  switch (state) {
    case ToastStates.success:
      return Colors.green;
    case ToastStates.error:
      return Colors.red;
    case ToastStates.warning:
      return Colors.orange;
  }
}
