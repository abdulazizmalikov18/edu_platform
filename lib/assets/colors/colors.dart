import 'package:flutter/material.dart';

const green = _green;
const whiteGrey = _whiteGrey;
const buttonTextGreen = _buttonTextGreen;
const purple = _purple;
const dark = _dark;
const white = _white;
const red = _fuzzyWuzzyBrown;
const borderGrey = _borderGrey;
const buttonGrey = _buttonGrey;
const inputGrey = _inputGrey;
const backgroundColor = _backgroundColor;
const dividerGrey = _dividerGrey;

const _green = Color(0xff39B980);
const _whiteGrey = Color(0xffECEEF1);
const _buttonTextGreen = Color(0xff858585);
const _purple = Color(0xffC444D9);
const _dark = Color(0xff000000);
const _white = Color(0xffffffff);
const _fuzzyWuzzyBrown = Color(0xffC8534D);
const _borderGrey = Color(0xffd6d6d6);
const _buttonGrey = Color(0xffECEEF1);
const _inputGrey = Color(0xff858585);
const _backgroundColor = Color(0xfff5f8fc);
const _dividerGrey = Color(0xffE8E4E4);

List<BoxShadow> wboxShadow = const [
  BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 22,
    spreadRadius: 0,
    color: Color.fromRGBO(149, 173, 254, 0.30),
  ),
];

List<BoxShadow> elevationShadow = const [
  BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 10,
    spreadRadius: 0,
    color: Color.fromRGBO(38, 38, 38, 0.10),
  ),
];

List<BoxShadow> wTutorShadow = const [
  BoxShadow(
    color: Color(0x0F1D1617),
    blurRadius: 12,
    offset: Offset(0, 10),
    spreadRadius: 0,
  ),
];

LinearGradient wgradient = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFF4568DC), Color(0xFFB06AB3)],
);

BoxDecoration wdecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  color: white,
  boxShadow: wboxShadow,
);
