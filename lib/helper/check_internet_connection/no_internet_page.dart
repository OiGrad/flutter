import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet/modules/%20login_and_signup/sign_in_and_sign_up_cubit.dart';
import 'package:kemet/modules/%20login_and_signup/sign_in_and_sign_up_screen.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInAndSignUpCubit, SignInAndSignUpState>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () {
            if(state is InternetConnectionSuccess){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignPage()));
            }
            return Future.delayed(Duration(seconds: 0));
          },
          child: Scaffold(
            body: ListView(
            
              children: const [
                Center(
                  child: Text("No Internet"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
