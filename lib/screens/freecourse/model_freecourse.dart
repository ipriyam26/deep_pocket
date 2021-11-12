// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.statusCode,
    required this.request,
    required this.response,
  });

  int statusCode;
  Request request;
  Response response;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        statusCode: json["statusCode"],
        request: Request.fromJson(json["request"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "request": request.toJson(),
        "response": response.toJson(),
      };
}

class Request {
  Request({
    required this.keywords,
    required this.lang,
    required this.provider,
    required this.sort,
    required this.max,
    required this.model,
    required this.address,
    required this.distanceMax,
    required this.ageMin,
    required this.ageMax,
    required this.popularityMin,
    required this.levelMin,
    required this.levelMax,
    required this.learningTimeMin,
    required this.learningTimeMax,
    required this.publisher,
    required this.author,
    required this.free,
    required this.page,
    required this.id,
  });

  String keywords;
  String lang;
  String provider;
  String sort;
  int max;
  String model;
  String address;
  String distanceMax;
  String ageMin;
  String ageMax;
  int popularityMin;
  String levelMin;
  String levelMax;
  String learningTimeMin;
  String learningTimeMax;
  String publisher;
  String author;
  String free;
  int page;
  String id;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        keywords: json["keywords"],
        lang: json["lang"],
        provider: json["provider"],
        sort: json["sort"],
        max: json["max"],
        model: json["model"],
        address: json["address"],
        distanceMax: json["distanceMax"],
        ageMin: json["ageMin"],
        ageMax: json["ageMax"],
        popularityMin: json["popularityMin"],
        levelMin: json["levelMin"],
        levelMax: json["levelMax"],
        learningTimeMin: json["learningTimeMin"],
        learningTimeMax: json["learningTimeMax"],
        publisher: json["publisher"],
        author: json["author"],
        free: json["free"],
        page: json["page"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "keywords": keywords,
        "lang": lang,
        "provider": provider,
        "sort": sort,
        "max": max,
        "model": model,
        "address": address,
        "distanceMax": distanceMax,
        "ageMin": ageMin,
        "ageMax": ageMax,
        "popularityMin": popularityMin,
        "levelMin": levelMin,
        "levelMax": levelMax,
        "learningTimeMin": learningTimeMin,
        "learningTimeMax": learningTimeMax,
        "publisher": publisher,
        "author": author,
        "free": free,
        "page": page,
        "id": id,
      };
}

class Response {
  Response({
    required this.content,
    required this.metadata,
    required this.msg,
  });

  List<Content> content;
  Metadata metadata;
  String msg;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        metadata: Metadata.fromJson(json["metadata"]),
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "metadata": metadata.toJson(),
        "msg": msg,
      };
}

class Content {
  Content({
    required this.title,
    required this.url,
    required this.description,
    required this.picture,
    required this.provider,
    required this.bloom,
    required this.type,
    required this.level,
    required this.lang,
    required this.learningTimeValue,
    required this.learningTimeUnit,
    required this.priceSpecification,
  });

  String title;
  String url;
  String description;
  String picture;
  String provider;
  List<String> bloom;
  List<String> type;
  double level;
  String lang;
  int learningTimeValue;
  String learningTimeUnit;
  PriceSpecification priceSpecification;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        title: json["title"],
        url: json["url"],
        description: json["description"],
        picture: json["picture"],
        provider: json["provider"],
        bloom: List<String>.from(json["bloom"].map((x) => x)),
        type: List<String>.from(json["type"].map((x) => x)),
        level: json["level"],
        lang: json["lang"],
        learningTimeValue: json["learningTimeValue"],
        learningTimeUnit: json["learningTimeUnit"],
        priceSpecification:
            PriceSpecification.fromJson(json["PriceSpecification"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "description": description,
        "picture": picture,
        "provider": provider,
        "bloom": List<dynamic>.from(bloom.map((x) => x)),
        "type": List<dynamic>.from(type.map((x) => x)),
        "level": level,
        "lang": lang,
        "learningTimeValue": learningTimeValue,
        "learningTimeUnit": learningTimeUnit,
        "PriceSpecification": priceSpecification.toJson(),
      };
}

class PriceSpecification {
  PriceSpecification({
    required this.context,
    required this.type,
    required this.price,
    required this.priceCurrency,
    required this.priceFree,
  });

  String context;
  String type;
  double price;
  String? priceCurrency;
  bool priceFree;

  factory PriceSpecification.fromJson(Map<String, dynamic> json) =>
      PriceSpecification(
        context: json["@context"],
        type: json["@type"],
        price: json["price"],
        priceCurrency:
            json["priceCurrency"] == null ? null : json["priceCurrency"],
        priceFree: json["price-free"],
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@type": type,
        "price": price,
        "priceCurrency": priceCurrency == null ? null : priceCurrency,
        "price-free": priceFree,
      };
}

class Metadata {
  Metadata({
    required this.page,
    required this.numberItemPerPage,
    required this.totalNumberItem,
    required this.hasMore,
  });

  int page;
  int numberItemPerPage;
  int totalNumberItem;
  bool hasMore;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        page: json["page"],
        numberItemPerPage: json["number item per page"],
        totalNumberItem: json["total number item"],
        hasMore: json["hasMore"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "number item per page": numberItemPerPage,
        "total number item": totalNumberItem,
        "hasMore": hasMore,
      };
}
