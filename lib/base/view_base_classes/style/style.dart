import 'package:flutter/material.dart';

const logoAsset = AssetImage('assets/images/logo_white.png');

//* COLORS
const greyColor = Color(0xFF909090);
const darkPurpleColor = Color(0xFF7B4397);
const droPurpleColor = Color(0xFF9F5DE2);
const droTurquoiseColor = Color(0xFF0CB8B6);
const backgroundWhiteColor = Color(0xFFFDFDFD);
const textWhiteColor = Color(0xFFFEFEFF);
const blackColor = Colors.black;
const blueColor = Colors.blue;
const redColor = Colors.red;

//* TEXTSTYLES
const hintTextStyle = TextStyle(
  color: greyColor,
  fontSize: 14,
);

//INPUT DECORATORS

const inputFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
  isDense: true,
  filled: true,
  fillColor: textWhiteColor,
  focusColor: textWhiteColor,
  hintStyle: hintTextStyle,
  labelStyle: hintTextStyle,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide(
        color: droPurpleColor,
      )),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide.none,
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
      borderSide: BorderSide(
        color: redColor,
        width: 0.5,
      )),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
    borderSide: BorderSide(
      color: Color(0xFFC4C4C4),
      width: 1,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(24)),
    borderSide: BorderSide(
      color: Color(0xFFC4C4C4),
      width: 1,
    ),
  ),
);
