import 'package:compass_app/Shared/cubit/user_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Constants/constants.dart';
import '../../Shared/cubit/app_cubit.dart';
import '../../main.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileCubitState>(
      listener: (context, state) {
        if (state is GetProfileErrorState) {
          Future.delayed(Duration(milliseconds: 1300)).then((value) {
            navigateToAndFinish(context, home);
          });
        }
        if (state is GetProfileSuccessState) {
          AppCubit.get(context).getFeedArticles();
          navigateToAndFinish(context, home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Image.asset('assets/images/app_Logo.jfif')),
          backgroundColor: HexColor('#0F1D37'),
        );
      },
    );
  }
}
