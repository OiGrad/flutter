import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/end_points.dart';
import 'package:kemet/helper/remote/dio_helper.dart';
import 'package:kemet/models/post_model.dart';
import 'package:kemet/modules/create_post/create_post_screen.dart';
import 'package:kemet/modules/widgets/snackbar_widget.dart';
import 'package:meta/meta.dart';

import '../../../core/navigation.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<Post> postsList = [];

  void getPosts(context) async {
    bool goodToGo = false;
    double contentLength = double.infinity;
    emit(GetPostsLoading());
    await DioHelper.getData(
        url: AppEndPoints.getPosts,
        onreceivProgres: (int received, int total) {
          if (total != null) {
            if (received == contentLength) {
              goodToGo = true;
            }
          }
        }).then((value) async {
      contentLength = double.parse(value.headers.map['content-length']![0]);
      await value.data['results'].forEach((val) async {
        print('...................');
        print(await (await (await val)['body']));
      });

      if (!goodToGo) {
        return;
      }

      value.data['results'].forEach((val) {
        print('...................');
        print(val);
        postsList.add(Post.fromJson(val));
      });
      emit(GetPostsSuccess());
    }); /*.catchError((e) {
      emit(GetPostsError());
      showSnackBar(
          context: context,
          text: e.toString(), //AppStringsInEnglish.getPostError,
          clr: AppColors.error);
    });*/
  }

  addPost(Post post) {
    postsList.add(post);
    emit(GetPostsSuccess());
  }

  void goToCtreatePost(context) {
    navigateTo(context, const CreatePost());
    emit(GoingToCreatePostScreenSuccess());
  }
}
