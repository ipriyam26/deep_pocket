class Catagory {
  String Name;
  String Image;
  List<SubCatagory> subcatagory;

  Catagory({
    required this.Name,
    required this.Image,
    required this.subcatagory,
  });
}

class SubCatagory {
  String Name;
  String Image;

  SubCatagory({
    required this.Name,
    required this.Image,
  });
}

class ModelCatagory {
  List<Catagory> modelCatagory = [
    Catagory(
      Name: "Development",
      Image: "imageurl",
      subcatagory: [
        SubCatagory(Name: "WEB DEVELOPMENT", Image: "Imageurl"),
        SubCatagory(Name: "Game DEVELOPMENT", Image: "Imageurl"),
        SubCatagory(Name: "Android DEVELOPMENT", Image: "Imageurl"),
        SubCatagory(Name: "Flutter DEVELOPMENT", Image: "Imageurl"),
      ],
    ),
    Catagory(
      Name: "IT AND SOFTWARE",
      Image: "imageurl",
      subcatagory: [
        SubCatagory(Name: "NETWORKS AND SECURITY", Image: "Imageurl"),
        SubCatagory(Name: "Hardware", Image: "Imageurl"),
        SubCatagory(Name: "Android DEVELOPMENT", Image: "Imageurl"),
        SubCatagory(Name: "Flutter DEVELOPMENT", Image: "Imageurl"),
      ],
    )
  ];
}
