import 'package:flutter/material.dart';
import 'package:track_player_dota_2/ui/pages/home_page.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(elevation: 0.0, centerTitle: true, title: Text('Home')),
      body: HomePage(),
    );
  }
}
