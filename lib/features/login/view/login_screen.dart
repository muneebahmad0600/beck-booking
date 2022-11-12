import 'package:beck_booking/core/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/fields.dart';
import '../controller/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = Get.find<LoginController>();
  final loginFormKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.isTenantAvailable();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        centerTitle: true,
        title: const Text('Login', style: TextStyle(fontSize: 20)),
      ), */
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: Height.fullHeight(context) / 2,
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: loginFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                    child: Fields.getTextField(
                        userNameController, 'User Name', false, Icons.email)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    child: Fields.getTextField(
                        passwordController, 'Password', true, Icons.password)),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 60,
                  child: TextButton(
                    style: btnStyle(),
                    onPressed: () {
                      _loginController.login(
                          userNameController.text, passwordController.text);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
