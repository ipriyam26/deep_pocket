// ignore_for_file: camel_case_types, non_constant_identifier_names

final skillLevel = ['Beginner', 'Intermediate', 'Advanced'];

class courseReviews {
  final String Name;
  final String image;
  final String review;
  final double rating;

  courseReviews(
      {required this.Name,
      required this.image,
      required this.rating,
      required this.review});
}

class instructor {
  String Name;
  String image;
  String Designation;
  instructor({
    required this.Designation,
    required this.Name,
    required this.image,
  });
}

class courseMock {
  String field;
  String image;
  String name;
  double rating;
  String description;
  int ratingNo;
  int skillLevel;
  double hours;
  int quiz;
  bool certificate;
  String link;
  int projects;
  double enrolled;
  List<instructor> instructors;
  List<courseReviews> userReview;

  courseMock({
    required this.enrolled,
    required this.projects,
    required this.description,
    required this.certificate,
    required this.field,
    required this.hours,
    required this.image,
    required this.link,
    required this.name,
    required this.quiz,
    required this.rating,
    required this.ratingNo,
    required this.skillLevel,
    required this.instructors,
    required this.userReview,
  });
}

class mockCourse {
  final List<courseMock> _mockDate = [
    courseMock(
        projects: 2,
        enrolled: 20.3,
        // enrolled: 20.3,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: true,
        field: "Data Science",
        hours: 20,
        image:
            "https://purepng.com/public/uploads/large/purepng.com-ibm-logologobrand-logoiconslogos-251519939176ka7y8.png",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "IBM Data Science Professional Certificate",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 0,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
    courseMock(
        projects: 0,
        enrolled: 21.9,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: false,
        field: "Digital Marketing",
        hours: 20,
        image:
            "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://d15cw65ipctsrr.cloudfront.net/02/41460a29d744dfa39106941eae2e02/fb-specialization.png?auto=format%2Ccompress&dpr=2&w=150&h=150&fit=fill&bg=FFF&q=25",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "Google digital",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 2,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
    courseMock(
        projects: 2,
        enrolled: 20.3,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: true,
        field: "Designing",
        hours: 20,
        image:
            "https://purepng.com/public/uploads/large/purepng.com-ibm-logologobrand-logoiconslogos-251519939176ka7y8.png",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "IBM Data Science Professional Certificate",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 0,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
    courseMock(
        projects: 2,
        enrolled: 20.3,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: true,
        field: "Software & IT",
        hours: 20,
        image:
            "https://purepng.com/public/uploads/large/purepng.com-ibm-logologobrand-logoiconslogos-251519939176ka7y8.png",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "IBM Data Science Professional Certificate",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 0,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
    courseMock(
        projects: 2,
        enrolled: 20.3,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: true,
        field: "Artificial Intelligence",
        hours: 20,
        image:
            "https://purepng.com/public/uploads/large/purepng.com-ibm-logologobrand-logoiconslogos-251519939176ka7y8.png",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "IBM Data Science Professional Certificate",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 0,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
    courseMock(
        projects: 2,
        enrolled: 20.3,
        description:
            "Kickstart your career in data science & ML. Build data science skills, learn Python & SQL, analyze & visualize data, build machine learning models. No degree or prior experience required.",
        certificate: true,
        field: "Digital Marketing",
        hours: 20,
        image:
            "https://purepng.com/public/uploads/large/purepng.com-ibm-logologobrand-logoiconslogos-251519939176ka7y8.png",
        link:
            "https://www.coursera.org/professional-certificates/ibm-data-science",
        name: "IBM Data Science Professional Certificate",
        quiz: 10,
        rating: 4.6,
        ratingNo: 50375,
        skillLevel: 0,
        userReview: [
          courseReviews(
              Name: "Ellen R.",
              image:
                  "https://upload.wikimedia.org/wikipedia/commons/8/86/Salman_Khan_at_Renault_Star_Guild_Awards.jpg",
              rating: 4.9,
              review:
                  "Apply your skills with hands-on projects and build a portfolio that showcases your job readiness to potential employers"),
          courseReviews(
            Name: "Priyam S.",
            image:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Amy_Jackson_headshot_%28cropped%29.jpg/440px-Amy_Jackson_headshot_%28cropped%29.jpg",
            rating: 4,
            review: "Great course changed my life totally",
          )
        ],
        instructors: [
          instructor(
            Designation: "Global Program Director",
            Name: "Rav Ahuja",
            image:
                "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/d6/c2a550312d11e8a1a3b7898153781d/ravahuja.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200",
          ),
          instructor(
              Designation: "Ph.D Data Scienties",
              Name: "Alex Aklson",
              image:
                  "https://d3njjcbhbojbot.cloudfront.net/api/utilities/v1/imageproxy/https://coursera-instructor-photos.s3.amazonaws.com/4e/41fff0261f11e8add0f59095431cc6/Alex-Aklson.jpg?auto=format%2Ccompress&dpr=2&w=200&h=200"),
        ]),
  ];

  List<courseMock> get mockcourse {
    return [..._mockDate];
  }
}
