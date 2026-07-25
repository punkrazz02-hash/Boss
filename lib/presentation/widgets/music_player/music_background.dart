import 'package:flutter/material.dart';
import '../../../config/app_constants.dart';

class MusicBackground extends StatefulWidget {
  final VoidCallback onMusicTap;

  const MusicBackground({Key? key, required this.onMusicTap}) : super(key: key);

  @override
  State<MusicBackground> createState() => _MusicBackgroundState();
}

class _MusicBackgroundState extends State<MusicBackground>
    with SingleTickerProviderStateMixin {
  bool _isPlaying = false;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppConstants.lg,
      left: AppConstants.md,
      right: AppConstants.md,
      child: Container(
        padding: EdgeInsets.all(AppConstants.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          border: Border.all(
            color: Color(AppConstants.luxuryGold).withOpacity(0.3),
            width: 1,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(AppConstants.mediumGray).withOpacity(0.6),
              Color(AppConstants.mediumGray).withOpacity(0.3),
            ],
          ),
        ),
        child: Row(
          children: [
            // Album Art / Vinyl
            RotationTransition(
              turns: _rotationController,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(AppConstants.luxuryGold),
                      Color(AppConstants.accentGold),
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(AppConstants.primaryBlack),
                    ),
                    child: Icon(
                      Icons.music_note,
                      color: Color(AppConstants.luxuryGold),
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: AppConstants.md),
            // Song Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Now Playing',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: AppConstants.smallSize,
                      fontWeight: FontWeight.w400,
                      color: Color(AppConstants.mediumGray),
                    ),
                  ),
                  Text(
                    'Select Your Song',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: AppConstants.bodySize,
                      fontWeight: FontWeight.w600,
                      color: Color(AppConstants.lightGray),
                    ),
                  ),
                ],
              ),
            ),
            // Play Button
            GestureDetector(
              onTap: () {
                setState(() {
                  _isPlaying = !_isPlaying;
                  if (_isPlaying) {
                    _rotationController.repeat();
                  } else {
                    _rotationController.stop();
                  }
                });
                widget.onMusicTap();
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(AppConstants.luxuryGold),
                ),
                child: Center(
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Color(AppConstants.primaryBlack),
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
