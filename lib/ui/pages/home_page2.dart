// ignore: slash_for_doc_comments
/**
 * title: New Home Page
 * 
 * desc: This page would have a search player by his nickname and also would show a list of pro players below it.
 * 
 * widgets:
 * - App Title Widget
 * - Search Bar Widget to search user
 * - ListView of Pro Players
 * - Scrollable screen
 * 
 */

import 'package:flutter/material.dart';
import 'package:track_player_dota_2/constants/dimens.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimens.SCREEN_PADDING,
          ),
          child: ,
        ),
      ),
    );
  }
}
