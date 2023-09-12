import 'package:flutter/material.dart';

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
