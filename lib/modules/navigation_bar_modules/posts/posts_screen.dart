import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/shimmer/post_shimmer.dart';
import 'package:kemet/models/place_hint.dart';
import 'package:kemet/modules/navigation_bar_modules/posts/posts_cubit.dart';
import 'package:kemet/modules/widgets/post_widgets.dart';

import '../../../models/post_model.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //TODO:build the header of the page,
          BlocProvider(
            create: (context) => PostsCubit(),
            child: Container(
              color: AppColors.grey,
              child: BlocBuilder<PostsCubit, PostsState>(
                builder: (context, state) {
                  var myBlok = BlocProvider.of<PostsCubit>(context);
                  if (state is GetPostsLoading) {
                    return Column(
                      children: const [
                        PostShimmer(),
                        PostShimmer(),
                      ],
                    );
                  }
                  if (state is GetPostsSuccess) {
                    return Column(
                      children: [
                        for (int i = 0; i < myBlok.postsList.length; i++)
                          post(
                            context,
                            myBlok.postsList[i],
                            PlaceHint(
                              id: 25,
                              name: "place name",
                              image:
                                  "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png",
                              text:
                                  'كانت تجربة اكثر من رائعة لما زورت مصر القديمة كلها من اول مسجد عمرو بن العاص لحد الكنيسة المعلقة وكنيسة مارجرس الأسواق هناك حاجة تحفة وبتمني اكرر الزيارة دي تاني ♥️ ولو حد عنده أماكن تانية زي دي ياريت يقول ؟',
                            ),
                          ),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      PostShimmer(),
                      PostShimmer(),
                      post(
                        context,
                        Post(
                          id: 12,
                          userName: 'userName',
                          postedAt: '2012-02-27 13:27:00',
                          commentsCount: 5,
                        ),
                        PlaceHint(
                          id: 25,
                          name: "place name",
                          image:
                              "https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png",
                          text:
                              'كانت تجربة اكثر من رائعة لما زورت مصر القديمة كلها من اول مسجد عمرو بن العاص لحد الكنيسة المعلقة وكنيسة مارجرس الأسواق هناك حاجة تحفة وبتمني اكرر الزيارة دي تاني ♥️ ولو حد عنده أماكن تانية زي دي ياريت يقول ؟',
                        ),
                      ),
                    ],
                  );
                  return const Text(AppStringsInEnglish.oops);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
