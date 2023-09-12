import 'package:flutter/material.dart';

//! Navigate Method
void navigateReplacement({
  required BuildContext context,
  required String route,
}) {
  Navigator.pushReplacementNamed(context, route);
}
