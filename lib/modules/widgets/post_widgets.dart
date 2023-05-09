import 'package:flutter/material.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/media_query_values.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/models/place_hint.dart';
import 'package:kemet/models/post_model.dart';
import 'package:kemet/modules/comments/comments_component.dart';
import 'package:kemet/modules/widgets/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:timeago/timeago.dart' as timeago;

Widget postPlaceCard(BuildContext context, PlaceHint place) {
  return Padding(
    padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
    child: DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(12),
      padding: const EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          width: MediaQueryValues(context).width - 40,
          child: Column(
            children: [
              PlaceInContext(context, place.name, place.image),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Text(place.text),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget post(
  BuildContext context,
  Post post,
  PlaceHint place,
) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          postHeader(post.userName, post.postedAt),
          postPlaceCard(context, place),
          PostFooter(
            postId: post.id,
            commentsCount: post.commentsCount,
          ),
        ],
      ),
    ),
  );
}

Widget postHeader(String userName, String postedAt) {
  String postedSince = timeago.format(DateTime.parse(postedAt));

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
            postedSince,
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

class PostFooter extends StatefulWidget {
  final int postId;
  final int commentsCount;
  const PostFooter(
      {required this.postId, required this.commentsCount, super.key});

  @override
  State<PostFooter> createState() => _PostFooterState(postId, commentsCount);
}

class _PostFooterState extends State<PostFooter> {
  bool showComments = false;
  final int postId;
  int commentsCount;
  _PostFooterState(this.postId, this.commentsCount);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      //TODO:write the share script
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  //TODO: add like button
                  commentsCounter(commentsCount),
                ],
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showComments = !showComments;
                  });
                },
                child: Text(
                  showComments
                      ? AppStringsInEnglish.hideComments
                      : AppStringsInEnglish.showComments,
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
        ),
        showComments
            ? CommentSection(parentId: postId, parentType: 'post')
            : const SizedBox(),
      ],
    );
  }
}
