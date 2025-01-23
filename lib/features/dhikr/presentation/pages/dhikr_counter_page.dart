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
    widget.dhikr.currentCount = 1;
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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.dhikr.arabicText,
                style: textTheme.headlineLarge,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 16),
            Text(
              'উচ্চারণ: ${widget.dhikr.bdPronunciation}',
              style: textTheme.titleMedium,
            ),
            Text(
              'অর্থ: ${widget.dhikr.bdTranslation}',
              style: textTheme.titleMedium,
            ),
            const Divider(height: 16),
            Text(
              'Pronounciation: ${widget.dhikr.enPronunciation}',
              style: textTheme.titleMedium,
            ),
            Text(
              'Meaning: ${widget.dhikr.enTranslation}',
              style: textTheme.titleMedium,
            ),
            const Divider(height: 16),
            Text(
              widget.dhikr.reference,
              style: textTheme.titleSmall,
            ),
            const Spacer(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
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
