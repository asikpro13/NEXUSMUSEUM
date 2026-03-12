import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusmuseum/globals.dart';
import 'package:nexusmuseum/uikit/colors.dart';

// Работа с календарем
class DateSelectorHelper {
  static const List<String> _months = ['января', 'февраля', 'марта', 'апреля', 'мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря'];

  static String formatDate(DateTime? date, {String? time = '19:30'}) {
    if (date == null) return '';
    return '${date.day} ${_months[date.month - 1]} ${date.year} г., $time';
  }

  static String formatDateOnly(DateTime date) {
    return '${date.day} ${_months[date.month - 1]} ${date.year} г.';
  }

  static Future<DateTime?> showSimpleDatePicker({required BuildContext context, DateTime? initialDate, Color? accentColor}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('ru'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: accentColor ?? gold, onPrimary: Colors.white, onSurface: black),
            textTheme: TextTheme(headlineMedium: GoogleFonts.inter(), bodyLarge: GoogleFonts.inter(), bodyMedium: GoogleFonts.inter(), labelLarge: GoogleFonts.inter()),
          ),
          child: child!,
        );
      },
    );
    return picked;
  }

  static Future<String?> showTimeSelector({required BuildContext context, String? initialTime, Color? accentColor, List<String>? customTimes}) {
    final List<String> times = customTimes ?? ['10:00', '12:00', '13:00', '14:00', '15:00', '17:00', '18:00', '19:30', '21:00'];

    return showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(color: light_gray, borderRadius: BorderRadius.circular(2)),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Выберите время',
                  style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: times.length,
                  itemBuilder: (context, index) {
                    final time = times[index];
                    final isSelected = time == initialTime;

                    return GestureDetector(
                      onTap: () => Navigator.pop(context, time),
                      child: Container(
                        decoration: BoxDecoration(color: isSelected ? (accentColor ?? gold).withOpacity(0.1) : Colors.transparent, borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            time,
                            style: GoogleFonts.inter(fontSize: 14, color: isSelected ? (accentColor ?? gold) : black, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

// Функция форматирования даты и времени
String formatSelectedDateTime() {
  if (selectedDate == null) {
    return ''; // Значение по умолчанию
  }
  return DateSelectorHelper.formatDate(selectedDate, time: selectedTime);
}
