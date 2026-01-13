import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:final_project/core/resources/app_buttons.dart';
import 'package:final_project/core/resources/app_colors.dart';
import 'package:final_project/core/resources/app_field.dart';
import 'package:final_project/core/resources/app_loading.dart';
import 'package:final_project/core/resources/app_main_image.dart';
import 'package:final_project/core/resources/app_password_field.dart';
import 'package:final_project/features/home_nav/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/snack_bar.dart';
import '../auth_cubit.dart';
import '../register/view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..login(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            mySnackBar(
              msg: state.errMsg,
              context: context,
              type: AnimatedSnackBarType.error,
            );
          }
          if (state is LoginSuccess) {
            mySnackBar(
              msg: "Login Successfully",
              context: context,
              type: AnimatedSnackBarType.success,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeNav()),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<AuthCubit>();
          if (state is LoginLoading) {
            return SizedBox(
              height: 150,
              child: Center(
                child: Lottie.asset("assets/json/loading.json"),
              ),
            );;
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 3,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MainImage(),
                      SizedBox(height: 25),
                      AppField(label: "User Name", hint: "Enter your username", controller: cubit.usernameController,),
                      SizedBox(height: 10),
                      PasswordField(
                        label: "Password",
                        hint: "Enter your password",
                        controller: cubit.passwordController,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                                side: BorderSide(
                                  color: Color(0xff0A97B0),
                                  width: 1,
                                ),
                              ),
                              Text("Remember me"),
                            ],
                          ),
                          Text(
                            "Forget password?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),

                      MainButton(text: "Login", onPressed: () => cubit.login()),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: TextStyle(
                              color: Color(AppColors.textFieldColor),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Register()),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
