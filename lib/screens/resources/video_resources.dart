// ignore_for_file: camel_case_types, must_be_immutable, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

class videoResources extends StatelessWidget {
  // const videoResources({Key? key}) : super(key: key);
  String? videoTitle;
  String? videoAuthor;
  Stream<Video>? playlistVideos;
  Stream<Video>? somePlaylistVideos;

  videoResources({Key? key}) : super(key: key);

  Future<void> youtubbe() async {
    var yt = YoutubeExplode();
    var search = await yt.search
        .getVideos('Python', filter: const SearchFilter('EgIQAw%253D%253D'));
    var playlist = await yt.channels.get(
      'https://www.youtube.com/user/MathDoctorBob',
    );
    var title = playlist.title;
    var author = playlist.logoUrl;
    print(title + " " + author);
    // print(title);

    await for (var video in yt.playlists.getVideos(playlist.id)) {
      videoTitle = video.title;
      videoAuthor = video.author;
      // print(videoTitle);
    }

    playlistVideos = yt.playlists.getVideos(playlist.id);

// Get first 20 playlist videos.
    somePlaylistVideos = yt.playlists.getVideos(playlist.id).take(20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ElevatedButton(onPressed: youtubbe, child: const Text("yoyo"))],
      ),
    );
  }
}
