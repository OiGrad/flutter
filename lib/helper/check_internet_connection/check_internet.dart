import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kemet/modules/%20login_and_signup/sign_in_and_sign_up_screen.dart';

import '../../modules/ login_and_signup/sign_in_and_sign_up_cubit.dart';
import 'cubit/internet_connection_check_cubit.dart';
import 'no_internet_page.dart';

void checkInternet(state, context) {
  if (state is InternetConnectionError) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const NoInternetPage()));
  }
  if (state is InternetConnectionSuccess) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const SignPage()));
  }
}
