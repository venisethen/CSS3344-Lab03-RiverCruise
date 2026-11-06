import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5E35B1),
        foregroundColor: Colors.white,
        title: const Text(
          'Sibu River Cruise & Heritage',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        actions: [
          OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.landscape) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Orientation.landscape',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            // Landscape: Side-by-Side Split View exactly like sample
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Pane: Image + Destination details
                Expanded(
                  flex: 5,
                  child: ListView(
                    children: [
                      HeaderImageWidget(
                        imageUrl: viewModel.destination.imageUrl,
                        label: 'Rajang River Horizon',
                      ),
                      DescriptionWidget(
                        text: viewModel.destination.description,
                        showHeader: true,
                      ),
                    ],
                  ),
                ),
                // Vertical divider between columns
                VerticalDivider(width: 1, thickness: 1, color: Colors.grey.shade300),
                // Right Pane: Title + Action Bar + Booking Form
                Expanded(
                  flex: 5,
                  child: ListView(
                    children: [
                      TitleSectionWidget(viewModel: viewModel),
                      const ActionBarWidget(),
                      BookingControlsWidget(viewModel: viewModel),
                    ],
                  ),
                ),
              ],
            );
          } else {
            // Portrait: Single vertical scroll view
            return ListView(
              children: [
                HeaderImageWidget(
                  imageUrl: viewModel.destination.imageUrl,
                  label: 'Sibu Esplanade Landmark',
                ),
                TitleSectionWidget(viewModel: viewModel),
                const ActionBarWidget(),
                DescriptionWidget(text: viewModel.destination.description),
                BookingControlsWidget(viewModel: viewModel),
              ],
            );
          }
        },
      ),
    );
  }
}