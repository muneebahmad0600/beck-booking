import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: ((controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title),
          ),
          drawer: Drawer(
            child: ListView(
              children: controller.drawerItems
                  .map(
                    (e) => ListTile(
                      leading: Icon(e.icon),
                      title: Text(e.title),
                      onTap: () {
                        controller
                            .onItemClick(controller.drawerItems.indexOf(e));
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          body: controller.drawerItems[controller.index].screen,
        );
      }),
    );
  }
}
