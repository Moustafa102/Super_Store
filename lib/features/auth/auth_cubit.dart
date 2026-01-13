import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/core/network/dio_helper.dart';
import 'package:final_project/core/network/end_points.dart';
import 'package:final_project/core/resources/cache_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> register() async {
    // print("username = ${usernameController.text}");
    // print("email = ${emailController.text}");
    // print("password = ${passwordController.text}");
    // print("conpass = ${confirmPasswordController.text}");
    if (passwordController.text != confirmPasswordController.text) {
      emit(RegisterFailure("Password and Confirm Password not the same"));
      return;
    }
    if (usernameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      emit(RegisterFailure("All fields Required"));
      return;
    }
    emit(RegisterLoading());
    try {
      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.register,
        data: {
          "id": 0,
          "username": usernameController.text,
          "email": emailController.text,
          "password": passwordController.text,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(RegisterSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailure("Failed to create a user: ${e.toString()}"));
    } catch (e) {
      emit(RegisterFailure("Some error happened, call us for help"));
    }
  }

  Future login() async {
    print("username = ${usernameController.text}");
    print("password = ${passwordController.text}");
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      emit(LoginFailure("All fields mustn't be empty"));
      return;
    }
    emit(LoginLoading());
    try {
      final Response response = await DioHelper.postRequest(
        endPoint: AppEndPoints.login,
        data: {
          "username": usernameController.text,
          "password": passwordController.text,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        //print("response.data = ${response.data}");
        if (response.data != null) {
          await CacheHelper.saveToken(response.data["token"]);
          emit(LoginSuccess());

        } else {
          emit(LoginFailure("No Token Found"));
        }
      }
    }

    on DioException catch (e) {
      emit(LoginFailure("Username or Password is incorrect "));
    }
    catch (e) {
      emit(LoginFailure("Failed to sign in, try again"));
    }
  }
}
