import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'Modules/Authentication/login.dart';
import 'Modules/Host/host.dart';
import 'Network/Local/cacheHelper.dart';
import 'Shared/Constants/constants.dart';
import 'cubit/app_cubit.dart';
import 'cubit/user_profile_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    Widget home;
    if (uid != null) {
      home = const Host();
    } else {
      home = LoginScreen();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getPopularSearchHeadlines(),
        ),
        BlocProvider(
          create: (context) => UserProfileCubit()..getProfile(),
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
            home: home,
          );
        },
      ),
    );
  }
}
