import 'dart:async';

import 'package:beck_booking/core/common/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/fields.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthController _controller;
  final _formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool loading = false;

  _LoginScreenState() {
    Get.put(AuthController());
    _controller = Get.find<AuthController>();
  }

  @override
  void initState() {
    super.initState();
    _controller.isTenantAvailable();
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
      body: Container(
        alignment: Alignment.center,
        child: Container(
          height: Height.fullHeight(context) / 2,
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: _formKey,
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
                  userNameController,
                  'User Name',
                  false,
                  Icons.email_outlined,
                )),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    child: Fields.getTextField(
                  passwordController,
                  'Password',
                  true,
                  Icons.password,
                )),
                const SizedBox(
                  height: 30,
                ),
                AnimatedCrossFade(
                  firstChild: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                      style: btnStyle(),
                      onPressed: _handleLogin,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  secondChild: const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  crossFadeState: loading
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      _controller
          .login(
        userNameController.text,
        passwordController.text,
      )
          .then((value) {
        setState(() {
          loading = false;
        });
        if (value) {
          Timer(const Duration(milliseconds: 700), () {
            Get.offAllNamed('/main');
          });
        }
      });
    }
  }
}
