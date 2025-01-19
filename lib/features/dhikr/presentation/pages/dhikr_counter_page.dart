import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/widgets/dhikr_counter.dart';
import 'package:flutter/material.dart';

class DhikrCounterPage extends StatefulWidget {
  final DhikrDefinitionEntity dhikr;

  const DhikrCounterPage({super.key, required this.dhikr});

  @override
  State<DhikrCounterPage> createState() => _DhikrCounterPageState();
}

class _DhikrCounterPageState extends State<DhikrCounterPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dhikr.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dhikr.arabicTitle, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(widget.dhikr.title, style: textTheme.titleMedium),
            const Spacer(),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 50),
                child: DhikrCounterWidget(
                  maxCount: widget.dhikr.maxCount,
                  currentCount: widget.dhikr.currentCount,
                  completedCount: widget.dhikr.completedCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
