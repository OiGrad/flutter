import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/modules/comments/comments_cubit.dart';

import '../../core/colors.dart';
import '../../core/strings.dart';
import '../../helper/shimmer/comment_shimmer.dart';
import '../../models/comment_model.dart';
import '../widgets/comment_widgets.dart';
import '../widgets/snackbar_widget.dart';
import '../widgets/widgets.dart';

class CommentSection extends StatelessWidget {
  final String parentType;
  final int parentId;
  const CommentSection(
      {required this.parentId, required this.parentType, super.key});

  @override
  Widget build(BuildContext context) {
    String? validator(String? value) {
      if (value == null || value.isEmpty) {
        return AppStringsInEnglish.commentInputLable;
      }
      return null;
    }

    TextEditingController controller = TextEditingController();
    return BlocProvider(
      create: (context) =>
          CommentsCubit()..getComments(context, parentId, parentType),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: defaultTextFormField(
              validator: validator,
              textInputType: TextInputType.multiline,
              isPassword: false,
              controller: controller,
              label: AppStringsInEnglish.commentInputLable,
              arabic: true,
              maxLines: 3,
              iconButton: IconButton(
                onPressed: () {
                  //TODO: save the comment and reload comments
                },
                icon: Icon(
                  Icons.send_rounded,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          BlocBuilder<CommentsCubit, CommentsState>(
            builder: (context, state) {
              var myBloc = BlocProvider.of<CommentsCubit>(context);
              if (state is GetCommentsLoading) {
                return ListView(
                  shrinkWrap: true,
                  children: const [
                    CommentShimmer(),
                    CommentShimmer(),
                  ],
                );
              } else if (state is GetCommentsSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: myBloc.commentsList.length,
                  itemBuilder: (context, index) {
                    return CommentWidget(myBloc.commentsList[index]);
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
