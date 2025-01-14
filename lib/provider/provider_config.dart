import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'course_activity.dart';
import 'set_selected_time.dart';
import 'scheduling_background_task.dart';
import 'user_data.dart';

void mainProvider(main) async {
  WidgetsFlutterBinding.ensureInitialized();
  Userdata user = Userdata();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TimeProvider()),
      ChangeNotifierProvider(create: (_) => SchedulingProvider()),
      ChangeNotifierProvider(create: (_) => CourseAppActifity()),
      ChangeNotifierProvider(create: (_) => user),
    ],
    child: main,
  ));
}
