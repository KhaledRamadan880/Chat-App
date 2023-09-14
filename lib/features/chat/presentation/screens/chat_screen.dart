import 'package:chat_app/core/utils/app_colors.dart';
import 'package:chat_app/core/widgets/custom_text_field.dart';
import 'package:chat_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat_app/features/chat/data/model/message_model.dart';
import 'package:chat_app/features/chat/presentation/components/custom_message_from_friend.dart';
import 'package:chat_app/features/chat/presentation/components/custom_message_from_you.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController sendMessageController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  void scrollDown() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('messages')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.connectionState == ConnectionState.active) {
              List<MessageModel> messageList = [];
              for (var i in snapshot.data!.docs) {
                messageList.add(MessageModel.fromJson(i));
              }
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    //! Chat Area
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return messageList.isNotEmpty
                              ? messageList[index].name ==
                                      BlocProvider.of<AuthCubit>(context)
                                          .userModel!
                                          .name
                                  ? CustomMessageFromYou(
                                      message: messageList[index].message,
                                      time: messageList[index].time,
                                    )
                                  : CustomMessageFromFriend(
                                      message: messageList[index].message,
                                      time: messageList[index].time,
                                      name: messageList[index].name,
                                    )
                              : null;
                        },
                      ),
                    ),
                    //! TextField
                    CustomTextField(
                      hint: "Send Message",
                      controller: sendMessageController,
                      showSuffix: true,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (sendMessageController.text.isNotEmpty) {
                            FirebaseFirestore.instance
                                .collection('messages')
                                .add({
                              'message': sendMessageController.text,
                              'time': Timestamp.now(),
                              'name': BlocProvider.of<AuthCubit>(context)
                                  .userModel!
                                  .name,
                            });
                          }
                          sendMessageController.clear();
                          scrollDown();
                        },
                        icon: const Icon(Icons.send),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
