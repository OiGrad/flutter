import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../models/comment_model.dart';

class CommentWidget extends StatefulWidget {
  Comment comment;
  CommentWidget(this.comment, {super.key});

  @override
  State<CommentWidget> createState() => _CommentWidgetState(comment);
}

class _CommentWidgetState extends State<CommentWidget> {
  final Comment comment;
  _CommentWidgetState(this.comment);
  bool showReplays = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commentHeader(comment.userName, comment.commentedAt),
        Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Divider(
                thickness: 2,
                color: AppColors.primary,
              ),
              Column(
                children: [
                  Text(comment.comment),
                  Row(
                    children: [
                      comment.hasReplays
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  showReplays = !showReplays;
                                });
                              },
                              child: Text(
                                showReplays
                                    ? AppStringsInEnglish.hideReplaye
                                    : AppStringsInEnglish.showReplaye,
                                style: TextStyle(color: AppColors.primary),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  showReplays
                      ?
                      //TODO:show the replays,
                      const SizedBox()
                      : const SizedBox()
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

Widget commentHeader(String userName, commentedAt) {
  String commentedSince = timeago.format(DateTime.parse(commentedAt));
  //TODO: process commentedAt to get commentedSince
  return Row(
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/images/account_avatar.png',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(userName),
              //TODO: build the expanded icon button for 'the list of post actions'
            ],
          ),
          Text(
            commentedSince,
            style: const TextStyle(
              fontFamily: 'Lexend Deca',
              color: Color(0xFF95A1AC),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      )
    ],
  );
}
