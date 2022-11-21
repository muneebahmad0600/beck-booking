import 'package:beck_booking/core/models/booking/booking_comment_input.dart';
import 'package:beck_booking/core/models/booking/booking_comments_list_result.dart';
import 'package:beck_booking/core/models/booking/booking_list_result.dart';
import 'package:beck_booking/core/models/booking/booking_result.dart';
import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:beck_booking/services/booking/booking_service.dart';
import 'package:get/get.dart';

import '../../../core/models/booking/booking_detail_result.dart';
import '../../../core/widgets/dialog.dart';

class BookingController extends GetxController {
  final _bookingService = BookingService();

  List<BookingResult> bookings = [];

  Future<List<BookingResult>> getBookings(Map<String, dynamic> params) async {
    try {
      BaseResponse response = await _bookingService.getBookings(params);
      if (response.success!) {
        var result = BookingListResult.fromJson(response.result);
        bookings = result.items ?? [];
        update();
      }
      return bookings;
    } on Exception {
      displaySnackbar('Error!', 'Error fetching bookings');
    }
    return bookings;
  }

  Future<BookingDetailResult> getBookingById(String id) async {
    try {
      BaseResponse response = await _bookingService.getBookingById(id);
      if (response.success!) {
        var booking = BookingDetailResult.fromJson(response.result);
        return booking;
      }
      return BookingDetailResult();
    } on Exception {
      displaySnackbar('Error!', 'Error fetching bookings');
    }
    return BookingDetailResult();
  }

  Future<BookingCommentListResult> getBookingComments(String id) async {
    try {
      BaseResponse response = await _bookingService.getBookingComments(id);
      if (response.success!) {
        var booking = BookingCommentListResult.fromJson(response.result);
        return booking;
      }
      return BookingCommentListResult();
    } on Exception {
      displaySnackbar('Error!', 'Error fetching bookings');
    }
    return BookingCommentListResult();
  }

  Future<bool> addComment(BookingCommentInput comment) async {
    try {
      BaseResponse response = await _bookingService.addComment(comment);
      if (response.success!) {
        displaySnackbar("Success", "Comment added successfully!");
        return true;
      }
      return false;
    } on Exception {
      displaySnackbar('Error!', 'Error Placing Comment');
    }
    return false;
  }
}
