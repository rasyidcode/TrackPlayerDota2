import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:track_player_dota_2/constants/base_url.dart';
import 'package:track_player_dota_2/models/dota_hero.dart';
import 'package:track_player_dota_2/models/game_mode.dart';
import 'package:track_player_dota_2/models/lobby_type.dart';
import 'package:track_player_dota_2/models/recent_match.dart';

class MatchItemWidget extends StatefulWidget {
  final RecentMatch recentMatch;
  MatchItemWidget({required this.recentMatch, Key? key}) : super(key: key);

  @override
  _MatchItemWidgetState createState() => _MatchItemWidgetState();
}

class _MatchItemWidgetState extends State<MatchItemWidget> {
  var format;
  RecentMatch recentMatch = RecentMatch();
  bool playerIsRadiant = false;
  DotaHero hero = DotaHero();

  @override
  void initState() {
    super.initState();
    format = DateFormat("d/M/y h:m:s");
    recentMatch = widget.recentMatch;

    playerIsRadiant = recentMatch.playerSlot <= 127 ? true : false;
  }

  bool isPlayerWin() {
    return recentMatch.radiantWin
        ? playerIsRadiant
            ? true
            : false
        : !playerIsRadiant
            ? true
            : false;
  }

  Widget buildLeftSideWidget(DotaHero hero) {
    return Container(
      height: 100.0,
      width: 60.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(
            radius: 27.0,
            backgroundImage: NetworkImage(
              BaseURL.STEAM_ASSET_URL + hero.img,
            ),
          ),
          Text(
            hero.localizedName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.blue,
            ),
          ),
          Text(
            isPlayerWin() ? 'WIN' : 'LOSE',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.0,
              color: isPlayerWin() ? Colors.green : Colors.red,
            ),
          )
        ],
      ),
    );
  }

  Widget buildGameModeWidget(Map map) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Type',
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: ' :  ',
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.grey,
            ),
          ),
          TextSpan(text: (map['game_mode'] as GameMode).getRealName()),
          TextSpan(text: ' '),
          TextSpan(
            text: (map['lobby_type'] as LobbyType).getRealName(),
            style: TextStyle(
                fontSize: 11.0,
                fontFamily: 'Do Hyeon',
                color: Colors.lightBlue),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<DotaHero>(
                future: recentMatch.getHero(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Text('Something went wrong');
                  }

                  return snapshot.hasData
                      ? buildLeftSideWidget(snapshot.data)
                      : CircularProgressIndicator();
                },
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Container(
                  height: 110.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Match ID',
                                style: TextStyle(fontSize: 11.0),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                recentMatch.matchId.toString(),
                                style: TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                          FutureBuilder(
                            future: recentMatch.getGameMode(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }

                              return snapshot.hasData
                                  ? buildGameModeWidget(snapshot.data)
                                  : CircularProgressIndicator();
                            },
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Match Date : ',
                                style: TextStyle(
                                    fontSize: 11.0, color: Colors.grey),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                format.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        (int.parse(
                                            1623579539.toString() + "000")))),
                                style: TextStyle(fontSize: 11.0),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          TextButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_forward),
                            label: Text(
                              'Detail Match',
                              style: TextStyle(fontSize: 9.0),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: 20.0,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'K',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        recentMatch.kills.toString(),
                                        style: TextStyle(
                                          fontSize: 11.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'D',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        recentMatch.deaths.toString(),
                                        style: TextStyle(
                                          fontSize: 11.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 20.0,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        'A',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        recentMatch.assists.toString(),
                                        style: TextStyle(
                                          fontSize: 11.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'GPM',
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 12.0),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      recentMatch.gpm.toString(),
                                      style: TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'XPM',
                                      style: TextStyle(
                                        color: Colors.orange,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      recentMatch.xpm.toString(),
                                      style: TextStyle(
                                        fontSize: 11.0,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}
