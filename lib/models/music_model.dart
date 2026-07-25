class Music {
  final String id;
  final String userId;
  final String title;
  final String artist;
  final String? albumArtUrl;
  final String musicUrl;
  final Duration duration;
  final bool isFavorite;
  final DateTime addedAt;

  Music({
    required this.id,
    required this.userId,
    required this.title,
    required this.artist,
    this.albumArtUrl,
    required this.musicUrl,
    required this.duration,
    required this.isFavorite,
    required this.addedAt,
  });

  factory Music.fromJson(Map<String, dynamic> json) {
    return Music(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      artist: json['artist'] as String,
      albumArtUrl: json['albumArtUrl'] as String?,
      musicUrl: json['musicUrl'] as String,
      duration: Duration(seconds: json['duration'] as int),
      isFavorite: json['isFavorite'] as bool? ?? false,
      addedAt: DateTime.parse(json['addedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'artist': artist,
      'albumArtUrl': albumArtUrl,
      'musicUrl': musicUrl,
      'duration': duration.inSeconds,
      'isFavorite': isFavorite,
      'addedAt': addedAt.toIso8601String(),
    };
  }

  Music copyWith({
    String? id,
    String? userId,
    String? title,
    String? artist,
    String? albumArtUrl,
    String? musicUrl,
    Duration? duration,
    bool? isFavorite,
    DateTime? addedAt,
  }) {
    return Music(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      artist: artist ?? this.artist,
      albumArtUrl: albumArtUrl ?? this.albumArtUrl,
      musicUrl: musicUrl ?? this.musicUrl,
      duration: duration ?? this.duration,
      isFavorite: isFavorite ?? this.isFavorite,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
