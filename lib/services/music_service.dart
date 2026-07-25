import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/music_model.dart';

class MusicService {
  // Sample music data - In production, this would come from API/Database
  static final List<Music> sampleMusicList = [
    Music(
      id: '1',
      userId: 'user1',
      title: 'Ambient Focus',
      artist: 'Calm Vibes',
      albumArtUrl: 'https://via.placeholder.com/200x200?text=Ambient+Focus',
      musicUrl: 'https://example.com/ambient-focus.mp3',
      duration: Duration(minutes: 45),
      isFavorite: false,
      addedAt: DateTime.now(),
    ),
    Music(
      id: '2',
      userId: 'user1',
      title: 'Success Vibes',
      artist: 'Motivation Plus',
      albumArtUrl: 'https://via.placeholder.com/200x200?text=Success+Vibes',
      musicUrl: 'https://example.com/success-vibes.mp3',
      duration: Duration(minutes: 60),
      isFavorite: false,
      addedAt: DateTime.now(),
    ),
    Music(
      id: '3',
      userId: 'user1',
      title: 'Growth Mindset',
      artist: 'Inspiring Sounds',
      albumArtUrl: 'https://via.placeholder.com/200x200?text=Growth+Mindset',
      musicUrl: 'https://example.com/growth-mindset.mp3',
      duration: Duration(minutes: 55),
      isFavorite: false,
      addedAt: DateTime.now(),
    ),
  ];

  // Get all music
  Future<List<Music>> getAllMusic() async {
    // Simulate API call
    await Future.delayed(Duration(milliseconds: 500));
    return sampleMusicList;
  }

  // Get favorite music
  Future<List<Music>> getFavoriteMusic() async {
    await Future.delayed(Duration(milliseconds: 300));
    return sampleMusicList.where((m) => m.isFavorite).toList();
  }

  // Search music
  Future<List<Music>> searchMusic(String query) async {
    await Future.delayed(Duration(milliseconds: 300));
    return sampleMusicList
        .where((m) =>
            m.title.toLowerCase().contains(query.toLowerCase()) ||
            m.artist.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Add music to favorites
  Future<void> addToFavorites(String musicId) async {
    await Future.delayed(Duration(milliseconds: 200));
    // In production, update in database
  }

  // Remove from favorites
  Future<void> removeFromFavorites(String musicId) async {
    await Future.delayed(Duration(milliseconds: 200));
    // In production, update in database
  }
}

final musicServiceProvider = Provider((ref) {
  return MusicService();
});
