part of 'sign_in_and_sign_up_cubit.dart';

@immutable
abstract class SignInAndSignUpState {}

class SignInAndSignUpInitial extends SignInAndSignUpState {}

class ToggleToLoginSuccess extends SignInAndSignUpState {}
class ToggleToLoginLoading extends SignInAndSignUpState {}
class ToggleToSignupSuccess extends SignInAndSignUpState {}
class ToggleToSignupLoading extends SignInAndSignUpState {}