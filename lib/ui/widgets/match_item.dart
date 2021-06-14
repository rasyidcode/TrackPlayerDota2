import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:track_player_dota_2/constants/base_url.dart';
import 'package:track_player_dota_2/models/recent_match.dart';

class MatchItemWidget extends StatefulWidget {
  final RecentMatch recentMatch;
  MatchItemWidget({required this.recentMatch, Key? key}) : super(key: key);

  @override
  _MatchItemWidgetState createState() => _MatchItemWidgetState();
}

class _MatchItemWidgetState extends State<MatchItemWidget> {
  var format;
  RecentMatch? recentMatch;
  bool playerIsRadiant = false;

  @override
  void initState() {
    super.initState();
    format = DateFormat("d/M/y h:m:s");
    recentMatch = widget.recentMatch;

    if (recentMatch?.playerSlot != null) {}
    // playerIsRadiant = recentMatch?.playerSlot <= 127 ? true : false;
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
              Container(
                height: 100.0,
                width: 60.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 27.0,
                      backgroundImage: NetworkImage(
                        BaseURL.STEAM_ASSET_URL +
                            'apps/dota2/images/heroes/enchantress_full.png',
                      ),
                    ),
                    Text(
                      'Enchantress',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 11.0,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'WIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.green,
                      ),
                    )
                  ],
                ),
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
                                '11111111',
                                style: TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                          Text.rich(
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
                                TextSpan(
                                  text: 'All Pick',
                                  style: TextStyle(fontSize: 11.0),
                                ),
                                TextSpan(text: ' '),
                                TextSpan(
                                  text: 'Ranked',
                                  style: TextStyle(
                                      fontSize: 11.0,
                                      fontFamily: 'Do Hyeon',
                                      color: Colors.lightBlue),
                                )
                              ],
                            ),
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
                                        11.toString(),
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
                                        0.toString(),
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
                                        12.toString(),
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
                                      900.toString(),
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
                                      500.toString(),
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
