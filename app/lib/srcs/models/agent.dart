class Agent {
  const Agent(
      {required this.uuid,
      required this.displayName,
      required this.description,
      required this.developerName,
      required this.displayIcon,
      required this.displayIconSmall,
      required this.bustPortrait,
      required this.fullPortrait,
      required this.fullPortraitV2,
      required this.killfeedPortrait,
      required this.background,
      required this.backgroundGradientColors,
      required this.assetPath,
      required this.isFullPortraitRightFacing,
      required this.isPlayableCharacter,
      required this.isAvailableForTest,
      required this.isBaseContent,
      required this.role,
      required this.recruitmentData,
      required this.abilities,
      required this.voiceLine});

  final String uuid;
  final String displayName;
  final String description;
  final String developerName;
  final String displayIcon;
  final String displayIconSmall;
  final String bustPortrait;
  final String fullPortrait;
  final String fullPortraitV2;
  final String killfeedPortrait;
  final String background;
  final List<String> backgroundGradientColors;
  final String assetPath;
  final bool isFullPortraitRightFacing;
  final bool isPlayableCharacter;
  final bool isAvailableForTest;
  final bool isBaseContent;
  final String role;
  final dynamic recruitmentData;
  final List<Ability> abilities;
  final dynamic voiceLine;

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      developerName: json['developerName'],
      displayIcon: json['displayIcon'],
      displayIconSmall: json['displayIconSmall'],
      bustPortrait: json['bustPortrait'],
      fullPortrait: json['fullPortrait'],
      fullPortraitV2: json['fullPortraitV2'],
      killfeedPortrait: json['killfeedPortrait'],
      background: json['background'],
      backgroundGradientColors:
          List<String>.from(json['backgroundGradientColors']),
      assetPath: json['assetPath'],
      isFullPortraitRightFacing: json['isFullPortraitRightFacing'],
      isPlayableCharacter: json['isPlayableCharacter'],
      isAvailableForTest: json['isAvailableForTest'],
      isBaseContent: json['isBaseContent'],
      role: json['role'],
      recruitmentData: json['recruitmentData'],
      abilities:
          List<Ability>.from(json['abilities'].map((x) => Ability.fromJson(x))),
      voiceLine: json['voiceLine'],
    );
  }
}

class Ability {
  const Ability(
      {required this.slot,
      required this.displayName,
      required this.description,
      required this.displayIcon});

  final String slot;
  final String displayName;
  final String description;
  final String displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}
