// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

// Import the YoyoPlayer package
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'dart:math'; // Import this at the top of your file

class YoyoPlayerWidget extends StatefulWidget {
  const YoyoPlayerWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  // Default URL for video streaming
  final String videoUrl =
      "https://s3.us-east-1.amazonaws.com/celebratix.corporate.resources/video/var1/index1-var1.m3u8";

  @override
  State<YoyoPlayerWidget> createState() => _YoyoPlayerWidgetState();
}

class _YoyoPlayerWidgetState extends State<YoyoPlayerWidget> {
  bool isLoading = true; // Track loading state of the video
  bool fullscreen = false;

  // Function to generate the random URL based on your formula
  String _generateVideoUrl() {
    // Generate a random number between 1 and 6
    final x = Random().nextInt(6) + 1; // Random number between 1 and 6

    // Return the dynamically generated URL
    return "https://s3.amazonaws.com/celebratix.corporate.resources/video/var$x/index$x-var$x.m3u8";
  }

  @override
  Widget build(BuildContext context) {
    String videoUrl = _generateVideoUrl();

    if (isWeb) {
      print('not');
      return const SizedBox(); // Return an empty widget instead of nothing
    }

    return YoYoPlayer(
      aspectRatio: 16 / 9,
      autoPlayVideoAfterInit: true,
      videoStyle: VideoStyle(),
      url: videoUrl,
    );
  }
}
