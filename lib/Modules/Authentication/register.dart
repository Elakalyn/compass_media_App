import 'package:compass_app/Modules/Authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

import '../../Shared/Components/components.dart';
import '../../cubit/app_cubit.dart';
import '../Host/host.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();
var formKey = GlobalKey<FormState>();
Widget suffixWidgetPassword = const Icon(
  Icons.visibility,
  color: Colors.white,
);
bool fieldStatus = true;
Widget? suffixWidgetEmail = null;

var usernameController = TextEditingController();
var confirmPasswordController = TextEditingController();

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Logo(size: 100.0),
                        const SizedBox(height: 40.0),
                        const Text(
                          'Get Connected',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        20.h,
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(children: [
                              TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Username cannot be left empty.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
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
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password cannot be left empty.';
                                  }
                                  return null;
                                },
                                obscureText: AppCubit.get(context).isViewable,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      AppCubit.get(context).changeViewable();
                                    },
                                    child: const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field cannnot be left empty.';
                                  }
                                  if (value.toString() !=
                                      passwordController.text) {
                                    return 'Please recheck your password before proceeding.';
                                  }
                                  return null;
                                },
                                obscureText: AppCubit.get(context).isViewable,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      AppCubit.get(context).changeViewable();
                                    },
                                    child: const Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.3),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              const SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AppCubit.get(context).register(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        context: context,
                                        name: usernameController.text);
                                  }
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: HexColor('#0F1D37'),
                                  ),
                                ),
                              ),
                              24.h,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  8.w,
                                  GestureDetector(
                                    onTap: () {
                                      navigateTo(context, LoginScreen());
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                            ]))
                      ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buttonLoad = createAccountButton(
    formKey: formKey,
    emailController: emailController,
    usernameController: usernameController,
    passwordController: passwordController);

class createAccountButton extends StatelessWidget {
  const createAccountButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState!.validate()) {
          buttonLoad = CircleAvatar();
          AppCubit.get(context).register(
            context: context,
            email: emailController.text,
            name: usernameController.text,
            password: passwordController.text,
          );
        }
      },
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      ),
      child: Text(
        'CREATE YOUR ACCOUNT',
      ),
    );
  }
}
