// ignore_for_file: non_constant_identifier_names

class Catagory {
  String Name;
  String Image;
  String Path;

  Catagory({
    required this.Name,
    required this.Image,
    required this.Path,
  });
}

class ModelCatagory {
  List<Catagory> modelCatagory = [
    Catagory(
        Name: "Biology",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/34/36/25/1000_F_334362594_XFIxEnLyZczTLg9mqKDZ6N59WsWvd5o0.jpg",
        Path: "json-files/Biology and life sciences.json"),
    Catagory(
        Name: "Business",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/49/46/65/1000_F_349466531_gc5Ex5I1ItYsB9ZZwaM0FRSoBz78fmeC.jpg",
        Path: "json-files/Business and Management.json"),
    Catagory(
        Name: "Chemistry",
        Image:
            "https://as2.ftcdn.net/v2/jpg/01/80/87/89/1000_F_180878974_IRo0TjGFLPCZhWeAgvRY62zJXgxOx7f5.jpg",
        Path: "json-files/Chemistry.json"),
    Catagory(
        Name: "Communication",
        Image:
            "https://as2.ftcdn.net/v2/jpg/02/19/02/91/1000_F_219029121_KjSOXukz887p9d6NIIJsgzKkxNh9LBMV.jpg",
        Path: "json-files/Communication.json"),
    Catagory(
        Name: "Computer Science",
        Image:
            "https://as1.ftcdn.net/v2/jpg/01/90/08/72/1000_F_190087283_QO7K9SSinzpNf6EaLUXoT8U5imTnOBqf.jpg",
        Path: "json-files/Computer Science.json"),
    Catagory(
        Name: "Design",
        Image:
            "https://as2.ftcdn.net/v2/jpg/02/39/40/03/1000_F_239400336_7QlARgBPNcpVtvcYJGodramAqJ8icGJZ.jpg",
        Path: "json-files/Design.json"),
    Catagory(
        Name: "Economics",
        Image:
            "https://as2.ftcdn.net/v2/jpg/04/34/05/67/1000_F_434056797_61T7sTSaDyopYst7PQlUH8i2ScXLR2QN.jpg",
        Path: "json-files/Economics and Finance.json"),
    Catagory(
        Name: "Educating",
        Image:
            "https://as1.ftcdn.net/v2/jpg/03/51/41/52/1000_F_351415292_Z0EzxYTFqwnQGCRctPWrjZrNKR2mHDhg.jpg",
        Path: "json-files/Education and Teaching.json"),
    Catagory(
        Name: "Earth Sciences",
        Image:
            "https://as1.ftcdn.net/v2/jpg/02/74/20/02/1000_F_274200269_N5QPv8JPpChOg0wfY4usRwMJVmMLbLzo.jpg",
        Path: "json-files/Energy and Earth Sciences.json"),
    Catagory(
        Name: "Engineering",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/59/49/69/1000_F_359496903_nLubAER25HOfodjQtwbl2ZfuMgmRXAAB.jpg",
        Path: "json-files/Engineering.json"),
    Catagory(
        Name: "Environmental Studies",
        Image:
            "https://as1.ftcdn.net/v2/jpg/02/87/56/62/1000_F_287566227_aHxsKWzktqcj1n645upkidfbXNK66piW.jpg",
        Path: "json-files/Environmental Studies.json"),
    Catagory(
        Name: "Health",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/52/39/85/1000_F_352398535_5MSbojIxHksBrUN0x3Ku6MuDEpYOtmIo.jpg",
        Path: "json-files/Health.json"),
    Catagory(
        Name: "History",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/09/72/51/1000_F_309725185_EF1hjsGCSNwhJV0AJuunfzwDKohnNkqR.jpg",
        Path: "json-files/History.json"),
    Catagory(
        Name: "Humanities",
        Image:
            "https://as2.ftcdn.net/v2/jpg/01/67/80/31/1000_F_167803177_I0PCroUhEiy7tNhIUcRtG4j22H0WePkm.jpg",
        Path: "json-files/Humanities.json"),
    Catagory(
        Name: "Information Technology",
        Image:
            "https://as2.ftcdn.net/v2/jpg/04/66/33/33/1000_F_466333318_JZMoXJhruXbGC5LqZeW8ywevTVus4vZe.jpg",
        Path: "json-files/Information Technology.json"),
    Catagory(
        Name: "Language Learning",
        Image:
            "https://as2.ftcdn.net/v2/jpg/01/00/71/81/1000_F_100718176_MqHOm6p25x60Hw6DIIKLO84TkDHomfaz.jpg",
        Path: "json-files/Language Learning.json"),
    Catagory(
        Name: "Math and Logic",
        Image:
            "https://as1.ftcdn.net/v2/jpg/02/79/98/86/1000_F_279988664_h1LKfv9dTTqY58HlIYgowhE0S6yndwfA.jpg",
        Path: "json-files/Math and Logic.json"),
    Catagory(
        Name: "Personal Development",
        Image:
            "https://as2.ftcdn.net/v2/jpg/04/66/91/89/1000_F_466918900_TV6qXbpIsl52li8OCt8B8h14ae68NA6U.jpg",
        Path: "json-files/Personal Development.json"),
    Catagory(
        Name: "Physical Science",
        Image:
            "https://as1.ftcdn.net/v2/jpg/02/83/02/20/1000_F_283022057_IZyCv1yKu1VpjdmUNjPb0Sa4bSHIKFsS.jpg",
        Path: "json-files/Physical Science and Engineering.json"),
    Catagory(
        Name: "Physics",
        Image:
            "https://as1.ftcdn.net/v2/jpg/03/52/28/40/1000_F_352284080_lYOToNLttSF47wBetWcdxogaISZGvPKX.jpg",
        Path: "json-files/Physics.json"),
    Catagory(
        Name: "Science",
        Image:
            "https://as2.ftcdn.net/v2/jpg/03/26/35/63/1000_F_326356390_Q7UbJCwOybElNOhHylweRoRWX8yFAtoR.jpg",
        Path: "json-files/Science.json"),
    Catagory(
        Name: "Social Sciences",
        Image:
            "https://as2.ftcdn.net/v2/jpg/02/82/23/85/1000_F_282238593_CkPvvJn0svz9T3aQRoV8CgUT5K0mSwwV.jpg",
        Path: "json-files/Social Sciences.json"),
  ];

  List<Catagory> get courseE {
    return [...modelCatagory];
  }
}
