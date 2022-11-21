import 'package:beck_booking/core/models/booking/booking_comment_input.dart';
import 'package:beck_booking/core/models/booking/booking_comments_list_result.dart';
import 'package:beck_booking/core/models/booking/booking_detail_result.dart';
import 'package:beck_booking/core/models/booking/booking_result.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../controller/booking_controller.dart';

class BookingDetailScreen extends StatefulWidget {
  final BookingResult booking;
  const BookingDetailScreen({Key? key, required this.booking})
      : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
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
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: FutureBuilder(
          future: context
              .read<BookingController>()
              .getBookingById(widget.booking.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var booking = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getBookingDetail(booking),
                    _getBookingResponseSection(),
                    _getCommentSection(booking),
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

  Widget _getBookingDetail(BookingDetailResult? booking) {
    return Column(
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
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
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
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
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
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 20.0),
                  Text(booking.bookingStatus ?? '')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _getBookingResponseSection() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.green),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Accept",
                style: TextStyle(color: Colors.green),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.red),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Reject",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getCommentSection(BookingDetailResult? booking) {
    return Column(
      children: [
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
        _addCommentSection(booking),
        const SizedBox(height: 10.0),
        // _getCommentList(booking)
      ],
    );
  }

  TextFormField _addCommentSection(BookingDetailResult? booking) {
    return TextFormField(
      minLines: 1,
      maxLines: 3,
      controller: commentController,
      decoration: InputDecoration(
        labelText: "Comment",
        hintText: "Add a Comment",
        suffix: GestureDetector(
          onTap: () {
            if (commentController.text.trim() != '') {
              context
                  .read<BookingController>()
                  .addComment(
                    BookingCommentInput(
                      activityId: booking!.activityId,
                      commentText: commentController.text.trim(),
                    ),
                  )
                  .then((value) => {
                        if (value)
                          setState(() {
                            commentController.text = '';
                          })
                      });
            }
          },
          child: const Icon(Icons.send_rounded),
        ),
      ),
    );
  }

  FutureBuilder<BookingCommentListResult> _getCommentList(
      BookingDetailResult? booking) {
    return FutureBuilder(
        future: context
            .read<BookingController>()
            .getBookingComments(booking!.activityId.toString()),
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
        });
  }
}
