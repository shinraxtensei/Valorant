class Mape {
  const Mape({
    this.uuid,
    this.displayName,
    this.narrativeDescription,
    this.tacticalDescription,
    this.coordinates,
    this.displayIcon,
    this.listViewIcon,
    this.listViewIconTall,
    this.splash,
    this.stylizedBackgroundImage,
    this.premierBackgroundImage,
    this.assetPath,
    this.mapUrl,
    this.xMultiplier,
    this.yMultiplier,
    this.xScalarToAdd,
    this.yScalarToAdd,
    this.callouts,
  });

  final String? uuid;
  final String? displayName;
  final String? narrativeDescription;
  final String? tacticalDescription;
  final String? coordinates;
  final String? displayIcon;
  final String? listViewIcon;
  final String? listViewIconTall;
  final String? splash;
  final String? stylizedBackgroundImage;
  final String? premierBackgroundImage;
  final String? assetPath;
  final String? mapUrl;
  final num? xMultiplier;
  final num? yMultiplier;
  final num? xScalarToAdd;
  final num? yScalarToAdd;
  final List<Callout>? callouts;

  factory Mape.fromJson(Map<String, dynamic> json) {
    return Mape(
      uuid: json['uuid'],
      displayName: json['displayName'],
      narrativeDescription: json['narrativeDescription'],
      tacticalDescription: json['tacticalDescription'],
      coordinates: json['coordinates'],
      displayIcon: json['displayIcon'],
      listViewIcon: json['listViewIcon'],
      listViewIconTall: json['listViewIconTall'],
      splash: json['splash'],
      stylizedBackgroundImage: json['stylizedBackgroundImage'],
      premierBackgroundImage: json['premierBackgroundImage'],
      assetPath: json['assetPath'],
      mapUrl: json['mapUrl'],
      xMultiplier: json['xMultiplier'],
      yMultiplier: json['yMultiplier'],
      xScalarToAdd: json['xScalarToAdd'],
      yScalarToAdd: json['yScalarToAdd'],
      callouts: json['callouts'] != null
          ? List<Callout>.from(
              json['callouts'].map((x) => Callout.fromJson(x)),
            )
          : null,
    );
  }
}

class Callout {
  const Callout({
    this.regionName,
    this.superRegionName,
    this.location,
  });

  final String? regionName;
  final String? superRegionName;
  final Location? location;

  factory Callout.fromJson(Map<String, dynamic> json) {
    return Callout(
      regionName: json['regionName'],
      superRegionName: json['superRegionName'],
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
    );
  }
}

class Location {
  const Location({
    this.x,
    this.y,
  });

  final num? x;
  final num? y;

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
    );
  }
}
