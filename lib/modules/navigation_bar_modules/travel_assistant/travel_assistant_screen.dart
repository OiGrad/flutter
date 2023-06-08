import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/navigation.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/modules/navigation_bar/home_screen_and_navigation_bar.dart';

//TODO: create the screen.
class TravelAssistantView extends StatefulWidget {
  const TravelAssistantView({super.key});

  @override
  State<TravelAssistantView> createState() => _TravelAssistantViewState();
}

class _TravelAssistantViewState extends State<TravelAssistantView> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {
            navigateToAndReplacement(context,const HomeScreenAndNavigationBar() ,);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/ai_icon.png',
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            const Text(
              AppStringsInEnglish.bot,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            children: [
              messageReceiver('Hi Abanob Ashraf'),
              messageReceiver('I’m TATA your Travel Assistant Bot'),
              messageReceiver('I will recommend the Right Trip for you?'),
              messageSender('Awesome 😍!'),
              messageReceiver('What\'s your budget for the trip?'),
              messageSender('1000/300 EGP'),
              messageReceiver(
                  'Are you traveling alone or with friends/family?'),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.grey, width: 2)),
                padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
                height: 60,
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Type Something",
                            hintStyle: TextStyle(color: Colors.black54),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.black,
                      elevation: 0,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget messageSender(message) {
    return Container(
      padding: const EdgeInsets.only(left: 100, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(0),
            ),
            color: AppColors.primary,
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            message,
            style: const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget messageReceiver(message) {
    return Container(
        padding:
            const EdgeInsets.only(left: 14, right: 100, top: 10, bottom: 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(20),
              ),
              color: Colors.grey.shade200,
            ),
            padding: const EdgeInsets.all(16),
            child: Text(
              message,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ));
  }
}

class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({required this.messageContent, required this.messageType});
}
