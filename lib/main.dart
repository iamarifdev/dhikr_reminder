import 'package:dhikr_reminder/core/di/dependency.dart';
import 'package:dhikr_reminder/core/themes/app_themes.dart';
import 'package:dhikr_reminder/core/themes/theme_provider.dart';
import 'package:dhikr_reminder/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DhikrReminderApp extends ConsumerWidget {
  const DhikrReminderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return MaterialApp(
      key: UniqueKey(),
      debugShowCheckedModeBanner: false,
      title: 'Dhikr Reminder',
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      home: const DashboardPage(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    const ProviderScope(
      child: DhikrReminderApp(),
    ),
  );
}
