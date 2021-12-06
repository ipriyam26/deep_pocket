// ignore_for_file: non_constant_identifier_names, camel_case_types

class Book {
  String Name;
  String Author;
  String topic;
  String link;

  String CoverImage;

  Book({
    required this.topic,
    required this.Name,
    required this.Author,
    required this.link,
    required this.CoverImage,
  });
}

class mockBooks {
  final List<Book> _modelBook = [
    Book(
      topic: 'Physics',
      Name: 'INTRODUCTION TO ELECTRODYNAMICS',
      Author: 'David J. Griffiths',
      link:
          'http://himafi.fmipa.unej.ac.id/wp-content/uploads/sites/16/2018/09/Introduction-to-Electrodinamic.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/41SmJRCkGYL._SX383_BO1,204,203,200_.jpg',
    ),
    Book(
      topic: 'Maths',
      Name: 'Introduction to Real Analysis',
      Author: 'Robert G. Bartle',
      link:
          'http://www.uop.edu.pk/ocontents/G.%20Bartle%20,%20R.%20Sherbert,%20%E2%80%9CIntroduction%20to%20Real%20Analysis.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/51rJ9pad2OL.jpg',
    ),
    Book(
      topic: 'ECE',
      Name: 'Introductory Circuit Analysis',
      Author: 'Robert L Boylstad',
      link:
          'http://www.portcity.edu.bd/files/636444788004398358_introductorycircuitanalysis.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/91zH6A9xo-L.jpg',
    ),
    Book(
      topic: 'Maths',
      Name: 'Elementary Analysis: The Theory of Calculus',
      Author: 'Kenneth A. Ross',
      link:
          'https://piazza.com/class_profile/get_resource/ixbzgb46cf85ri/j0eaxrf238r4rl',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/511ghIkbzAL.jpg',
    ),
    Book(
      topic: 'Maths',
      Name: 'THOMAS’ CALCULUS: EARLY TRANSCENDENTALS',
      Author: 'George B. Thomas, Jr',
      link:
          'https://rodrigopacios.github.io/mrpacios/download/Thomas_Calculus.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/51Nqw3K357L.jpg',
    ),
    Book(
      topic: 'CSE',
      Name: 'Think Python: How to Think Like a Computer Scientist',
      Author: 'Allen Downey',
      link: 'http://cs.williams.edu/~cs134/thinkpython2.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/71ND9kxGLGL.jpg',
    ),
    Book(
      topic: 'CSE',
      Name:
          'Introduction to Computer: Science Using Python: A Computational Problem-Solving Focus',
      Author: 'Charles Dierbach',
      link:
          'https://drive.google.com/file/d/1JYKakznG9gHcW2OwUKvTr1AiOyG1ZRBb/view?usp=sharing',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/51eXy1VpBVL._SX258_BO1,204,203,200_.jpg',
    ),
    Book(
      topic: 'ECE',
      Name: 'Electronic Devices and Circuits',
      Author: 'Dr. K. Lal Kishore',
      link: 'https://docs.google.com/file/d/0B21HoBq6u9TsYURmMHMwZktEbDA/',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/51YWPY25GQL._SX383_BO1,204,203,200_.jpg',
    ),
    Book(
      topic: 'CSE',
      Name: 'Java The Complete Reference',
      Author: 'Herbert Schildt',
      link:
          'https://gfgc.kar.nic.in/sirmv-science/GenericDocHandler/138-a2973dc6-c024-4d81-be6d-5c3344f232ce.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/61+jPzV1gyL.jpg',
    ),
    Book(
      topic: 'DBMS',
      Name: 'Database Systems: The Complete Book',
      Author: 'Héctor García-Molina',
      link: 'https://people.inf.elte.hu/kiss/DB/ullman_the_complete_book.pdf',
      CoverImage:
          'https://images-na.ssl-images-amazon.com/images/I/51P438RBT6L._SX360_BO1,204,203,200_.jpg',
    ),
  ];
  List<Book> get mockBook {
    return [..._modelBook];
  }
}
