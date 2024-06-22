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

// Make a model with flag country name and country code
class CountryCode {
  final String name;
  final String code;
  final String flagSrc;

  CountryCode({
    required this.name,
    required this.code,
    required this.flagSrc,
  });
}

final List<CountryCode> countryCodes = [
  CountryCode(
    name: 'India',
    code: '+91',
    flagSrc: 'assets/images/flags/IN_flag.png',
  ),
  CountryCode(
    name: 'Japan',
    code: '+81',
    flagSrc: 'assets/images/flags/JP_flag.png',
  ),
  CountryCode(
    name: 'United States',
    code: '+1',
    flagSrc: 'assets/images/flags/US_flag.png',
  ),
  CountryCode(
    name: 'United Kingdom',
    code: '+44',
    flagSrc: 'assets/images/flags/GB_flag.png',
  ),
  CountryCode(
    name: 'South Korea',
    code: '+82',
    flagSrc: 'assets/images/flags/KR_flag.png',
  ),
  CountryCode(
    name: 'Canada',
    code: '+1',
    flagSrc: 'assets/images/flags/CA_flag.png',
  ),
  CountryCode(
    name: 'Germany',
    code: '+49',
    flagSrc: 'assets/images/flags/DE_flag.png',
  ),
  CountryCode(
    name: 'Australia',
    code: '+61',
    flagSrc: 'assets/images/flags/AU_flag.png',
  ),
  CountryCode(
    name: 'France',
    code: '+33',
    flagSrc: 'assets/images/flags/FR_flag.png',
  ),
  CountryCode(
    name: 'Brazil',
    code: '+55',
    flagSrc: 'assets/images/flags/BR_flag.png',
  ),
  CountryCode(
    name: 'China',
    code: '+86',
    flagSrc: 'assets/images/flags/CN_flag.png',
  ),
  CountryCode(
    name: 'Russia',
    code: '+7',
    flagSrc: 'assets/images/flags/RU_flag.png',
  ),
  CountryCode(
    name: 'Italy',
    code: '+39',
    flagSrc: 'assets/images/flags/IT_flag.png',
  ),
  CountryCode(
    name: 'Nigeria',
    code: '+234',
    flagSrc: 'assets/images/flags/NG_flag.png',
  ),
  CountryCode(
    name: 'Spain',
    code: '+34',
    flagSrc: 'assets/images/flags/ES_flag.png',
  ),
  CountryCode(
    name: 'Mexico',
    code: '+52',
    flagSrc: 'assets/images/flags/MX_flag.png',
  ),
  CountryCode(
    name: 'Indonesia',
    code: '+62',
    flagSrc: 'assets/images/flags/ID_flag.png',
  ),
  CountryCode(
    name: 'Turkey',
    code: '+90',
    flagSrc: 'assets/images/flags/TR_flag.png',
  ),
  CountryCode(
    name: 'Netherlands',
    code: '+31',
    flagSrc: 'assets/images/flags/NL_flag.png',
  ),
];
