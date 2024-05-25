import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Modules/Authentication/login.dart';
import 'Modules/Layout/layout.dart';
import 'Modules/Splash Screen/splash_screen.dart';
import 'Network/Local/cacheHelper.dart';
import 'Network/Remote/api_handling.dart';
import 'Shared/Constants/constants.dart';
import 'Shared/cubit/app_cubit.dart';
import 'Shared/cubit/user_profile_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

Widget? home;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (uid != null) {
      home = const Layout();
    } else {
      home = LoginScreen();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserProfileCubit()..getProfile(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            title: 'Compass Media',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              navigationBarTheme: NavigationBarThemeData(
                labelTextStyle: MaterialStatePropertyAll(
                  TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              fontFamily: 'Inter',
              useMaterial3: true,
              scaffoldBackgroundColor: HexColor('#0F1D37'),
              textTheme: Theme.of(context).textTheme.apply(
                    fontFamily: 'Inter',
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  backgroundColor: HexColor('#0F1D37'),
                  surfaceTintColor: Colors.transparent,
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  toolbarHeight: 88),
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
