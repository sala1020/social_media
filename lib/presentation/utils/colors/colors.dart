//background color
import 'package:flutter/material.dart';

const kWhite = Colors.white;
const kBlack = Colors.black;
const kGrey = Color.fromARGB(255, 195, 195, 195);

const bg = LinearGradient(
    colors: [
      Color.fromARGB(182, 254, 10, 10),
      Color(0xFF111010),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.8]);

const kButtonBg = LinearGradient(
    colors: [
      Color.fromARGB(159, 137, 2, 2),
      Color(0xFF250B0B),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.8]);

const kInputFIeld = LinearGradient(
    colors: [
      Color.fromARGB(127, 0, 0, 0),
      Color(0xFF060606),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.2, 0.9]);

//textColor

