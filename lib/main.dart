import 'package:dhikr_reminder/core/di/dependency.dart';
import 'package:dhikr_reminder/core/store/objectbox.dart';
import 'package:dhikr_reminder/core/themes/app_themes.dart';
import 'package:dhikr_reminder/core/themes/theme_provider.dart';
import 'package:dhikr_reminder/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

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

Future<void> initializeApp() async {
  final objectbox = GetIt.I<ObjectBox>();
  final count = objectbox.dhikrs.count();

  if (count > 0) return;

  await objectbox.dhikrs.putAsync(
    DhikrDefinitionEntity(
      id: const Uuid().v4(),
      title: 'Astaghfirullah',
      arabicTitle: 'أَسْتَغْفِرُ اللّٰهَ',
      maxCount: 100,
      currentCount: 0,
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await initializeApp();

  runApp(
    const ProviderScope(
      child: DhikrReminderApp(),
    ),
  );
}
