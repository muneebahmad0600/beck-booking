import 'package:beck_booking/features/booking/binding/booking_binding.dart';
import 'package:beck_booking/features/booking/view/bookings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'features/login/binding/login_binding.dart';
import 'features/login/view/login.dart';

const FlutterSecureStorage storage = FlutterSecureStorage();

void main() async {
  await dotenv.load(fileName: ".env");
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
          visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => const Login(),
          binding: LoginBindings(),
        ),
        GetPage(
          name: '/bookings',
          page: () => const BookingsScreen(),
          binding: BookingBinding(),
        ),
      ],
    );
  }
}
