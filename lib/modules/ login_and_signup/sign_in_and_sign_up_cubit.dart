import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kemet/core/navigation.dart';
import 'package:kemet/modules/OTP/otp_screen.dart';
import 'package:kemet/modules/navigation_bar/home_screen_and_navigation_bar.dart';
import 'package:meta/meta.dart';

part 'sign_in_and_sign_up_state.dart';

class SignInAndSignUpCubit extends Cubit<SignInAndSignUpState> {
  SignInAndSignUpCubit() : super(SignInAndSignUpInitial());

  var emailLoginController = TextEditingController();
  var passwordLoginController = TextEditingController();

  var usernameSignupController = TextEditingController();
  var emailSignupController = TextEditingController();
  var passwordSignupController = TextEditingController();
  var phoneSignupController = TextEditingController();

  // bool loginSelected = false;
   toggleToLogin(){
    // loginSelected = true;
    emit(ToggleToLoginSuccess());
  }
   toggleToSignUp(){
    // loginSelected = false;
    emit(ToggleToSignupSuccess());
  }

  testGoToOTP(context){
     navigateTo(context,const OTPScreen());
  }

  testGoToNavigationBar(context){
    navigateTo(context,const HomeScreen());
  }



}
