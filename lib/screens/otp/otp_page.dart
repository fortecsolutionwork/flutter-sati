import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sati/components/button.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/otp/Otpcontroler.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  OtpControler otpc = Get.put(OtpControler());

  String? title = Get.arguments[0];
  String? number = Get.arguments[1];
  String? otp_id = Get.arguments[2];
  bool fromlogin = Get.arguments[3];
  String code = "";

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    otpc.dispose();
  }

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
            child: GetBuilder<OtpControler>(
              init: OtpControler(),
              initState: (_) {},
              builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      title ?? "Mobile verification",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color(0xff454242),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Enter the 6 digit OTP send to',
                      style: TextStyle(
                        color: grey,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          number.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.edit,
                          color: blue,
                          size: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: grey,
                      showFieldAsBox: true,
                      onCodeChanged: (String code) {},
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      fieldWidth: width * .12,
                      borderRadius: BorderRadius.circular(8),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: grey,
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: grey,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: width * .02,
                        ),
                      ),
                      textStyle: TextStyle(
                        fontSize: width * .08,
                        color: Colors.black,
                      ),
                      hasCustomInputDecoration: true,
                      onSubmit: (String verificationCode) {
                        _.submit(
                            verificationCode, otp_id.toString(), fromlogin);
                        setState(() {
                          code = verificationCode;
                        });
                      }, // end onSubmit
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Resend',
                                style: TextStyle(
                                  color: blue,
                                ),
                              ),
                              TextSpan(
                                text: ' Code in 30 sec',
                                style: TextStyle(
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _.loading
                        ? Center(
                            child: CircularProgressIndicator(
                              color: gold,
                            ),
                          )
                        : ButtonSati(
                            title: fromlogin
                                ? 'Login'
                                : 'Verify and create password',
                            onPress: () {},
                          )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
