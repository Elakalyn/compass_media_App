import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubit.dart';

class Host extends StatelessWidget {
  const Host({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: AppCubit.get(context).screens[AppCubit.get(context).indexs],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              currentIndex: AppCubit.get(context).indexs,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                AppCubit.get(context).changeIndex(index);
              },
              selectedLabelStyle: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.normal,
              ),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.circle), label: 'Global'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ]),
        );
      },
    );
  }
}
