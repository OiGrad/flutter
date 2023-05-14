import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/end_points.dart';
import 'package:kemet/helper/remote/dio_helper.dart';
import 'package:kemet/models/in_post_class.dart';
import 'package:kemet/models/place_hint.dart';
import 'package:kemet/models/post_model.dart';
import 'package:kemet/modules/%20login_and_signup/sign_in_and_sign_up_cubit.dart';
import 'package:kemet/modules/navigation_bar_modules/posts/posts_cubit.dart';
import 'package:kemet/modules/widgets/Create_post_widgets.dart';
import 'package:kemet/modules/widgets/snackbar_widget.dart';

import '../../core/constants.dart';

part './create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());

  List<dynamic> contentList = [];
  List<Widget> contentWidgetsList = [];

  final ImagePicker picker = ImagePicker();
  int nextId = 1;

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    return img;
  }

  void checkLastText() {
    if (contentList.last.type != 'text') return;
    if (contentList.last.controller.text.isEmpty) {
      contentWidgetsList.removeLast();
      contentList.removeLast();
    }
  }

  void addImage(context) async {
    checkLastText();
    XFile? image = await getImage(ImageSource.gallery);
    if (image == null) {
      return;
    }
    contentList.add(ImageInPost(image));
    contentWidgetsList.add(imageInPostWedgit(contentList.length - 1));
    addText(context, hint: AppStringsInEnglish.postTailHint);
    emit(ImageAdded());
  }

  void addPlace(context) {
    checkLastText();
    contentList.add(PlaceInPost());
    contentWidgetsList.add(SelectPlaceCard(context, contentList.length - 1));
    addText(context, hint: AppStringsInEnglish.postTailHint);
    emit(PlaceAdded());
  }

  void addText(context, {String? hint}) {
    contentList.add(TextInPost());
    contentWidgetsList.add(invisibleTextField(
      contentList[contentList.length - 1].controller,
      hint: hint,
    ));
  }

  void selectPlace(int index, PlaceHint placeHint) {
    contentList[index].placeHint = placeHint;
    emit(PlaceUpdated());
  }

  void resetContent(context) {
    contentWidgetsList = [];
    contentList = [];
    addText(context, hint: AppStringsInEnglish.addPostLable);
    emit(ContentReset());
  }

  serializePost() async {
    var serializedContent = [];
    var img;
    bool hasimage = false;
    for (var i = 0; i < contentList.length; i++) {
      var serialized = contentList[i].toJson(i + 1);
      if (serialized != null) {
        if (contentList[i].type == 'image') {
          hasimage = true;
        }
        serializedContent.add(await serialized);
        print('------------${await serialized}---------');
      }
    }
    /*print(serializedContent);
    if (hasimage) {
      return FormData.fromMap({'content': [], 'image': img});
    }*/
    return {'content': serializedContent};
  }

  void postPost(context) async {
    emit(PostPublishLoading());

    await DioHelper.postData(
      url: AppEndPoints.getPosts,
      data: await serializePost(),
    ).then(
      (value) {
        showSnackBar(
            context: context,
            text: AppStringsInEnglish.postPublished,
            clr: AppColors.green);
        emit(PostPublishSuccess());
      },
    ).catchError((e) {
      showSnackBar(
          context: context,
          text: e.toString(), //AppStringsInEnglish.errorPublishingPost,
          clr: AppColors.error);
      emit(PostPublishError());
    });
  }

  addPostDummy(context) {
    BlocProvider.of<PostsCubit>(context).addPost(Post(
        id: nextId,
        userName:
            BlocProvider.of<SignInAndSignUpCubit>(context).userModel!.name,
        postedAt: DateTime.now().toString(),
        commentsCount: '0',
        content: contentList));
    nextId++;
    showSnackBar(
        context: context,
        text: AppStringsInEnglish.postPublished,
        clr: AppColors.green);
    emit(PostPublishSuccess());
  }
}
