import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sati/constants/colors.dart';

class InputSati extends StatefulWidget {
  final String? helper;
  final String? label;
  final TextEditingController? controler;
  final TextInputType? type;
  final int? length;
  final String? Function(String?)? validator;
  final bool? secured;
  final bool? country;
  final void Function()? countryfun;
  final String? countrycode;

  const InputSati({
    super.key,
    this.helper,
    this.label,
    this.controler,
    this.type = TextInputType.text,
    this.length = 100,
    this.validator,
    this.secured = false,
    this.country = false,
    this.countryfun,
    this.countrycode = "91",
  });

  @override
  State<InputSati> createState() => _InputSatiState();
}

class _InputSatiState extends State<InputSati> {
  bool secured = false;
  String country_code = "";

  void change() {
    setState(() {
      secured = !secured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextFormField(
        maxLength: widget.length,
        keyboardType: widget.type,
        controller: widget.controler,
        obscureText: secured ? false : widget.secured!,
        decoration: InputDecoration(
          counterText: "",
          hintText: widget.helper,
          hintStyle: TextStyle(color: heading),
          labelStyle: TextStyle(color: heading),
          label:
              widget.label != null ? Text(widget.label!) : Text("Enter value"),
          errorMaxLines: 2,
          filled: true,
          prefixIcon: widget.country!
              ? InkWell(
                  onTap: widget.countryfun,
                  child: Container(
                    width: 70,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("+ ${widget.countrycode!}"),
                          Icon(
                            Icons.arrow_drop_down,
                            color: heading,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              : null,
          suffixIcon: widget.secured!
              ? InkWell(
                  onTap: change,
                  child: Icon(
                    !secured
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                    color: heading,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: background,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 17,
            horizontal: 15,
          ),
        ),
        validator: widget.validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter ' + widget.label!;
              }
              return null;
            },
      ),
    );
  }
}
