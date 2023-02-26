import 'package:equatable/equatable.dart';

class Carousell extends Equatable {
  final List<String> imageUrl;
  final String name;
  final String price;
  final String body;
  const Carousell(
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

  static List<Carousell> carousel = [
    Carousell(
        imageUrl: [
          "assets/purpleisland2.jpg",
          "assets/package.png",
          "assets/purpleisland3.jpg"
        ],
        name: "The Obudu Xperience",
        price: "#500,000",
        body:
            'The big five: Elephant, Lion, Rhino, Leopard and Buffalo. Kruger park is home to a stunning diversity of wildlife, trees, flowers and most importantly The big five. Steeped in legend and history with exquisite accomodations and meals. Kruger national park is one of the most famous tourist destinations in the world. To get the real taste of a safari tour, book a tour to Kruger national park.'),
    Carousell(
        imageUrl: [
          "assets/purpleisland2.jpg",
          "assets/package.png",
          "assets/purpleisland3.jpg"
        ],
        name: "Hiking and Climbing",
        price: "#500,000",
        body:
            '''Enjoy one of the best outdoor activities in the world in the beautiful city of Ilorin.
Our world has changed drastically since the pandemic and many people are feeling more isolated. Work from home has become the norm for many and social media, email and the general 24/7 noise of life can leave us more stressed out.
Disconnecting from technology and reconnecting with nature gives our brain a much-needed recharge, especially among those with sedentary occupations. Camping and Hiking helps you reconnect with nature, build better relationships and aids in overall physical and mental fitness'''),
    Carousell(
        imageUrl: [
          "assets/purpleisland2.jpg",
          "assets/package.png",
          "assets/purpleisland3.jpg"
        ],
        name: "Hiking and Climbing",
        price: "#500,000",
        body:
            '''Enjoy one of the best outdoor activities in the world in the beautiful city of Ilorin.
Our world has changed drastically since the pandemic and many people are feeling more isolated. Work from home has become the norm for many and social media, email and the general 24/7 noise of life can leave us more stressed out.
Disconnecting from technology and reconnecting with nature gives our brain a much-needed recharge, especially among those with sedentary occupations. Camping and Hiking helps you reconnect with nature, build better relationships and aids in overall physical and mental fitness'''),
  ];
}
