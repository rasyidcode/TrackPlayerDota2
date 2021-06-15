class DotaHero {
  final int id;
  final String name;
  final String localizedName;
  final String img;
  final String icon;

  DotaHero()
      : id = 0,
        name = '',
        localizedName = '',
        img = '',
        icon = '';

  DotaHero.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        localizedName = json['localized_name'],
        img = json['img'],
        icon = json['icon'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localized_name'] = this.localizedName;
    data['img'] = this.img;
    data['icon'] = this.icon;
    return data;
  }
}
