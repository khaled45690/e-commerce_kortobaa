import 'package:ecommerce_kortobaa/StateManagement/Favorite/FavoriteData.dart';
import 'package:ecommerce_kortobaa/Utilities/GlobalController.dart';
import 'package:ecommerce_kortobaa/src/Features/MainScreen/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'StateManagement/Cart/CartData.dart';
import 'StateManagement/UserData/UserData.dart';
import 'Utilities/Prefs.dart';
import 'src/Features/Authentication/Authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Prefs.init();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<FavoriteCubit>(
          create: (BuildContext context) => FavoriteCubit(),
        ),
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [
          Locale('en', ''),
          Locale('ar', ''),
        ],
        fallbackLocale: const Locale('en', ''),
        startLocale: const Locale('en', ''),
        saveLocale: true,
        path: 'assets/lang',
        child: const MyApp(),
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map? userData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<FavoriteCubit>().getFavoriteFromPref();
    context.read<CartCubit>().getCartDataFromPref();
    userData = context.read<UserCubit>().getUserDataFromPref();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'kortoba Ecommerce',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff0000CE)),
            ),
          ),
          primaryIconTheme: const IconThemeData(
            color: Colors.black,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(251, 237, 237, 250),
          fontFamily: "Tajawal",
        ),
        home:
            userData == null ? const Authentication(true) : const MainScreen());
  }
}
