import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sati/constants/colors.dart';
import 'package:sati/constants/constants.dart';
import 'package:sati/screens/chat/components/chatheader.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<String> item = [
    "Hello",
    "Share more designs",
    "Give best rate",
    "Share more"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            ChatHeader(
              title: "Customer Care",
              clear: "Clear Chat",
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * .05,
                  vertical: 10,
                ),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Color(0xff414141).withOpacity(.2),
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Today",
                          style: TextStyle(
                            color: heading,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            color: Color(0xff414141).withOpacity(.2),
                            width: double.infinity,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: gold,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Hi.. Loreum ipsum dummy txt",
                            style: TextStyle(
                              color: heading,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "9:50 AM",
                          style: TextStyle(
                            color: Color(0xff647481),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "9:50 AM",
                          style: TextStyle(
                            color: Color(0xff647481),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFFE8AA),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                            ),
                          ),
                          child: Text(
                            "Hi.. Loreum ipsum dummy txt",
                            style: TextStyle(
                              color: heading,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset(
                            "assets/img/sati.png",
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              margin: EdgeInsets.only(
                top: 15,
                bottom: 20,
                left: width * .05,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: item.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xffDEDEDE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(item[index]),
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: width * .05,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      // color: Colors.red,
                      child: Center(
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 14,
                          ),
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Type Something.....",
                            hintStyle: TextStyle(
                              color: Color(0xffB7B7B7),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                            ),
                            // constraints: BoxConstraints.tight(),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/svg/mic.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  SvgPicture.asset("assets/svg/file.svg"),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
