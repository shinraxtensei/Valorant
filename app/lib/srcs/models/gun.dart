class Gun {
  const Gun({
    this.uuid,
    this.displayName,
    this.category,
    this.defaultSkinUuid,
    this.displayIcon,
    this.killStreamIcon,
    this.assetPath,
    this.weaponStats,
    this.shopData,
    this.skins,
  });

  final String? uuid;
  final String? displayName;
  final String? category;
  final String? defaultSkinUuid;
  final String? displayIcon;
  final String? killStreamIcon;
  final String? assetPath;
  final GunStats? weaponStats;
  final ShopData? shopData;
  final List<GunSkin>? skins;

  factory Gun.fromJson(Map<String, dynamic> json) {
    return Gun(
      uuid: json['uuid'],
      displayName: json['displayName'],
      category: json['category'],
      defaultSkinUuid: json['defaultSkinUuid'],
      displayIcon: json['displayIcon'],
      killStreamIcon: json['killStreamIcon'],
      assetPath: json['assetPath'],
      weaponStats: json['weaponStats'] != null
          ? GunStats.fromJson(json['weaponStats'])
          : null,
      shopData:
          json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null,
      skins: json['skins'] != null
          ? List<GunSkin>.from(
              json['skins'].map((x) => GunSkin.fromJson(x)),
            )
          : null,
    );
  }
}

class GunStats {
  const GunStats({
    this.fireRate,
    this.magazineSize,
    this.runSpeedMultiplier,
    this.equipTimeSeconds,
    this.reloadTimeSeconds,
    this.firstBulletAccuracy,
    this.shotgunPelletCount,
    this.wallPenetration,
    this.feature,
    this.fireMode,
    this.altFireType,
    // this.adsStats,
    this.damageRanges,
  });

  final double? fireRate;
  final int? magazineSize;
  final double? runSpeedMultiplier;
  final double? equipTimeSeconds;
  final double? reloadTimeSeconds;
  final double? firstBulletAccuracy;
  final int? shotgunPelletCount;
  final String? wallPenetration;
  final String? feature;
  final String? fireMode;
  final String? altFireType;
  // final AdsStats? adsStats;
  final List<DamageRange>? damageRanges;

  factory GunStats.fromJson(Map<String, dynamic> json) {
    return GunStats(
      fireRate: json['fireRate']?.toDouble(),
      magazineSize: json['magazineSize'],
      runSpeedMultiplier: json['runSpeedMultiplier']?.toDouble(),
      equipTimeSeconds: json['equipTimeSeconds']?.toDouble(),
      reloadTimeSeconds: json['reloadTimeSeconds']?.toDouble(),
      firstBulletAccuracy: json['firstBulletAccuracy']?.toDouble(),
      shotgunPelletCount: json['shotgunPelletCount'],
      wallPenetration: json['wallPenetration'],
      feature: json['feature'],
      fireMode: json['fireMode'],
      altFireType: json['altFireType'],
      // adsStats:
      //     json['adsStats'] != null ? AdsStats.fromJson(json['adsStats']) : null,
      damageRanges: json['damageRanges'] != null
          ? List<DamageRange>.from(
              json['damageRanges'].map((x) => DamageRange.fromJson(x)),
            )
          : null,
    );
  }
}

// class AdsStats {
//   const AdsStats({
//     this.zoomMultiplier,
//     this.fireRate,
//     this.runSpeedMultiplier,
//     this.burstCount,
//     this.firstBulletAccuracy,
//   });

//   final double? zoomMultiplier;
//   final double? fireRate;
//   final double? runSpeedMultiplier;
//   final int? burstCount;
//   final double? firstBulletAccuracy;

//   factory AdsStats.fromJson(Map<String, dynamic> json) {
//     return AdsStats(
//       zoomMultiplier: json['zoomMultiplier']?.toDouble(),
//       fireRate: json['fireRate']?.toDouble(),
//       runSpeedMultiplier: json['runSpeedMultiplier']?.toDouble(),
//       burstCount: json['burstCount'],
//       firstBulletAccuracy: json['firstBulletAccuracy']?.toDouble(),
//     );
//   }
// }

class DamageRange {
  const DamageRange({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  final int? rangeStartMeters;
  final int? rangeEndMeters;
  final double? headDamage;
  final double? bodyDamage;
  final double? legDamage;

  factory DamageRange.fromJson(Map<String, dynamic> json) {
    return DamageRange(
      rangeStartMeters: json['rangeStartMeters'],
      rangeEndMeters: json['rangeEndMeters'],
      headDamage: json['headDamage']?.toDouble(),
      bodyDamage: json['bodyDamage']?.toDouble(),
      legDamage: json['legDamage']?.toDouble(),
    );
  }
}

class ShopData {
  const ShopData({
    this.cost,
    this.category,
    this.shopOrderPriority,
    this.categoryText,
    this.canBeTrashed,
    this.image,
    this.newImage,
    this.newImage2,
    this.assetPath,
  });

  final int? cost;
  final String? category;
  final int? shopOrderPriority;
  final String? categoryText;
  final bool? canBeTrashed;
  final String? image;
  final String? newImage;
  final String? newImage2;
  final String? assetPath;

  factory ShopData.fromJson(Map<String, dynamic> json) {
    return ShopData(
      cost: json['cost'],
      category: json['category'],
      shopOrderPriority: json['shopOrderPriority'],
      categoryText: json['categoryText'],
      canBeTrashed: json['canBeTrashed'],
      image: json['image'],
      newImage: json['newImage'],
      newImage2: json['newImage2'],
      assetPath: json['assetPath'],
    );
  }
}

// class GridPosition {
//   const GridPosition({
//     this.row,
//     this.column,
//   });

//   final int? row;
//   final int? column;

//   factory GridPosition.fromJson(Map<String, dynamic> json) {
//     return GridPosition(
//       row: json['row'],
//       column: json['column'],
//     );
//   }
// }

class GunSkin {
  const GunSkin({
    this.uuid,
    this.displayName,
    this.themeUuid,
    this.contentTierUuid,
    this.displayIcon,
    this.wallpaper,
    this.assetPath,
    this.chromas,
    this.levels,
  });

  final String? uuid;
  final String? displayName;
  final String? themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final String? wallpaper;
  final String? assetPath;
  final List<GunChroma>? chromas;
  final List<GunLevel>? levels;

  factory GunSkin.fromJson(Map<String, dynamic> json) {
    return GunSkin(
      uuid: json['uuid'],
      displayName: json['displayName'],
      themeUuid: json['themeUuid'],
      contentTierUuid: json['contentTierUuid'],
      displayIcon: json['displayIcon'],
      wallpaper: json['wallpaper'],
      assetPath: json['assetPath'],
      chromas: json['chromas'] != null
          ? List<GunChroma>.from(
              json['chromas'].map((x) => GunChroma.fromJson(x)),
            )
          : null,
      levels: json['levels'] != null
          ? List<GunLevel>.from(
              json['levels'].map((x) => GunLevel.fromJson(x)),
            )
          : null,
    );
  }
}

class GunChroma {
  const GunChroma({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.fullRender,
    this.swatch,
    this.streamedVideo,
    this.assetPath,
  });

  final String? uuid;
  final String? displayName;
  final String? displayIcon;
  final String? fullRender;
  final String? swatch;
  final String? streamedVideo;
  final String? assetPath;

  factory GunChroma.fromJson(Map<String, dynamic> json) {
    return GunChroma(
      uuid: json['uuid'],
      displayName: json['displayName'],
      displayIcon: json['displayIcon'],
      fullRender: json['fullRender'],
      swatch: json['swatch'],
      streamedVideo: json['streamedVideo'],
      assetPath: json['assetPath'],
    );
  }
}

class GunLevel {
  const GunLevel({
    this.uuid,
    this.displayName,
    this.levelItem,
    this.displayIcon,
    this.streamedVideo,
    this.assetPath,
  });

  final String? uuid;
  final String? displayName;
  final String? levelItem;
  final String? displayIcon;
  final String? streamedVideo;
  final String? assetPath;

  factory GunLevel.fromJson(Map<String, dynamic> json) {
    return GunLevel(
      uuid: json['uuid'],
      displayName: json['displayName'],
      levelItem: json['levelItem'],
      displayIcon: json['displayIcon'],
      streamedVideo: json['streamedVideo'],
      assetPath: json['assetPath'],
    );
  }
}
