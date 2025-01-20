import 'package:dhikr_reminder/core/store/objectbox.dart';
import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/widgets/dhikr_counter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DhikrCounterPage extends StatefulWidget {
  final DhikrDefinitionEntity dhikr;

  const DhikrCounterPage({super.key, required this.dhikr});

  @override
  State<DhikrCounterPage> createState() => _DhikrCounterPageState();
}

class _DhikrCounterPageState extends State<DhikrCounterPage> {
  final objectBox = GetIt.I<ObjectBox>();

  void _countDown(int currentCount) {
    widget.dhikr.currentCount = currentCount;
    objectBox.dhikrs.putQueued(widget.dhikr);
  }

  void _completeDhikr(int completedCount) async {
    widget.dhikr.completedCount = completedCount;
    await objectBox.dhikrs.putAsync(widget.dhikr);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.dhikr.enTitle),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.dhikr.arabicText, style: textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(widget.dhikr.enTitle, style: textTheme.titleMedium),
            const Spacer(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: DhikrCounterWidget(
                  dhikr: widget.dhikr,
                  onCompleteDhikr: _completeDhikr,
                  onCountDown: _countDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
