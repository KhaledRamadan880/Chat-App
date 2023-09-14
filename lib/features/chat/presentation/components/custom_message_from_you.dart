import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/core/utils/app_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomMessageFromYou extends StatelessWidget {
  const CustomMessageFromYou({
    super.key, required this.message, required this.time,
  });
  final String message;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'You',
              style: appTheme().textTheme.bodySmall,
            ),
            Text(
              message,
              style: appTheme().textTheme.bodySmall,
            ),
            Text(
              '${time.toDate().hour > 12 ? time.toDate().hour-12: time.toDate().hour}:${time.toDate().minute}: ${time.toDate().hour>12 ? 'AM': 'PM'}',
              style: appTheme().textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
