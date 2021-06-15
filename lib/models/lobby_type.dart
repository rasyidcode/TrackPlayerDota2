import 'package:track_player_dota_2/extensions/string_extensions.dart';

class LobbyType {
  int id;
  String name;
  bool? balanced;

  LobbyType()
      : this.id = 0,
        this.name = '',
        this.balanced = null;

  LobbyType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        balanced = json['balanced'] ?? null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['balanced'] = this.balanced;
    return data;
  }

  String getRealName() {
    return this.name.substring(11).split('_').join(' ').capitalizeFirstWord();
  }
}
