import 'package:beck_booking/core/models/booking/booking_comment_input.dart';
import 'package:beck_booking/core/models/booking/booking_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/booking_controller.dart';

class BookingDetailScreen extends StatefulWidget {
  final BookingResult booking;
  const BookingDetailScreen({Key? key, required this.booking})
      : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  final controller = Get.find<BookingController>();
  late TextEditingController commentController;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Detail"),
      ),
      body: FutureBuilder(
          future: controller.getBookingById(widget.booking.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var booking = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.info_rounded),
                        SizedBox(width: 5),
                        Text(
                          "Booking Information",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                "Start Date:",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(width: 20.0),
                              Text(DateFormat('MMM dd, yyyy')
                                  .format(DateTime.parse(booking!.fromDate!)))
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              const Text(
                                "End Date:",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(width: 20.0),
                              Text(DateFormat('MMM dd, yyyy')
                                  .format(DateTime.parse(booking.toDate!)))
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            children: [
                              const Text(
                                "Booking Status:",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(width: 20.0),
                              Text(booking.bookingStatus ?? '')
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: const [
                        Icon(Icons.comment),
                        SizedBox(width: 5),
                        Text(
                          "Comments",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      minLines: 1,
                      maxLines: 3,
                      controller: commentController,
                      decoration: InputDecoration(
                        labelText: "Comment",
                        hintText: "Add a Comment",
                        suffix: GestureDetector(
                          onTap: () {
                            controller
                                .addComment(
                                  BookingCommentInput(
                                    activityId: booking.activityId,
                                    commentText: commentController.text.trim(),
                                  ),
                                )
                                .then((value) => {
                                      if (value)
                                        setState(() {
                                          commentController.text = '';
                                        })
                                    });
                          },
                          child: const Icon(Icons.send_rounded),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    FutureBuilder(
                        future: controller
                            .getBookingComments(booking.activityId.toString()),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data!.items?.length,
                                  itemBuilder: (context, index) {
                                    var comment = snapshot.data!.items![index];
                                    return ListTile(
                                      leading: const Icon(Icons.account_circle),
                                      title: Text(comment.commentText ?? ''),
                                    );
                                  }),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        })
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }),
    );
  }
}
