import 'package:beck_booking/core/common/color.dart';
import 'package:beck_booking/features/booking/controller/booking_controller.dart';
import 'package:beck_booking/features/booking/view/bookings_screen.dart';
import 'package:beck_booking/features/groups/controller/group_controller.dart';
import 'package:beck_booking/features/groups/view/group_screen.dart';
import 'package:beck_booking/features/login/controller/auth_controller.dart';
import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:beck_booking/features/main/view/main_screen.dart';
import 'package:beck_booking/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'features/login/view/login_screen.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => AuthController()),
    ChangeNotifierProvider(create: (_) => MainController()),
    ChangeNotifierProvider(create: (_) => BookingController()),
    ChangeNotifierProvider(create: (_) => GroupController()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Beck Bookings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      getPages: [
        GetPage(
          name: '/splash',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: '/main',
          page: () => const MainScreen(),
          children: [
            GetPage(
              name: '/booking',
              page: () => const BookingsScreen(),
            ),
            GetPage(
              name: '/groups',
              page: () => const GroupScreen(),
            )
          ],
        ),
      ],
    );
  }
}
