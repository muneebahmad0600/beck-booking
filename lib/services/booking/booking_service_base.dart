import 'package:beck_booking/core/models/booking/booking_comment_input.dart';
import 'package:beck_booking/core/models/response/base_response.dart';

abstract class BookingServiceBase {
  Future<BaseResponse> getBookings(Map<String, dynamic> params);
  Future<BaseResponse> getBookingById(String id);
  Future<BaseResponse> getBookingComments(String id);
  Future<BaseResponse> addComment(BookingCommentInput comment);
}
