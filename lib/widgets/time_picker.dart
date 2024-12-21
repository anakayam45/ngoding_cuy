import 'package:flutter/material.dart';

Future<TimeOfDay?> pickTime(BuildContext context) async {
  TimeOfDay? selectedTime;
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: selectedTime ?? TimeOfDay.now(),
    helpText: "Kapan Pengingat belajar muncul",
    initialEntryMode: TimePickerEntryMode.input,
  );
  if (pickedTime != null && pickedTime != selectedTime) {
  }
  return pickedTime;
}
