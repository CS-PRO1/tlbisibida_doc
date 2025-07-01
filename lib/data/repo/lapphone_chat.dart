import 'dart:convert';

List<String> decodeLabPhoneNumbers(String jsonString) {
  try {
    final decodedOuterJson = jsonDecode(jsonString) as Map<String, dynamic>;

    if (decodedOuterJson.containsKey('lab_phone') &&
        decodedOuterJson['lab_phone'] is String) {
      final labPhoneString = decodedOuterJson['lab_phone'] as String;
      final phoneMap = jsonDecode(labPhoneString) as Map<String, dynamic>;
      return phoneMap.values.map((e) => e.toString()).toList();
    }
    return [];
  } on FormatException {
    return [];
  }
}

String encodeLabPhoneNumbers(List<String> phoneNumbers) {
  // Create a map where keys are sequential numbers (as strings) and values are phone numbers.
  final Map<String, String> phoneMap = {};
  for (int i = 0; i < phoneNumbers.length; i++) {
    phoneMap[(i + 1).toString()] = phoneNumbers[i];
  }

  // Encode the phoneMap into a JSON string.
  final String innerJsonString = jsonEncode(phoneMap);

  // Create the outer map with the "lab_phone" key.
  final Map<String, String> outerMap = {
    "lab_phone": innerJsonString,
  };

  // Encode the outer map into the final JSON string.
  return jsonEncode(outerMap);
}
