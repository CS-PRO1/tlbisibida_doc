import 'package:intl/intl.dart';

/// Top-level function to calculate age from a birthdate string (YYYY-MM-DD)
int calculateAge(String? birthdate) {
  if (birthdate == null || birthdate.isEmpty) {
    return 0;
  }
  try {
    final birth = DateTime.parse(birthdate);
    final today = DateTime.now();
    int age = today.year - birth.year;
    if (today.month < birth.month ||
        (today.month == birth.month && today.day < birth.day)) {
      age--;
    }
    return age;
  } catch (e) {
    return 0;
  }
}

class DateUtils {
  /// Calculates age from a birthdate string in format "YYYY-MM-DD"
  /// Returns the age as a string in Arabic format
  static String calculateAge(String? birthdate) {
    if (birthdate == null || birthdate.isEmpty) {
      return 'غير محدد';
    }

    try {
      // Parse the birthdate string
      final DateTime birthDate = DateTime.parse(birthdate);
      final DateTime now = DateTime.now();

      // Calculate age
      int age = now.year - birthDate.year;

      // Adjust age if birthday hasn't occurred yet this year
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        age--;
      }

      // Return age in Arabic format
      return '$age سنة';
    } catch (e) {
      // If parsing fails, return the original string
      return birthdate;
    }
  }

  /// Formats a date string to Arabic format
  static String formatDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return 'غير محدد';
    }

    try {
      final DateTime date = DateTime.parse(dateString);
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return dateString;
    }
  }

  /// Gets the current year
  static int getCurrentYear() {
    return DateTime.now().year;
  }
}
