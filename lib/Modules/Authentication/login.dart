// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:compass_app/cubit/app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/Components/components.dart';
import '../Host/host.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Widget suffixWidgetPassword = const Icon(
    Icons.visibility,
    color: Colors.white,
  );
  bool fieldStatus = true;
  Widget? suffixWidgetEmail = null;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is LoadingLoginState) {
          fieldStatus = false;
          suffixWidgetEmail = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
          suffixWidgetPassword = const CircularProgressIndicator(
            color: Colors.white38,
            strokeWidth: 1,
          );
        } else {
          fieldStatus = true;
          suffixWidgetEmail = null;
          suffixWidgetPassword = const Icon(
            Icons.visibility,
            color: Colors.white,
          );
        }

        if (state is SuccessLoginState) {
          navigateToAndFinish(context, const Host());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Logo(size: 100.0),
                      const SizedBox(height: 40.0),
                      const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'E-mail cannot be left empty.';
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          errorStyle: TextStyle(
                            color: Color.fromARGB(255, 255, 100, 89),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be left empty.';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 100, 89),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              AppCubit.get(context).changeViewable();
                            },
                            child: suffixWidgetPassword,
                          ),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.white),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        obscureText: AppCubit.get(context).isViewable,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            AppCubit.get(context)
                                .loginUser(emailController.text,
                                    passwordController.text, context)
                                .then((value) {});
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: HexColor('#0F1D37'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
