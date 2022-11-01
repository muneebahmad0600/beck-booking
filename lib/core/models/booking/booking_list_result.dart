import 'booking_result.dart';

class BookingListResult {
  int? totalCount;
  List<BookingResult>? items;

  BookingListResult({this.totalCount, this.items});

  BookingListResult.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['items'] != null) {
      items = <BookingResult>[];
      json['items'].forEach((v) {
        items!.add(BookingResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
