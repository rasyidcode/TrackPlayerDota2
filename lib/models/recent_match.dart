import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:track_player_dota_2/constants/base_url.dart';
import 'package:track_player_dota_2/models/dota_hero.dart';
import 'package:track_player_dota_2/models/game_mode.dart';
import 'package:track_player_dota_2/models/lobby_type.dart';

class RecentMatch {
  final int matchId;
  final int gpm;
  final int xpm;
  final int herodmg;
  final int towerdmg;
  final int timestamp;
  final int heroId;
  final int playerSlot;
  final bool radiantWin;
  final int duration;
  final int gameMode;
  final int lobbyType;
  final int lastHits;
  final int leaverStatus;
  final int kills;
  final int deaths;
  final int assists;

  RecentMatch()
      : matchId = 0,
        gpm = 0,
        xpm = 0,
        herodmg = 0,
        towerdmg = 0,
        timestamp = 0,
        heroId = 0,
        playerSlot = 0,
        radiantWin = false,
        duration = 0,
        gameMode = 0,
        lobbyType = 0,
        lastHits = 0,
        leaverStatus = 0,
        kills = 0,
        deaths = 0,
        assists = 0;

  RecentMatch.fromMap(Map map)
      : matchId = map['match_id'],
        gpm = map['gold_per_min'],
        xpm = map['xp_per_min'],
        herodmg = map['hero_damage'],
        towerdmg = map['tower_damage'],
        timestamp = map['start_time'],
        heroId = map['hero_id'],
        playerSlot = map['player_slot'],
        radiantWin = map['radiant_win'],
        duration = map['duration'],
        gameMode = map['game_mode'],
        lobbyType = map['lobby_type'],
        lastHits = map['last_hits'],
        leaverStatus = map['leaver_status'],
        kills = map['kills'],
        deaths = map['deaths'],
        assists = map['assists'];

  Future<DotaHero> getHero() async {
    const assetPath = BaseURL.ODOTA_CONSTANT_URL + 'heroes.json';
    try {
      final jsonString = await http.get(Uri.parse(assetPath));
      final Map result = json.decode(jsonString.body);

      if (result.containsKey("${this.heroId}")) {
        final DotaHero hero = DotaHero.fromJson(result["${this.heroId}"]);
        return hero;
      }
      return DotaHero();
    } catch (e) {
      return DotaHero();
    }
  }

  Future<Map> getGameMode() async {
    const gameModeAssetPath = BaseURL.ODOTA_CONSTANT_URL + 'game_mode.json';
    const lobbyTypeAssetPath = BaseURL.ODOTA_CONSTANT_URL + 'lobby_type.json';
    try {
      final gameModeJsonString = await http.get(Uri.parse(gameModeAssetPath));
      final lobbyTypeJsonString = await http.get(Uri.parse(lobbyTypeAssetPath));

      return {
        'game_mode': GameMode.fromJson(
            json.decode(gameModeJsonString.body)["${this.gameMode}"]),
        'lobby_type': LobbyType.fromJson(
            json.decode(lobbyTypeJsonString.body)["${this.lobbyType}"])
      };
    } catch (e) {
      return {'game_mode': null, 'lobby_type': null};
    }
  }
}
