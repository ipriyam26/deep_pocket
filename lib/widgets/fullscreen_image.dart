import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class fullImage extends StatelessWidget {
  static const route = '/fullImage';
  @override
  Widget build(BuildContext context) {
    String image = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        onVerticalDragEnd: (_) {
          Navigator.pop(context);
        },
        child: SafeArea(
          child: PinchZoom(
              resetDuration: const Duration(milliseconds: 100),
              maxScale: 2.5,
              onZoomStart: () {
                print('Start zooming');
              },
              onZoomEnd: () {
                print('Stop zooming');
              },
              child: Center(
                  child: CachedNetworkImage(
                fadeInDuration: const Duration(microseconds: 0),
                fadeOutDuration: const Duration(microseconds: 2),
                placeholder: (context, url) =>
                    const CupertinoActivityIndicator(),
                imageUrl: image,
                // fit: BoxFit.cover,
              ))),
        ),
      ),
    );
  }
}
