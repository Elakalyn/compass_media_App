import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../Shared/cubit/app_cubit.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: AppCubit.get(context).screens[AppCubit.get(context).indexs],
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: NavigationBar(
              backgroundColor: HexColor('0F1D37'),
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined, color: Colors.white),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home_outlined, color: Colors.black),
                ),
                NavigationDestination(
                  icon: Icon(Icons.public, color: Colors.white),
                  label: 'Global',
                  selectedIcon: Icon(Icons.public, color: Colors.black),
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings, color: Colors.white),
                  label: 'Settings',
                  selectedIcon: Icon(Icons.settings, color: Colors.black),
                ),
              ],
              selectedIndex: AppCubit.get(context).indexs,
              onDestinationSelected: (index) {
                AppCubit.get(context).changeIndex(index, context);
              },
            ),
          ),
        );
      },
    );
  }
}

//               selectedItemColor: Colors.black,
//               currentIndex: AppCubit.get(context).indexs,
//               type: BottomNavigationBarType.fixed,
//               onTap: (index) {
//                 AppCubit.get(context).changeIndex(index);
//               },
//               selectedLabelStyle: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.bold,
//               ),
//               unselectedLabelStyle: const TextStyle(
//                 fontFamily: 'Inter',
//                 fontWeight: FontWeight.normal,
//               ),
//               items: const [
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.home), label: 'Home'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.circle), label: 'Global'),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.settings), label: 'Settings'),
//               ]),