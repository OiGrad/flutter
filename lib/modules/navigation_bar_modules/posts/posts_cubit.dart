import 'package:bloc/bloc.dart';
import 'package:kemet/core/colors.dart';
import 'package:kemet/core/strings.dart';
import 'package:kemet/helper/end_points.dart';
import 'package:kemet/helper/remote/dio_helper.dart';
import 'package:kemet/models/post_model.dart';
import 'package:kemet/modules/widgets/snackbar_widget.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  List<Post> postsList = [];

  void getPosts(context) async {
    emit(GetPostsLoading());

    await DioHelper.getData(
      url: AppEndPoints.getPosts,
    ).then((value) {
      value.data['results'].foEach((val) {
        postsList.add(Post.fromJson(val));
      });
      emit(GetPostsSuccess());
    }).catchError((e) {
      emit(GetPostsError());
      showSnackBar(
          context: context,
          text: AppStringsInEnglish.getPostError,
          clr: AppColors.error);
    });
  }
}
