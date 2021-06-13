import 'package:flutter/material.dart';
import 'package:track_player_dota_2/ui/pages/base_page.dart';

class TrackPlayerDota2App extends StatelessWidget {
  const TrackPlayerDota2App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Track Player Dota 2',
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: BasePage(),
    );
  }
}
