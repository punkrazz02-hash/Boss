import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/music_model.dart';

final musicProvider = StateNotifierProvider<MusicNotifier, List<Music>>((ref) {
  return MusicNotifier();
});

final currentMusicProvider = StateNotifierProvider<CurrentMusicNotifier, Music?>((
  ref,
) {
  return CurrentMusicNotifier();
});

final isPlayingProvider = StateNotifierProvider<IsPlayingNotifier, bool>((ref) {
  return IsPlayingNotifier();
});

class MusicNotifier extends StateNotifier<List<Music>> {
  MusicNotifier() : super([]);

  void addMusic(Music music) {
    state = [...state, music];
  }

  void removeMusic(String musicId) {
    state = state.where((m) => m.id != musicId).toList();
  }

  void toggleFavorite(String musicId) {
    state = [
      for (final music in state)
        if (music.id == musicId) music.copyWith(isFavorite: !music.isFavorite)
        else
          music,
    ];
  }

  void setMusicList(List<Music> musicList) {
    state = musicList;
  }
}

class CurrentMusicNotifier extends StateNotifier<Music?> {
  CurrentMusicNotifier() : super(null);

  void setCurrentMusic(Music music) {
    state = music;
  }

  void clearCurrentMusic() {
    state = null;
  }
}

class IsPlayingNotifier extends StateNotifier<bool> {
  IsPlayingNotifier() : super(false);

  void togglePlayback() {
    state = !state;
  }

  void setIsPlaying(bool isPlaying) {
    state = isPlaying;
  }
}
