// ignore_for_file: non_constant_identifier_names, camel_case_types

class Host {
  final String Name;
  final String img;
  final String designation;

  Host({
    required this.Name,
    required this.designation,
    required this.img,
  });
}

class event {
  final String Name;
  final String description;
  final List<Host> host;
  final DateTime date;
  final DateTime? endDate;
  final String title;
  final String imgsrc;

  event({
    required this.Name,
    required this.date,
    required this.description,
    this.endDate,
    required this.host,
    required this.title,
    required this.imgsrc,
  });
}

class mockEvent {
  final List<event> _mockD = [
    event(
      Name: "Hackathon",
      title: "Google Leetcode",
      date: DateTime.utc(2021, 10, 31),
      description:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      host: [
        Host(
            Name: "Amy Jackson",
            designation: "Host",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Organizer",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      imgsrc:
          "https://image.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg",
    ),
    event(
      Name: "Guest Speech",
      title: "Steve Jobs",
      date: DateTime.utc(2021, 11, 5),
      description:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      host: [
        Host(
            Name: "Amy Jackson",
            designation: "Host",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Organizer",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      imgsrc:
          "https://image.freepik.com/free-vector/hand-drawn-vintage-microphone_23-2148159122.jpg",
    ),
    event(
      Name: "Game Blast",
      title: "ROG Red Rocks",
      date: DateTime.utc(2021, 10, 30),
      endDate: DateTime.utc(2021, 11, 1),
      description:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      host: [
        Host(
            Name: "Amy Jackson",
            designation: "Host",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Organizer",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      imgsrc:
          "https://image.freepik.com/free-vector/skull-gaming-with-joy-stick-emblem-modern-style_32991-492.jpg",
    ),
    event(
      Name: "MockTest",
      title: "GATE Prep Test",
      date: DateTime.utc(2021, 11, 2),
      endDate: DateTime.utc(2021, 11, 14),
      description:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      host: [
        Host(
            Name: "Amy Jackson",
            designation: "Host",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Organizer",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      imgsrc:
          "https://image.freepik.com/free-vector/clipboard-with-survey-chronometer_23-2147611001.jpg",
    ),
  ];

  List<event> get mockE {
    return [..._mockD];
  }
}
