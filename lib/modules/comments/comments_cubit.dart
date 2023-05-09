import 'package:bloc/bloc.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/helper/end_points.dart';
import 'package:kemet/helper/remote/dio_helper.dart';
import 'package:kemet/models/comment_model.dart';
import 'package:kemet/modules/widgets/snackbar_widget.dart';
import 'package:meta/meta.dart';

import '../../core/strings.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());

  List<Comment> commentsList = [];

  void getComments(context, parentId, parentType) async {
    emit(GetCommentsLoading());

    await DioHelper.getData(
      url: AppEndPoints.getComments(parentId),
    ).then((value) {
      value.data['results'].forEach((e) {
        commentsList.add(Comment.fromJson(e));
      });
      emit(GetCommentsSuccess());
    }).catchError((err) {
      emit(GetCommentsError());
      showSnackBar(
          context: context,
          text: AppStringsInEnglish.commentsError,
          clr: AppColors.error);
    });
  }
}
