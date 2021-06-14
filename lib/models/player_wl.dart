class PlayerWL {
  final int win;
  final int lose;

  PlayerWL()
      : win = 0,
        lose = 0;

  PlayerWL.fromMap(Map map)
      : win = map['win'],
        lose = map['lose'];
}
