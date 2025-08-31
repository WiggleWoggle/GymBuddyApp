import 'package:gym_buddy_app/Division.dart';

class User {

  final String profileName;
  final String profilePicturePath;

  final int age;
  final String height;
  final String weight;

  final String town;
  final String city;

  final Division division;

  User({required this.town, required this.city, required this.height, required this.division, required this.weight, required this.age, required this.profileName, required this.profilePicturePath});
}

final List<User> mockUsers = [
  User(
    profileName: 'Alex',
    age: 21,
    height: '5\'11',
    weight: '180',
    town: 'Austin',
    city: 'Texas',
    division: Division.Titan,
    profilePicturePath: 'assets/personcard/profileImage1.png',
  ),
  User(
    profileName: 'Jordan',
    age: 23,
    height: '6\'0',
    weight: '175',
    town: 'Dallas',
    city: 'Texas',
    division: Division.Champion,
    profilePicturePath: 'assets/personcard/profileImage2.png',
  ),
  User(
    profileName: 'Phil',
    age: 31,
    height: '5\'9',
    weight: '165',
    town: 'Houston',
    city: 'Texas',
    division: Division.Beginner,
    profilePicturePath: 'assets/personcard/profileImage3.png',
  ),
  User(
    profileName: 'Phil',
    age: 31,
    height: '5\'9',
    weight: '165',
    town: 'Houston',
    city: 'Texas',
    division: Division.Advanced,
    profilePicturePath: 'assets/personcard/profileImage3.png',
  ),
  User(
    profileName: 'Jamie',
    age: 31,
    height: '5\'8',
    weight: '160',
    town: 'Beaumont',
    city: 'Texas',
    division: Division.Elite,
    profilePicturePath: 'assets/personcard/profileImage4.png',
  ),
  User(
    profileName: 'Donny',
    age: 31,
    height: '5\'10',
    weight: '180',
    town: 'Houston',
    city: 'Texas',
    division: Division.Intermediate,
    profilePicturePath: 'assets/personcard/profileImage5.png',
  ),
  User(
    profileName: 'Siddarth',
    age: 19,
    height: '5\'9',
    weight: '175',
    town: 'San Antonio',
    city: 'Texas',
    division: Division.Beginner,
    profilePicturePath: 'assets/personcard/profileImage6.png',
  ),
];