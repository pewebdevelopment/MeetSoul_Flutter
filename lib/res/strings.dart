import 'package:datingui/res/images.dart';
import 'package:flutter/material.dart';

import '../screens/intro/views/IntroScreen.dart';


const String APP_NAME = "Meet SoulMate!";


const String HINT_ENTER_EMAIL = "Enter Email ID";
const String HINT_EMAIL = "Email ID";
const String HINT_ENTER_PASSWORD = "Enter Password";
const String HINT_PASSWORD = "Password";
const String HINT_ENTER_NAME = "Enter Name";
const String HINT_FULL_NAME = "Full Name";
//---
const String MESSAGE_INVALID_EMAIL = "Please Enter vaild email id";
const String MESSAGE_INVALID_PASSWORD = "Please enter pasword";
const String MESSAGE_INVALID_PASSWORD_LENGTH = "Password length must be greater than 7";
const String MESSAGE_ENTER_NAME = "Please enter name";
const String MESSAGE_ENTER_DOB = "Please enter dob";
const String MESSAGE_ADD_IMAGE = "Please add atleast 1 image";
const String MESSAGE_SELECT_HOBBY = "Please select atleast 1 hobby";
const String MESSAGE_SELECT_REALTIONSTATUS = "Please select relationship status";
const String MESSAGE_SELECT_GENDER = "Please select gender";
const String MESSAGE_INVALID_OTP = "Invalid otp";
const String MESSAGE_VERIFIED = "VERIFICATION SUCCESSFULL";
//---
const String TXT_NEXT = "Next";
const String TXT_FP = "forgot password?";
const String TXT_DOB = "DOB";
const String TXT_SIGNIN = "Sign in";
const String TXT_SIGNUP = "Sign up";
const String TXT_DISCOVER = "Discover";
const String TXT_MATCHES = "Matches";
const String TXT_MESSAGES = "Messages";
const String TXT_NO_PROFILE = "No more profiles! 😕\nTry after\nSome\nTime❤️";
// ==
const String BASE_URL = "http://192.168.1.67:3000/";

List<String> relationOptions = [
  'Single', 'Married', 'inRelationship',
  'Divorced', 'Widowed'
];
List<String> hobbbiesOptions = [
  '3D printing',
  'Amateur radio',
  'Scrapbook',
  'Amateur radio',
  'Acting',
  'Baton twirling',
  'Board games',
  'Book restoration',
  'Cabaret',
  'Calligraphy',
  'Candle making',
  'Computer programming',
  'Coffee roasting',
  'Cooking',
  'Colouring',
  'Cosplaying',
  'Couponing',
  'Creative writing',
  'Crocheting',
  'Cryptography',
  'Dance',
  'Digital arts',
  'Drama',
  'Drawing',
  'Do it yourself',
  'Electronics',
  'Embroidery',
  'Fashion',
  'Flower arranging',
  'Foreign language learning',
  'Gaming',
  'Tabletop games',
  'Role-playing games',
  'Gambling',
  'Genealogy',
  'Glassblowing',
  'Gunsmithing',
  'Homebrewing',
  'Ice skating',
  'Jewelry making',
  'Jigsaw puzzles',
  'Juggling',
  'Knapping',
  'Knitting',
  'Kabaddi',
  'Knife making',
  'Lacemaking',
  'Lapidary',
  'Leather crafting',
  'Lego building',
  'Lockpicking',
  'Machining',
  'Macrame',
  'Metalworking',
  'Magic',
  'Model building',
  'Listening to music',
  'Origami',
  'Painting',
  'Playing musical instruments',
  'Pet',
  'Poi',
  'Pottery',
  'Puzzles',
  'Quilting',
  'Reading',
  'Scrapbooking',
  'Sculpting',
  'Sewing',
  'Singing',
  'Sketching',
  'Soapmaking',
  'Sports',
  'Stand-up comedy',
  'Sudoku',
  'Table tennis',
  'Taxidermy',
  'Video gaming',
  'Watching movies',
  'Web surfing',
  'Whittling',
  'Wood carving',
  'Woodworking',
  'World Building',
  'Writing',
  'Yoga',
  'Yo-yoing',
  'Air sports',
  'Archery',
  'Astronomy',
  'Backpacking',
  'Base jumping',
  'Baseball',
  'Basketball',
  'Beekeeping',
  'Bird watching',
  'Blacksmithing',
  'Board sports',
  'Bodybuilding',
  'Brazilian jiu-jitsu',
  'Community',
  'Cycling',
  'Dowsing',
  'Driving',
  'Fishing',
  'Flag football',
  'Flying',
  'Flying disc',
  'Foraging',
  'Gardening',
  'Geocaching',
  'Ghost hunting',
  'Graffiti',
  'Handball',
  'Hiking',
  'Hooping',
  'Horseback riding',
  'Hunting',
  'Inline skating',
  'Jogging',
  'Kayaking',
  'Kite flying',
  'Kitesurfing',
  'Larping',
  'Letterboxing',
  'Metal detecting',
  'Motor sports',
  'Mountain biking',
  'Mountaineering',
  'Mushroom hunting',
  'Mycology',
  'Netball',
  'Nordic skating',
  'Orienteering',
  'Paintball',
  'Parkour',
  'Photography',
  'Polo',
  'Rafting',
  'Rappelling',
  'Rock climbing',
  'Roller skating',
  'Rugby',
  'Running',
  'Sailing',
  'Sand art',
  'Scouting',
  'Scuba diving',
  'Sculling',
  'Rowing',
  'Shooting',
  'Shopping',
  'Skateboarding',
  'Skiing',
  'Skim Boarding',
  'Skydiving',
  'Slacklining',
  'Snowboarding',
  'Stone skipping',
  'Surfing',
  'Swimming',
  'Taekwondo',
  'Tai chi',
  'Urban exploration',
  'Vacation',
  'Vehicle restoration',
  'Water sports'
];


List<IntroData> images = [IntroData(AppImages.lottiecouple,"Get Coupled\nwith your love","Find a congo based on who you really are\n and what you love"),
  IntroData(AppImages.lottiecouplesecond,"Find Your Best\nFriend with us","Let's find your life partner to enjoy\nlife to be better")];
const String LIKE = "Like";
const String DISLIKE = "Dislike";
