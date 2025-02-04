import 'package:flutter/material.dart';
import 'package:track_player_dota_2/constants/base_url.dart';
import 'package:track_player_dota_2/models/player.dart';
import 'package:track_player_dota_2/models/recent_match.dart';
import 'package:track_player_dota_2/ui/widgets/match_item.dart';

class DetailPage extends StatefulWidget {
  final Map playerData;

  DetailPage({required this.playerData, Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? tabController;

  Player player = Player();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    player = Player.fromJson(widget.playerData);

    for (Map match in widget.playerData['recent_matches']) {
      player.recentMatches.add(RecentMatch.fromMap(match));
    }
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
                                player.winLose.win.toString(),
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
                                player.winLose.lose.toString(),
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
                                ((player.winLose.win /
                                                (player.winLose.win +
                                                    player.winLose.lose)) *
                                            100)
                                        .toStringAsFixed(2) +
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
            SizedBox(height: 5.0),
            TabBar(
              isScrollable: true,
              controller: tabController,
              tabs: <Widget>[
                Tab(
                  text: 'Recent Match',
                ),
                Tab(
                  text: 'Most Played',
                ),
                Tab(
                  text: 'Words Used',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    itemCount: player.recentMatches.length,
                    itemBuilder: (context, index) {
                      return MatchItemWidget(
                        recentMatch: player.recentMatches[index],
                      );
                    },
                  ),
                  Container(),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Map getRankTierAssetURL() {
    String rank = player.rankTier.toString();

    String rankUrl = BaseURL.RANK_ASSET_URL + 'rank_icon_' + rank[0] + '.png';
    String rankStar = BaseURL.RANK_ASSET_URL + 'rank_star_' + rank[1] + '.png';
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

  // game_mode.json
}
