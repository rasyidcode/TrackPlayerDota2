import 'package:flutter/material.dart';
import 'package:track_player_dota_2/models/player.dart';

const RANK_ASSET_URL =
    'https://www.opendota.com/assets/images/dota2/rank_icons/';

class DetailPage extends StatefulWidget {
  final Map playerData;

  DetailPage({required this.playerData, Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Player player = Player();

  @override
  void initState() {
    super.initState();
    player = Player.fromJson(widget.playerData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Detail Player'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 4.0,
              ),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(player.avatarUrl),
                    radius: 50.0,
                  ),
                  SizedBox(width: 6.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        player.nickname,
                        style: TextStyle(fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        player.accountId.toString(),
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Row(
                        children: [
                          Column(
                            children: <Widget>[
                              Text(
                                'WIN',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12.0,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            children: <Widget>[
                              Text(
                                'LOSE',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            children: <Widget>[
                              Text(
                                'WIN RATE',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                ((100 / (100 + 50)) * 100).toStringAsFixed(2) +
                                    '%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Image.network(
                                getRankTierAssetURL()['star_url'],
                                width: 60.0,
                              ),
                              Image.network(
                                getRankTierAssetURL()['rank_url'],
                                width: 60.0,
                              ),
                            ],
                          ),
                          Text(
                            getRankTierAssetURL()['rank_name'],
                            style: TextStyle(
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () {
                  print('fuck you');
                },
                icon: Icon(Icons.ac_unit))
          ],
        ),
      ),
    );
  }

  Map getRankTierAssetURL() {
    String rank = player.rankTier.toString();

    String rankUrl = RANK_ASSET_URL + 'rank_icon_' + rank[0] + '.png';
    String rankStar = RANK_ASSET_URL + 'rank_star_' + rank[1] + '.png';
    String rankName = '';

    switch (rank[0]) {
      case '0':
        rankName = 'Uncalibrated';
        break;
      case '1':
        rankName = 'Herald';
        break;
      case '2':
        rankName = 'Guardian';
        break;
      case '3':
        rankName = 'Crusader';
        break;
      case '4':
        rankName = 'Archon';
        break;
      case '5':
        rankName = 'Legend';
        break;
      case '6':
        rankName = 'Ancient';
        break;
      case '7':
        rankName = 'Divine';
        break;
      case '8':
        rankName = 'Immortal';
        break;
    }

    switch (rank[1]) {
      case '1':
        rankName += ' I';
        break;
      case '2':
        rankName += ' II';
        break;
      case '3':
        rankName += ' III';
        break;
      case '4':
        rankName += ' IV';
        break;
      case '5':
        rankName += ' V';
        break;
      default:
        break;
    }

    return {
      'rank_url': rankUrl,
      'star_url': rankStar,
      'rank_name': rankName,
    };
  }
}
