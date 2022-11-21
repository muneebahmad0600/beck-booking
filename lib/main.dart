import 'package:beck_booking/core/common/color.dart';
import 'package:beck_booking/features/booking/view/bookings_screen.dart';
import 'package:beck_booking/features/groups/view/group_screen.dart';
import 'package:beck_booking/features/main/view/main_screen.dart';
import 'package:beck_booking/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'features/login/view/login_screen.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

void main() async {
  await dotenv.load(fileName: ".env");
  // GlobalBindings().dependencies();
  runApp(const MyApp());
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
          // binding: LoginBinding(),
        ),
        GetPage(
          name: '/main',
          page: () => MainScreen(),
          // binding: MainBinding(),
          children: [
            GetPage(
              name: '/booking',
              page: () => BookingsScreen(),
              // binding: BookingBinding(),
            ),
            GetPage(
              name: '/groups',
              page: () => const GroupScreen(),
              // binding: GroupBinding(),
            )
          ],
        ),
      ],
    );
  }
}
