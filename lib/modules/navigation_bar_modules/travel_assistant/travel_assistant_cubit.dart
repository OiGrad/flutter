import 'dart:async';

import 'package:bloc/bloc.dart';

//import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:kemet/models/chat_model.dart';

part './travel_assistant_state.dart';

class TravelAssistantCubit extends Cubit<TravelAssistantState> {
  TravelAssistantCubit() : super(TravelAssistantInitial());

  //var openAI;

  StreamSubscription? subscription;

  TextEditingController chatController = TextEditingController();
  final ScrollController controller = ScrollController();

  List<ChatMessageModel> messages = [
    // TODO : make the name dynamic
    ChatMessageModel(
        messageContent: 'Hi Abanob Ashraf', messageType: 'receiver'),
    ChatMessageModel(
        messageContent: 'I’m TATA your Travel Assistant Bot',
        messageType: 'receiver'),
    ChatMessageModel(
        messageContent: 'I will recommend the Right Trip for you?',
        messageType: 'receiver'),
    ChatMessageModel(
      messageContent: 'last',
      messageType: 'receiver',
    ),
  ];

  void addMessageInChat(messageContent, messageType) {
    emit(AddMessageToListLoading());
    if (chatController.text != null) {
      if (messageType == 'receiver') {
        messages.add(ChatMessageModel(
            messageContent: messageContent, messageType: messageType));
        chatController.clear();
        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );

        emit(AddMessageToListSuccess());
      } else {
        // TODO : i'll get message and add it to messages list []
      }
    }
  }

/*Future<Map<String, dynamic>> sendChatRequest(String message) async {
    final apiKey = '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';
    final apiUrl = 'https://api.openai.com/v1/completions';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        /*'messages': [
          {'role': 'user', 'content': message},
        ],*/
        "model": "text-davinci-003",
        "prompt": "Say this is a test"
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      print(response.statusCode);
      throw Exception('Failed to send chat request');
    }
  }*/

/*void sendMessage(String message) async {
    try {
      final response = await sendChatRequest(message);
      // Process the response as needed
      print(response);
    } catch (e) {
      print('Error: $e');
    }
  }*/

// void sendMessage() async {
//   emit(SendMessageLoading());
//   messages.add(
//     ChatMessageModel(
//       messageContent: chatController.text.trim(),
//       messageType: 'sender',
//     ),
//   );
//   emit(AddMyMessageToMessages());
//
//   // final request = CompleteRe
// }
//
// init() {
//   openAI = OpenAI.instance.build(
//     token: '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',
//     baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 15)),
//     enableLog: true,
//   );
//   print('finish init');
// }
//
// end() {
//   subscription!.cancel();
// }
//
// void completeWithSSE() {
//   final request = CompleteText(
//       prompt: "Hello?", maxTokens: 200, model: Model.textDavinci3);
//   openAI.onCompletionSSE(request: request).listen((it) {
//     debugPrint(it.choices.last.text);
//   });
// }
}
/*
                    messageReceiver('Hi Abanob Ashraf'),
                    messageReceiver('I’m TATA your Travel Assistant Bot'),
                    messageReceiver('I will recommend the Right Trip for you?'),
                    messageReceiver('last'),
 */
