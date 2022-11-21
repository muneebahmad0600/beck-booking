import 'package:beck_booking/features/login/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/booking_controller.dart';
import 'booking_detail_screen.dart';

class BookingsScreen extends StatelessWidget {
  BookingsScreen({Key? key}) : super(key: key) {
    Get.put(BookingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AuthController>(
          init: Get.find<AuthController>(),
          builder: (authController) {
            return GetBuilder<BookingController>(
                init: Get.find<BookingController>(),
                builder: (controller) {
                  return FutureBuilder(
                    future: controller.getBookings({
                      'UserType': authController.session?.user?.userTypeId == 1
                          ? 'Employee'
                          : 'Customer',
                      'IsAdmin': false,
                      'SkipCount': 0,
                      "MaxResultCount": 10
                    }),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                          padding: const EdgeInsets.all(16.0),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var booking = snapshot.data![index];
                            return Card(
                              elevation: 5.0,
                              child: ListTile(
                                onTap: () => Get.to(() => BookingDetailScreen(
                                      booking: booking,
                                    )),
                                title: Text(
                                    '${DateFormat('MMM dd, yyyy').format(DateTime.parse(booking.fromDate!))} - ${DateFormat('MMM dd, yyyy').format(DateTime.parse(booking.toDate!))}'),
                                subtitle: Text(booking.bookingStatus!),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  );
                });
          }),
    );
  }
}
