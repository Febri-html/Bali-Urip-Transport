import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeHeroVideo extends StatefulWidget {
  const HomeHeroVideo({super.key});

  @override
  State<HomeHeroVideo> createState() => _HomeHeroVideoState();
}

class _HomeHeroVideoState extends State<HomeHeroVideo> {
  late VideoPlayerController _controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset(
      'assets/videos/home_hero.mp4',
    );

    _controller.initialize().then((_) {
      _controller
        ..setLooping(true)
        ..setVolume(0)
        ..play();

      if (mounted) {
        setState(() {
          isReady = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return Image.asset(
        'assets/images/banner.png',
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 200,
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}