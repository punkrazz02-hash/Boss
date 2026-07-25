import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_constants.dart';

class MusicSelectionBottomSheet extends StatefulWidget {
  const MusicSelectionBottomSheet({Key? key}) : super(key: key);

  @override
  State<MusicSelectionBottomSheet> createState() =>
      _MusicSelectionBottomSheetState();
}

class _MusicSelectionBottomSheetState extends State<MusicSelectionBottomSheet> {
  final List<MusicItem> musicList = [
    MusicItem(
      id: '1',
      title: 'Ambient Focus',
      artist: 'Calm Vibes',
      emoji: '🎵',
      isFavorite: false,
    ),
    MusicItem(
      id: '2',
      title: 'Success Vibes',
      artist: 'Motivation Plus',
      emoji: '✨',
      isFavorite: false,
    ),
    MusicItem(
      id: '3',
      title: 'Growth Mindset',
      artist: 'Inspiring Sounds',
      emoji: '🚀',
      isFavorite: false,
    ),
    MusicItem(
      id: '4',
      title: 'Wealth Building',
      artist: 'Financial Focus',
      emoji: '💰',
      isFavorite: false,
    ),
    MusicItem(
      id: '5',
      title: 'Entrepreneurship',
      artist: 'Hustle Beats',
      emoji: '💼',
      isFavorite: false,
    ),
  ];

  String? _selectedMusicId;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredMusic = musicList
        .where((m) =>
            m.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            m.artist.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Color(AppConstants.primaryBlack),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppConstants.radiusLg),
          topRight: Radius.circular(AppConstants.radiusLg),
        ),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(AppConstants.lg),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Select Background Music',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(AppConstants.luxuryGold),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(AppConstants.luxuryGold),
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ],
                ),
                SizedBox(height: AppConstants.md),
                // Search
                TextField(
                  onChanged: (value) => setState(() => _searchQuery = value),
                  decoration: InputDecoration(
                    hintText: 'Search music...',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(AppConstants.luxuryGold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Music List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: AppConstants.md),
              itemCount: filteredMusic.length,
              separatorBuilder: (context, index) =>
                  SizedBox(height: AppConstants.md),
              itemBuilder: (context, index) {
                final music = filteredMusic[index];
                final isSelected = _selectedMusicId == music.id;

                return Container(
                  padding: EdgeInsets.all(AppConstants.md),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppConstants.radiusMd),
                    border: Border.all(
                      color: isSelected
                          ? Color(AppConstants.luxuryGold)
                          : Color(AppConstants.mediumGray),
                      width: isSelected ? 2 : 1,
                    ),
                    color: isSelected
                        ? Color(AppConstants.mediumGray)
                        : Colors.transparent,
                  ),
                  child: Row(
                    children: [
                      Text(
                        music.emoji,
                        style: TextStyle(fontSize: 32),
                      ),
                      SizedBox(width: AppConstants.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              music.title,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: AppConstants.bodySize,
                                fontWeight: FontWeight.w600,
                                color: Color(AppConstants.lightGray),
                              ),
                            ),
                            Text(
                              music.artist,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: AppConstants.smallSize,
                                fontWeight: FontWeight.w400,
                                color: Color(AppConstants.mediumGray),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            _selectedMusicId = value! ? music.id : null;
                          });
                        },
                        fillColor: MaterialStateProperty.all(
                          Color(AppConstants.luxuryGold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Confirm Button
          Padding(
            padding: EdgeInsets.all(AppConstants.lg),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedMusicId != null
                    ? () {
                        final selectedMusic = musicList
                            .firstWhere((m) => m.id == _selectedMusicId);
                        Navigator.pop(context, selectedMusic);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(AppConstants.luxuryGold),
                  disabledBackgroundColor: Color(AppConstants.mediumGray),
                ),
                child: Text(
                  'Set as Background Music',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: _selectedMusicId != null
                        ? Color(AppConstants.primaryBlack)
                        : Color(AppConstants.mediumGray),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MusicItem {
  final String id;
  final String title;
  final String artist;
  final String emoji;
  bool isFavorite;

  MusicItem({
    required this.id,
    required this.title,
    required this.artist,
    required this.emoji,
    required this.isFavorite,
  });
}
