import 'package:flutter/material.dart';

class HomeModel {
  final String addressIcon;
  final String title;
  final Color color;

  HomeModel(
      {required this.addressIcon, required this.title, required this.color});
}

List<HomeModel> homeModel = [
  HomeModel(
      addressIcon: "assets/calm.svg",
      title: "Calm",
      color: const Color(0xFFAEAFF7)),
  HomeModel(
      addressIcon: "assets/angry.svg",
      title: "Angry",
      color: const Color(0xFFF09E54)),
  HomeModel(
      addressIcon: "assets/Happy.svg",
      title: "Happy",
      color: const Color(0xFFEF5DA8)),
  HomeModel(
      addressIcon: "assets/relax.svg",
      title: "Manic",
      color: const Color(0xFFA0E3E2)),
  HomeModel(
      addressIcon: "assets/calm.svg",
      title: "Relax",
      color: const Color(0xFFC2F2A5)),
];
