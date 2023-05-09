part of 'comments_cubit.dart';

@immutable
abstract class CommentsState {}

class CommentsInitial extends CommentsState {}

class GetCommentsLoading extends CommentsState {}

class GetCommentsSuccess extends CommentsState {}

class GetCommentsError extends CommentsState {}
