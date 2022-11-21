import 'package:beck_booking/core/common/color.dart';
import 'package:beck_booking/features/login/controller/auth_controller.dart';
import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key) {
    Get.put(MainController());
    Get.put(AuthController());
  }

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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 150,
                                width: double.infinity,
                                child: DrawerHeader(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: whiteColor),
                                  ),
                                  child: Image.network(
                                    authController.session?.company?.logoUrl ??
                                        '',
                                  ),
                                ),
                              ),
                              Text(
                                authController.session?.user?.userName ?? '',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                authController.session?.user?.emailAddress ??
                                    '',
                                style: const TextStyle(),
                              ),
                              const Divider(thickness: 2.0)
                            ],
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
