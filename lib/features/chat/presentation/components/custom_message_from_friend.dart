import 'package:chat_app/core/theme/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomMessageFromFriend extends StatelessWidget {
  const CustomMessageFromFriend({
    super.key, required this.message, required this.time, required this.name,
  });
  final String message;
  final String name;
  final Timestamp time;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
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
