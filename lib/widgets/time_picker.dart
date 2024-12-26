import 'package:flutter/material.dart';
import 'package:ngoding_cuy/provider/scheduled_provider.dart';
import 'package:provider/provider.dart';

import '../provider/datetime_provider.dart';

class MyTimePicker extends StatefulWidget {
  const MyTimePicker({super.key});

  @override
  State<MyTimePicker> createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeProvider>(builder: (context, provider, child) {
      return ListTile(
          title: const Text('Notifikasi'),
          trailing:
              Consumer<SchedulingProvider>(builder: (context, schedule, _) {
            return Switch.adaptive(
                value: schedule.isScheduled,
                onChanged: (value) async {
                  TimeOfDay selectedTime = TimeOfDay.now();
                  final TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    helpText: "Kapan Pengingat belajar muncul",
                    initialEntryMode: TimePickerEntryMode.input,
                  );
                  print("Klik Timer pick");
                  provider.setSelectedTime(pickedTime!);
                  schedule.scheduledNews(value, provider.selectedTime!);
                });
          }));
    });
  }
}
