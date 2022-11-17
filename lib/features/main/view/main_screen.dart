import 'package:beck_booking/core/common/color.dart';
import 'package:beck_booking/features/login/controller/auth_controller.dart';
import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: Get.find<MainController>(),
      builder: ((controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(controller.title),
          ),
          drawer: SafeArea(
            child: GetBuilder<AuthController>(
                init: Get.find<AuthController>(),
                builder: (authController) {
                  return Drawer(
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: DrawerHeader(
                            decoration: const BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.grey,
                              ),
                            )),
                            child: Image.network(
                                authController.session?.company?.logoUrl ?? ''),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: controller.drawerItems.length,
                            itemBuilder: (_, i) {
                              var item = controller.drawerItems[i];
                              bool isActive = controller.index == i;
                              return ListTile(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )),
                                tileColor:
                                    isActive ? primaryColor : Colors.white,
                                dense: isActive ? false : true,
                                leading: Icon(
                                  item.icon,
                                  color: isActive ? whiteColor : greyColor,
                                ),
                                title: Text(
                                  item.title,
                                  style: TextStyle(
                                    color: isActive ? whiteColor : greyColor,
                                    fontSize: 16,
                                  ),
                                ),
                                onTap: () {
                                  controller.onItemClick(i);
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          ),
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.power_settings_new_rounded,
                            color: Colors.red,
                          ),
                          title: const Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () => authController.logout(),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  );
                }),
          ),
          body: controller.drawerItems[controller.index].screen,
        );
      }),
    );
  }
}
