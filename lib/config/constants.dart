import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// FIREBASE CONSTANTS
final firebaseAuth = FirebaseAuth.instance;
final fireStore = FirebaseFirestore.instance;

// API CONSTANTS
const TODAYS_PRICE_API_URL =
    "https://nepse-data-api.herokuapp.com/data/todaysprice";
