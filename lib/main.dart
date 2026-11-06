import 'package:flutter/material.dart';
import 'viewmodels/cruise_booking_viewmodel.dart';
import 'views/cruise_booking_screen.dart';

void main() {
  runApp(const RajangCruiseApp());
}

class RajangCruiseApp extends StatefulWidget {
  const RajangCruiseApp({super.key});

  @override
  State<RajangCruiseApp> createState() => _RajangCruiseAppState();
}

class _RajangCruiseAppState extends State<RajangCruiseApp> {
  final CruiseBookingViewModel viewModel = CruiseBookingViewModel();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rajang River Cruise',
          theme: viewModel.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: CruiseBookingScreen(viewModel: viewModel),
        );
      },
    );
  }
}