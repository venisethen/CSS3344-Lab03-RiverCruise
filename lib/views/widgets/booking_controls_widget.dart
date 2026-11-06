import 'package:flutter/material.dart';
import '../../viewmodels/cruise_booking_viewmodel.dart';

class BookingControlsWidget extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const BookingControlsWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final dateFormatted =
        '${viewModel.selectedDate.day.toString().padLeft(2, '0')}/${viewModel.selectedDate.month.toString().padLeft(2, '0')}/${viewModel.selectedDate.year}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          const Text(
            'Trip Preferences',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 8),

          // Cruise Date Row
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: viewModel.selectedDate,
                firstDate: DateTime(2025, 1, 1),
                lastDate: DateTime(2028, 12, 31),
              );
              if (picked != null) viewModel.updateDate(picked);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Cruise Date', style: TextStyle(color: Colors.grey.shade700)),
                  Text(
                    dateFormatted,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),

          // Package Mode Dropdown Row
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mode / Package', style: TextStyle(color: Colors.grey.shade700)),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: viewModel.selectedPackage,
                    alignment: Alignment.centerRight,
                    onChanged: (val) {
                      if (val != null) viewModel.updatePackage(val);
                    },
                    items: viewModel.packageList
                        .map((pkg) => DropdownMenuItem(
                      value: pkg,
                      child: Text(pkg, style: const TextStyle(fontWeight: FontWeight.w600)),
                    ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),

          // Dark Mode Switch Row
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark Mode Theme', style: TextStyle(color: Colors.grey.shade700)),
                Switch(
                  activeColor: const Color(0xFF5E35B1),
                  value: viewModel.isDarkMode,
                  onChanged: (val) => viewModel.toggleTheme(val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}