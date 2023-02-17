import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sati/components/button.dart';
import 'package:sati/components/input.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/createpassword/password_controler.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * .05,
            ),
            child: GetBuilder<PasswordControler>(
                init: PasswordControler(),
                initState: (_) {},
                builder: (_) {
                  return Form(
                    key: _.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          "Create password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xff454242),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        InputSati(
                          helper: "Enter password",
                          label: "Password",
                          secured: true,
                          controler: _.passcontroler,
                        ),
                        InputSati(
                          helper: "Repeat password",
                          label: "Re-enter password",
                          secured: true,
                          controler: _.emailcontroler,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _.isloading
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: gold,
                                ),
                              )
                            : ButtonSati(
                                title: "Create account",
                                onPress: () {
                                  if (_.formKey.currentState?.validate() ==
                                      true) {
                                    _.submit();
                                  }
                                  // Get.toNamed("/login");
                                },
                              )
                      ],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
