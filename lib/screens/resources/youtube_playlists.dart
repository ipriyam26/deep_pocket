// ignore_for_file: camel_case_types

class youtubePlaylist {
  String heading;
  List<String> youtubepl;
  youtubePlaylist({required this.heading, required this.youtubepl});
}

class plist {
  List<youtubePlaylist> mockYoutube = [
    youtubePlaylist(heading: 'Calculus I', youtubepl: [
      'https://www.youtube.com/playlist?list=PL58C7BA6C14FD8F48',
      'https://www.youtube.com/playlist?list=PLF797E961509B4EB5',
      'https://www.youtube.com/playlist?list=PLD7F5E25BF583F56B',
      'https://www.youtube.com/playlist?list=PLF0621D7720431053',
      'https://www.youtube.com/playlist?list=PL0o_zxa4K1BWYThyV4T2Allw6zY0jEumv',
    ]),
  ];
}
