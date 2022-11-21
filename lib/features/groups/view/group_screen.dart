import 'package:beck_booking/features/groups/view/group_activity_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controller/group_controller.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.read<GroupController>().getGroups(
            {'UserType': "Customer", 'SkipCount': 0, "MaxResultCount": 10}),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var group = snapshot.data![index];
                return ListTile(
                  onTap: () => Get.to(GroupActivityListScreen(
                    groupId: group.id!,
                  )),
                  title: Text(group.name ?? ''),
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
