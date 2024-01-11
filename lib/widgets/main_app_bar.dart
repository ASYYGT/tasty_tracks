import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBar buildMainAppBar() {
  return AppBar(
    title: const AutoSizeText(
      "TastyTracks",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      maxLines: 1,
    ),
    centerTitle: true,
    leading: const Padding(
      padding: EdgeInsets.all(8.0),
      child: Image(image: AssetImage("assets/images/icon.png")),
    ),
    actions: [
      IconButton(
          onPressed: () {
            SystemNavigator.pop();
          },
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: 35,
          ))
    ],
    backgroundColor: const Color(0xFFFF8C42),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
