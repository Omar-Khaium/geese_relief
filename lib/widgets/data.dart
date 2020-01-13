import 'package:flutter/material.dart';
import 'package:flutter_grate_app/widgets/recommended_level_1.dart';
import 'package:flutter_grate_app/widgets/recommended_level_2.dart';
import 'package:flutter_grate_app/widgets/recommended_level_3.dart';
import 'package:flutter_grate_app/widgets/recommended_level_4.dart';
import 'package:flutter_grate_app/widgets/recommended_level_5.dart';
import 'package:flutter_grate_app/widgets/recommended_level_6.dart';

List<Widget> recommendations = [
  RecommendedLevel1(),
  RecommendedLevel2(),
  RecommendedLevel3(),
  RecommendedLevel4(),
  RecommendedLevel5(),
  RecommendedLevel6(),
];

List<String> title = [
  "Hounted Ground",
  "Fallen In Love",
  "The Dreaming Moon",
  "Jack the Persian and the Black Castel",
];