class Player {
  final String nickname;
  final int accountId;
  final int solo;
  final int party;
  final String avatarUrl;
  final String countrycode;
  final int rankTier;

  Player()
      : nickname = '',
        accountId = 0,
        solo = 0,
        party = 0,
        avatarUrl = '',
        countrycode = '',
        rankTier = 0;

  Player.fromJson(Map map)
      : nickname = map['profile']['personaname'],
        accountId = map['profile']['account_id'],
        solo = map['solo_competitive_rank'],
        party = map['competitive_rank'],
        avatarUrl = map['profile']['avatarfull'],
        countrycode = map['profile']['loccountrycode'],
        rankTier = map['rank_tier'];
}
