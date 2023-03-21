import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part './create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitial());
}
