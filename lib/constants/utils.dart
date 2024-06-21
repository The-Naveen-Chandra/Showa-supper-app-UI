class CarouselItem {
  final String imgSrc;
  final String title;
  final String description;

  CarouselItem({
    required this.imgSrc,
    required this.title,
    required this.description,
  });
}

final List<CarouselItem> items = [
  CarouselItem(
    imgSrc: 'assets/images/carousel_image_1.png',
    title: 'Internet of Things',
    description: "Effortless automation, smarter living",
  ),
  CarouselItem(
    imgSrc: 'assets/images/carousel_image_2.png',
    title: 'Maintenance at your fingertips',
    description: "Efficiently schedule, hassle-free maintenance",
  ),
  CarouselItem(
    imgSrc: 'assets/images/carousel_image_3.png',
    title: 'Plug and play sensor',
    description: "Stay ahead of machine failures",
  ),
  CarouselItem(
    imgSrc: 'assets/images/carousel_image_4.png',
    title: 'Accessible Marketplace',
    description: "Connect globally, shop easily",
  ),
  CarouselItem(
    imgSrc: 'assets/images/carousel_image_5.png',
    title: 'Chat',
    description: "Stay connected, stay happy",
  ),
];
