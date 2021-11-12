var Department = [
  'Student Affairs',
  'Acadamics',
  'Admin',
  "Central Libray",
  'Construction',
  'Design Innovation',
  'Finance',
  'Sports',
  'Dean'
];

class notice {
  final String title;
  final String content;
  final String sender;
  final int depNo;
  final DateTime date;

  notice({
    required this.content,
    required this.date,
    required this.depNo,
    required this.sender,
    required this.title,
  });
}

class mockN {
  final List<notice> _mockNotice = [
    notice(
      content:
          "Being a skilled programmer is hard but HackerEarth makes it easy for you toImprove your coding skills. We have curated tutorials and coding problems across topics like Algorithms, Data structures, Machine Learning etc. for you to practice. Check out our Practice section and start improving your coding skills.",
      date: DateTime.utc(2021, 11, 1),
      depNo: 1,
      sender: "Team HackerEarth",
      title: "Improve your coding skills is to practice",
    ),
    notice(
      content:
          "Being a skilled programmer is hard but HackerEarth makes it easy for you toImprove your coding skills. We have curated tutorials and coding problems across topics like Algorithms, Data structures, Machine Learning etc. for you to practice. Check out our Practice section and start improving your coding skills.",
      date: DateTime.utc(2021, 11, 3),
      depNo: 3,
      sender: "Team HackerEarth",
      title: "InkWell not showing ripple effect",
    ),
    notice(
      content:
          "This sample shows how to style a TextField using an InputDecorator. The TextField displays a  icon to the left of the input area, which is surrounded by a border an all sides. It displays the hintText inside the input area to help the user understand what input is required. It displays the helperText and counterText below the input area.",
      date: DateTime.utc(2021, 11, 10),
      depNo: 2,
      sender: "Team HackerEarth",
      title: "Design Thinking is not an exclusive property of designers",
    ),
    notice(
      content:
          "Despite his limited free time, Corky graduated high school at just 16. He saved for college but after one year couldn’t afford the high cost of tuition, so he embraced his athleticism to become an amateur boxer in 1944. At 19, Corky went pro as a featherweight. At the peak of his career, he was ranked as a top 3 featherweight boxer worldwide, but discriminatory organizers never gave him the chance to fight for the title. Retiring from boxing as a local star in 1955, he decided to use his platform and influence to advocate against racial and socioeconomic injustice across the nation",
      date: DateTime.utc(2021, 11, 8),
      depNo: 5,
      sender: "Team HackerEarth",
      title: "Will Finish Both Left And Right",
    ),
    notice(
      content:
          "Being a skilled programmer is hard but HackerEarth makes it easy for you toImprove your coding skills. We have curated tutorials and coding problems across topics like Algorithms, Data structures, Machine Learning etc. for you to practice. Check out our Practice section and start improving your coding skills.",
      date: DateTime.utc(2021, 11, 11),
      depNo: 7,
      sender: "Team HackerEarth",
      title: "Improve your coding skills is to practice",
    ),
    notice(
      content:
          "Being a skilled programmer is hard but HackerEarth makes it easy for you toImprove your coding skills. We have curated tutorials and coding problems across topics like Algorithms, Data structures, Machine Learning etc. for you to practice. Check out our Practice section and start improving your coding skills.",
      date: DateTime.utc(2021, 11, 21),
      depNo: 2,
      sender: "Team HackerEarth",
      title: "Improve your coding skills is to practice",
    ),
  ];

  List<notice> get mockNotic {
    return [..._mockNotice];
  }
}
