class Hero {
  int? id;
  String? name;
  String? localizedName;
  String? primaryAttr;
  String? attackType;
  List<String>? roles;
  String? img;
  String? icon;
  int? baseHealth;
  double? baseHealthRegen;
  int? baseMana;
  int? baseManaRegen;
  int? baseArmor;
  int? baseMr;
  int? baseAttackMin;
  int? baseAttackMax;
  int? baseStr;
  int? baseAgi;
  int? baseInt;
  double? strGain;
  double? agiGain;
  double? intGain;
  int? attackRange;
  int? projectileSpeed;
  double? attackRate;
  int? moveSpeed;
  double? turnRate;
  bool? cmEnabled;
  int? legs;

  Hero(
      {this.id,
      this.name,
      this.localizedName,
      this.primaryAttr,
      this.attackType,
      this.roles,
      this.img,
      this.icon,
      this.baseHealth,
      this.baseHealthRegen,
      this.baseMana,
      this.baseManaRegen,
      this.baseArmor,
      this.baseMr,
      this.baseAttackMin,
      this.baseAttackMax,
      this.baseStr,
      this.baseAgi,
      this.baseInt,
      this.strGain,
      this.agiGain,
      this.intGain,
      this.attackRange,
      this.projectileSpeed,
      this.attackRate,
      this.moveSpeed,
      this.turnRate,
      this.cmEnabled,
      this.legs});

  Hero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localized_name'];
    primaryAttr = json['primary_attr'];
    attackType = json['attack_type'];
    roles = json['roles'].cast<String>();
    img = json['img'];
    icon = json['icon'];
    baseHealth = json['base_health'];
    baseHealthRegen = json['base_health_regen'];
    baseMana = json['base_mana'];
    baseManaRegen = json['base_mana_regen'];
    baseArmor = json['base_armor'];
    baseMr = json['base_mr'];
    baseAttackMin = json['base_attack_min'];
    baseAttackMax = json['base_attack_max'];
    baseStr = json['base_str'];
    baseAgi = json['base_agi'];
    baseInt = json['base_int'];
    strGain = json['str_gain'];
    agiGain = json['agi_gain'];
    intGain = json['int_gain'];
    attackRange = json['attack_range'];
    projectileSpeed = json['projectile_speed'];
    attackRate = json['attack_rate'];
    moveSpeed = json['move_speed'];
    turnRate = json['turn_rate'];
    cmEnabled = json['cm_enabled'];
    legs = json['legs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['localized_name'] = this.localizedName;
    data['primary_attr'] = this.primaryAttr;
    data['attack_type'] = this.attackType;
    data['roles'] = this.roles;
    data['img'] = this.img;
    data['icon'] = this.icon;
    data['base_health'] = this.baseHealth;
    data['base_health_regen'] = this.baseHealthRegen;
    data['base_mana'] = this.baseMana;
    data['base_mana_regen'] = this.baseManaRegen;
    data['base_armor'] = this.baseArmor;
    data['base_mr'] = this.baseMr;
    data['base_attack_min'] = this.baseAttackMin;
    data['base_attack_max'] = this.baseAttackMax;
    data['base_str'] = this.baseStr;
    data['base_agi'] = this.baseAgi;
    data['base_int'] = this.baseInt;
    data['str_gain'] = this.strGain;
    data['agi_gain'] = this.agiGain;
    data['int_gain'] = this.intGain;
    data['attack_range'] = this.attackRange;
    data['projectile_speed'] = this.projectileSpeed;
    data['attack_rate'] = this.attackRate;
    data['move_speed'] = this.moveSpeed;
    data['turn_rate'] = this.turnRate;
    data['cm_enabled'] = this.cmEnabled;
    data['legs'] = this.legs;
    return data;
  }
}
