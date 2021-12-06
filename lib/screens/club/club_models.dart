// ignore_for_file: camel_case_types, non_constant_identifier_names

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

class club {
  final String name;
  final String descrption;
  final String img;
  final String social;
  final List<Host> leaders;
  final int membersNo;
  final String theme;

  club({
    required this.descrption,
    required this.img,
    required this.leaders,
    required this.membersNo,
    required this.name,
    required this.social,
    required this.theme,
  });
}

class clubstream {
  final List<club> _clubs = [
    club(
      theme: 'music',
      descrption:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      img:
          "https://image.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg",
      leaders: [
        Host(
            Name: "Amy Jackson",
            designation: "Head",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Deputy Chief",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      membersNo: 32,
      name: "Google Leetcode",
      social: "ipriyam26@gmail.com",
    ),
    club(
      theme: 'sports',
      descrption:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      img:
          "https://image.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg",
      leaders: [
        Host(
            Name: "Amy Jackson",
            designation: "Head",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Deputy Chief",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      membersNo: 32,
      name: "Google Leetcode",
      social: "ipriyam26@gmail.com",
    ),
    club(
      theme: 'UI',
      descrption:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      img:
          "https://image.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg",
      leaders: [
        Host(
            Name: "Amy Jackson",
            designation: "Head",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Deputy Chief",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      membersNo: 32,
      name: "Google Leetcode",
      social: "ipriyam26@gmail.com",
    ),
    club(
      theme: 'devlopment',
      descrption:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      img:
          "https://image.freepik.com/free-vector/laptop-with-program-code-isometric-icon-software-development-programming-applications-dark-neon_39422-971.jpg",
      leaders: [
        Host(
            Name: "Amy Jackson",
            designation: "Head",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Deputy Chief",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      membersNo: 32,
      name: "Google Leetcode",
      social: "ipriyam26@gmail.com",
    ),
    club(
      theme: 'drama',
      descrption:
          "A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the",
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
      leaders: [
        Host(
            Name: "Amy Jackson",
            designation: "Head",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg"),
        Host(
            Name: "Salman Khan",
            designation: "Deputy Chief",
            img:
                "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg")
      ],
      membersNo: 32,
      name: "Google Leetcode",
      social: "ipriyam26@gmail.com",
    ),
  ];
  List<club> get mockClub {
    return [..._clubs];
  }
}
