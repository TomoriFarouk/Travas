import 'package:equatable/equatable.dart';

class RequestTour extends Equatable {
  final List<String> imageUrl;
  final String name;
  final num price;
  final String body;
  const RequestTour(
      {required this.imageUrl,
      required this.body,
      required this.name,
      required this.price});

  @override
  // TODO: implement props
  List<Object> get props => [
        imageUrl,
        name,
        price,
      ];

  static List<RequestTour> requestTour = const [
    RequestTour(
        imageUrl: [
          "assets/Rectangle1.png",
          "assets/Rectangle1.png",
          "assets/Rectangle1.png"
        ],
        name: "Patagi beach",
        price: 5,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
    RequestTour(
        imageUrl: [
          "assets/Rectangle2.png",
          "assets/Rectangle2.png",
          "assets/Rectangle2.png",
        ],
        name: "Tinapa resort",
        price: 4,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
    RequestTour(
        imageUrl: [
          "assets/Rectangle3.png",
          "assets/Rectangle3.png",
          "assets/Rectangle3.png"
        ],
        name: "Osun groove",
        price: 3,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
    RequestTour(
        imageUrl: [
          "assets/Rectangle4.png",
          "assets/Rectangle4.png",
          "assets/Rectangle4.png"
        ],
        name: "Patagi beach",
        price: 5,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
    RequestTour(
        imageUrl: [
          "assets/Rectangle5.png",
          "assets/Rectangle5.png",
          "assets/Rectangle5.png"
        ],
        name: "Patagi beach",
        price: 4,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
    RequestTour(
        imageUrl: [
          "assets/Rectangle0.png",
          "assets/Rectangle0.png",
          "assets/Rectangle0.png"
        ],
        name: "Patagi beach",
        price: 5,
        body:
            'Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean.Nigeria, officially the Federal Republic of Nigeria, is a country in Wes Africa. It is geographically situated between the sahel to the north and the Gulf of Guinea to the south in the Atlantic Ocean. south in th...'),
  ];
}
