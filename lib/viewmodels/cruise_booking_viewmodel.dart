import 'package:flutter/material.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  // Destination Data
  final CruiseDestination destination = CruiseDestination(
    title: 'Rajang River Express Cruise',
    location: 'Sibu Waterfront, Sarawak',
    description:
    'Experience the heart of Sibu along Malaysia’s longest river, the Rajang. Cruise past historic temples, timber hubs, and waterfront settlements.',
    imageUrl:
    'https://images.unsplash.com/photo-1544644181-1484b3fdfc62?auto=format&fit=crop&w=800&q=80',
    starCount: 43,
  );

  // Interactive States
  DateTime selectedDate = DateTime(2026, 11, 15);
  String selectedPackage = 'Express Boat';
  bool isDarkMode = false;

  final List<String> packageList = [
    'Express Boat',
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  // Logic: Star rating counter
  void toggleStar() {
    if (destination.isFavorite) {
      destination.starCount -= 1;
      destination.isFavorite = false;
    } else {
      destination.starCount += 1;
      destination.isFavorite = true;
    }
    notifyListeners();
  }

  // Logic: Pick date
  void updateDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  // Logic: Change dropdown package
  void updatePackage(String newPackage) {
    selectedPackage = newPackage;
    notifyListeners();
  }

  // Logic: Toggle dark mode switch
  void toggleTheme(bool value) {
    isDarkMode = value;
    notifyListeners();
  }
}