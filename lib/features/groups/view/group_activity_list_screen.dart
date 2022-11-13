import 'package:beck_booking/features/groups/controller/group_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GroupActivityListScreen extends StatelessWidget {
  final int groupId;
  const GroupActivityListScreen({Key? key, required this.groupId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<GroupController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Group Invites"),
      ),
      body: FutureBuilder(
        future: controller.getGroupInvites({'Id': groupId}),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var activity = snapshot.data![index];
                var comingList = [];
                var notComingList = [];
                var noAnswerList = [];
                for (var response in activity.responses!) {
                  switch (response.response) {
                    case 0:
                      comingList.add(response);
                      break;
                    case 1:
                      notComingList.add(response);
                      break;
                    case 2:
                      noAnswerList.add(response);
                      break;
                  }
                }
                return Card(
                  child: ListTile(
                    title: Text(activity.activity?.name ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormat('MMM dd, yyyy')
                            .format(DateTime.parse(activity.activity!.date!))),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7.0),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                noAnswerList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                color: Colors.blue[300],
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                comingList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(7.0),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                notComingList.length.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
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
