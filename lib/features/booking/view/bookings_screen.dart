import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/booking_controller.dart';
import 'booking_detail_screen.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingController>();
    return Scaffold(
      body: FutureBuilder(
        future: controller.getBookings(
            {'UserType': "Customer", 'SkipCount': 0, "MaxResultCount": 10}),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var booking = snapshot.data![index];
                return ListTile(
                  onTap: () => Get.to(BookingDetailScreen(
                    booking: booking,
                  )),
                  title: Text(
                      '${DateFormat('MMM dd, yyyy').format(DateTime.parse(booking.fromDate!))} - ${DateFormat('MMM dd, yyyy').format(DateTime.parse(booking.toDate!))}'),
                  subtitle: Text(booking.bookingStatus!),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
