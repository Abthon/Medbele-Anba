import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.keyboardType,
    required this.suffixIcon,
    required this.controller,
    this.fillColor,
    this.hintText,
  }) : super(key: key);

  final TextInputType keyboardType;
  final Widget suffixIcon;
  final TextEditingController controller;
  Color? fillColor;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
        right: 20.0,
        bottom: 20.0,
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppConst.kGreyLight,
        style: GoogleFonts.delius(
          fontSize: 17.0,
          color: smallTextColor,
          letterSpacing: 0.5,
          fontWeight: FontWeight.bold,
        ),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: smallTextColor),
          focusColor: Colors.black,
          suffixIcon: suffixIcon,
          fillColor: fillColor ?? AppConst.kBkDark,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppConst.kBkDark, width: 0.5),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
