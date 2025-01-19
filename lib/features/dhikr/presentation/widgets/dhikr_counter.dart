import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/widgets/progress_border_painter.dart';
import 'package:flutter/material.dart';

class DhikrCounterWidget extends StatefulWidget {
  final DhikrDefinitionEntity dhikr;
  final Function(int completedCount) onCompleteDhikr;
  final Function(int currentCount) onCountDown;

  const DhikrCounterWidget({
    super.key,
    required this.dhikr,
    required this.onCompleteDhikr,
    required this.onCountDown,
  });

  @override
  State<DhikrCounterWidget> createState() => _DhikrCounterWidgetState();
}

class _DhikrCounterWidgetState extends State<DhikrCounterWidget> {
  int _counter = 0;
  int _completedCount = 0;

  @override
  void initState() {
    _counter = widget.dhikr.currentCount;
    _completedCount = widget.dhikr.completedCount ?? 0;

    super.initState();
  }

  double get percentage => _counter / widget.dhikr.maxCount;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width * 0.75;
    return InkWell(
      borderRadius: BorderRadius.circular(deviceWidth),
      onTap: () {
        setState(() {
          if (_counter >= widget.dhikr.maxCount) {
            _counter = 0;
            _completedCount++;
            widget.onCompleteDhikr(_completedCount);
          } else {
            _counter++;
            widget.onCountDown(_counter);
          }
        });
      },
      child: CustomPaint(
        painter: ProgressBorderPainter(percentage: percentage),
        child: Container(
          height: deviceWidth,
          width: deviceWidth,
          alignment: Alignment.center,
          child: Text(
            '$_counter / ${widget.dhikr.maxCount}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
