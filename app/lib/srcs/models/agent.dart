class Agent {
  const Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role, // Use the Role class for the role property
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final dynamic recruitmentData;
  final List<Ability>? abilities;
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
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      recruitmentData: json['recruitmentData'],
      abilities: List<Ability>.from(
        json['abilities'].map((x) => Ability.fromJson(x)),
      ),
      voiceLine: json['voiceLine'],
    );
  }
}

class Ability {
  const Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      slot: json['slot'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
    );
  }
}

class Role {
  const Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      uuid: json['uuid'],
      displayName: json['displayName'],
      description: json['description'],
      displayIcon: json['displayIcon'],
      assetPath: json['assetPath'],
    );
  }
}
