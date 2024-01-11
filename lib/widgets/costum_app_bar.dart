import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: const AutoSizeText(
      "TastyTracks",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      maxLines: 1,
    ),
    centerTitle: true,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
          size: 35,
        )),
    actions: const [
      Padding(
        padding: EdgeInsets.all(8.0),
        child: Image(image: AssetImage("assets/images/icon.png")),
      ),
    ],
    backgroundColor: const Color(0xFFFF8C42),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
