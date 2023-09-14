import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String name;
  final String message;
  final Timestamp time;

  MessageModel({
    required this.name,
    required this.message,
    required this.time,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
      name: json['name'],
      message: json['message'],
      time: json['time'],
    );
  }
}
