import 'package:flutter/material.dart';
import 'package:kemet/data/place.dart';
import 'package:kemet/modules/widgets/post_widgets.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TODO:build the header of the page,
        post(
            context,
            Place("name",
                "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png"),
            'كانت تجربة اكثر من رائعة لما زورت مصر القديمة كلها من اول مسجد عمرو بن العاص لحد الكنيسة المعلقة وكنيسة مارجرس الأسواق هناك حاجة تحفة وبتمني اكرر الزيارة دي تاني ♥️ ولو حد عنده أماكن تانية زي دي ياريت يقول ؟')
      ],
    );
  }
}
