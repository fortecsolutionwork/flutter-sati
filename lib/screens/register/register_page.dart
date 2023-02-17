import 'package:country_picker/country_picker.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sati/components/button.dart';
import 'package:sati/components/input.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/register/RegisterControler.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterControler reg = Get.put(RegisterControler());
  String country_code = "+91";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<RegisterControler>(
            init: RegisterControler(),
            initState: (_) {},
            builder: (_) {
              return Form(
                key: reg.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/img/newlogo.png",
                            height: 40,
                            width: width * .2,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Create an Account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
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
                            helper: "Enter Your Name*",
                            label: "Name",
                            controler: _.namecontroler,
                          ),
                          InputSati(
                            helper: "Email Address*",
                            label: "Email",
                            controler: _.emailcontroler,
                            type: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              if (!value.isEmail) {
                                return 'Please enter valid Email';
                              }
                              return null;
                            },
                          ),
                          InputSati(
                            helper: "Mobile Number*",
                            label: "Mobile",
                            country: true,
                            controler: _.mobilecontroler,
                            type: TextInputType.phone,
                            length: 10,
                            countrycode: _.countrycode.text,
                            countryfun: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode:
                                    true, // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  _.countrycodeupdate(country.phoneCode);
                                },
                              );
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Mobile';
                              }
                              if (value.length < 10) {
                                return 'Please enter valid Mobile';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          _.loading
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: gold,
                                  ),
                                )
                              : ButtonSati(
                                  title: "Send OTP",
                                  onPress: () {
                                    if (_.formKey.currentState?.validate() ==
                                        true) {
                                      _.submit();
                                    }
                                    //Get.toNamed('/otp');
                                  },
                                ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Get.toNamed("/login");
                              },
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Already a member ?',
                                      style: TextStyle(
                                        color: grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '   Login',
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
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
