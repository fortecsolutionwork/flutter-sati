import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sati/components/button.dart';
import 'package:sati/components/input.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/login/LoginControler.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            child: GetBuilder<LoginControler>(
              init: LoginControler(),
              initState: (_) {},
              builder: (_) {
                return Form(
                  key: _.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/img/saati.png",
                        height: 50,
                        width: width * .2,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Login into continue",
                        style: TextStyle(
                          color: Color(0xff828282),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 15,
                          left: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/google.svg',
                              width: width * .25,
                              height: width * .25,
                              // height: 48,
                            ),
                            SvgPicture.asset(
                              'assets/svg/fb.svg',
                              width: width * .25,
                              height: width * .25,
                            ),
                            SvgPicture.asset(
                              'assets/svg/linkedin.svg',
                              width: width * .25,
                              height: width * .25,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Text(
                          "or",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InputSati(
                        helper: "Enter Your Email ID/Mobile Number",
                        label: "Email ID/Mobile number",
                        controler: _.emailcontroler,
                      ),
                      InputSati(
                        helper: "Enter Your Password",
                        label: "Password",
                        secured: true,
                        controler: _.passcontroler,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Login with OTP",
                            style: TextStyle(
                              color: blue,
                            ),
                          ),
                          Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: blue,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _.isloading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: gold,
                              ),
                            )
                          : ButtonSati(
                              title: "Login",
                              onPress: () {
                                if (_.formKey.currentState?.validate() ==
                                    true) {
                                  _.login();
                                }
                              }),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.toNamed("/register");
                        },
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Dont have an Account?',
                                  style: TextStyle(
                                    color: grey,
                                  ),
                                ),
                                TextSpan(
                                  text: '   Sign up',
                                  style: TextStyle(
                                    color: blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
