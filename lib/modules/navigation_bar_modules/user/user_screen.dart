import 'package:flutter/material.dart';
import 'package:kemet/modules/widgets/user_screen_widgets.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          headerOfProfile(context),
          bodyOfProfile(context,(){}),
          profilePicture(context),
          changeProfilePictureIcon(context,(){print('object');}),
        ],
      ),
    );
  }
}
