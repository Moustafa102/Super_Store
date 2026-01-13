import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:final_project/core/resources/app_buttons.dart';
import 'package:final_project/core/resources/app_colors.dart';
import 'package:final_project/core/resources/app_field.dart';
import 'package:final_project/core/resources/app_loading.dart';
import 'package:final_project/core/resources/app_main_image.dart';
import 'package:final_project/core/resources/app_password_field.dart';
import 'package:final_project/core/resources/snack_bar.dart';
import 'package:final_project/features/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../home_nav/view.dart';
import '../login/view.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..register(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterFailure) {
              mySnackBar(
                msg: state.errMsg,
                type: AnimatedSnackBarType.error,
                context: context,
              );
            }
            if (state is RegisterSuccess) {
              mySnackBar(
                msg: "Registered Successfully",
                type: AnimatedSnackBarType.success,
                context: context,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeNav()),
              );
            }
          },
          builder: (context, state) {
            final cubit = context.read<AuthCubit>();
            if (state is RegisterLoading) {
              return SizedBox(
                height: 150,
                child: Center(
                  child: Lottie.asset("assets/json/loading.json"),
                ),
              );;
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 15,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MainImage(),
                      AppField(
                        label: "User Name",
                        hint: "Enter your username",
                        controller: cubit.usernameController,
                      ),
                      AppField(
                        label: "Email",
                        hint: "user@gmail.com",
                        controller: cubit.emailController,
                      ),
                      PasswordField(
                        label: "Password",
                        hint: "Enter your password",
                        controller: cubit.passwordController,
                      ),
                      PasswordField(
                        label: "Confirm Password",
                        hint: "Confirm your password",
                        controller: cubit.confirmPasswordController,
                      ),
                      SizedBox(height: 20),
                      MainButton(
                        text: "Create account",
                        onPressed: () {
                          cubit.register();
                        },
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color: Color(AppColors.textFieldColor),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login()),
                            ),
                            child: Text(
                              "Login",
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
            );
          },
        ),
      ),
    );
  }
}
