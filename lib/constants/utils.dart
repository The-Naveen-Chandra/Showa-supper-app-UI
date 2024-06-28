import 'package:flutter/material.dart';
import 'package:showa_supper_app/screens/dashboard/chat_screen.dart';
import 'package:showa_supper_app/screens/dashboard/feed_screen.dart';
import 'package:showa_supper_app/screens/dashboard/home_screen.dart';
import 'package:showa_supper_app/screens/dashboard/profile_screen.dart';

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

class GridItemModel {
  final String imageUrl;
  final String title;

  GridItemModel({required this.imageUrl, required this.title});
}

final List<GridItemModel> gridItems = [
  GridItemModel(
    imageUrl: 'assets/images/reserve_grid_image.png',
    title: 'Reserve',
  ),
  GridItemModel(
    imageUrl: 'assets/images/marketplace_grid_image.png',
    title: 'Marketplace',
  ),
  GridItemModel(
    imageUrl: 'assets/images/iot_grid_image.png',
    title: 'IoT',
  ),
  GridItemModel(
    imageUrl: 'assets/images/wallet_grid_image.png',
    title: 'Wallet',
  ),
  GridItemModel(
    imageUrl: 'assets/images/subscription_grid_image.png',
    title: 'Subscription',
  ),
  GridItemModel(
    imageUrl: 'assets/images/help_ai_grid_image.png',
    title: 'Help AI',
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

final List<String> inputMethod = [
  "Alphabet",
  "Kanji",
];

final List<String> genderSelector = [
  "Male",
  "Female",
  "Prefer not to answer",
];

final List<String> occupationSelector = [
  "Student",
  "Engineer",
  "Doctor",
  "Teacher",
  "Business",
  "Female Nurse",
  "Nurse",
  "Dentist",
  "Scientist",
  "Hairdresser / Beauty Artist",
  "Pharmacist",
  "Singer",
  "Driver / Chauffeur",
  "Baseball Player",
  "Soccer Player",
  "Painter / Artist",
  "Photographer",
  "Artist",
  "Designer",
  "Writer",
  "Actor",
  "Musician",
  "Athlete",
  "Politician",
  "Lawyer",
  "Accountant",
  "Banker",
  "Consultant",
  "Chef",
  "Farmer",
  "Fisherman",
  "Pilot",
  "Flight Attendant",
  "Soldier",
  "Police Officer",
  "Firefighter",
  "Construction Worker",
  "Electrician",
  "Plumber",
  "Mechanic",
  "Carpenter",
  "Others",
];

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

final List<Widget> dashboardPages = [
  const HomeScreen(),
  const FeedScreen(),
  const ChatScreen(),
  const ProfileScreen(),
];
