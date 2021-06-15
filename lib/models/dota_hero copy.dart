class DotaHero {
  final int id;
  final String name;
  final String localizedName;
  final String primaryAttr;
  final String attackType;
  final List<String> roles;
  final String img;
  final String icon;
  final int baseHealth;
  final double baseHealthRegen;
  final int baseMana;
  final int baseManaRegen;
  final int baseArmor;
  final int baseMr;
  final int baseAttackMin;
  final int baseAttackMax;
  final int baseStr;
  final int baseAgi;
  final int baseInt;
  final double strGain;
  final double agiGain;
  final double intGain;
  final int attackRange;
  final int projectileSpeed;
  final double attackRate;
  final int moveSpeed;
  final double turnRate;
  final bool cmEnabled;
  final int legs;

  DotaHero()
      : id = 0,
        name = '',
        localizedName = '',
        primaryAttr = '',
        attackType = '',
        roles = List.empty(growable: true),
        img = '',
        icon = '',
        baseHealth = 0,
        baseHealthRegen = 0.0,
        baseMana = 0,
        baseManaRegen = 0,
        baseArmor = 0,
        baseMr = 0,
        baseAttackMin = 0,
        baseAttackMax = 0,
        baseStr = 0,
        baseAgi = 0,
        baseInt = 0,
        strGain = 0.0,
        agiGain = 0.0,
        intGain = 0.0,
        attackRange = 0,
        projectileSpeed = 0,
        attackRate = 0.0,
        moveSpeed = 0,
        turnRate = 0.0,
        cmEnabled = false,
        legs = 0;

  DotaHero.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        localizedName = json['localized_name'],
        primaryAttr = json['primary_attr'],
        attackType = json['attack_type'],
        roles = json['roles'],
        img = json['img'],
        icon = json['icon'],
        baseHealth = json['base_health'],
        baseHealthRegen = json['base_health_regen'],
        baseMana = json['base_mana'],
        baseManaRegen = json['base_mana_regen'],
        baseArmor = json['base_armor'],
        baseMr = json['base_mr'],
        baseAttackMin = json['base_attack_min'],
        baseAttackMax = json['base_attack_max'],
        baseStr = json['base_str'],
        baseAgi = json['base_agi'],
        baseInt = json['base_int'],
        strGain = json['str_gain'],
        agiGain = json['agi_gain'],
        intGain = json['int_gain'],
        attackRange = json['attack_range'],
        projectileSpeed = json['projectile_speed'],
        attackRate = json['attack_rate'],
        moveSpeed = json['move_speed'],
        turnRate = json['turn_rate'] ?? false,
        cmEnabled = json['cm_enabled'],
        legs = json['legs'];

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

  @override
  String toString() {
    return "$id, $name, $localizedName, $primaryAttr, $attackType, $roles, $img, $icon, $baseHealth," +
        "$baseManaRegen, $baseArmor, $baseMr, $baseAttackMin, $baseAttackMax, $baseStr, $baseAgi, $baseInt" +
        "$agiGain, $strGain, $intGain, $attackRange, $projectileSpeed, $attackRate, $moveSpeed, $turnRate, $cmEnabled, $legs";
  }
}
