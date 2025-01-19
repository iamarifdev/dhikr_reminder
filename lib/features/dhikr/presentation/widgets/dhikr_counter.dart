import 'package:dhikr_reminder/features/dhikr/presentation/widgets/progress_border_painter.dart';
import 'package:flutter/material.dart';

class DhikrCounterWidget extends StatefulWidget {
  final int maxCount;
  final int currentCount;
  final int? completedCount;

  const DhikrCounterWidget({
    super.key,
    required this.maxCount,
    required this.currentCount,
    this.completedCount = 0,
  });

  @override
  State<DhikrCounterWidget> createState() => _DhikrCounterWidgetState();
}

class _DhikrCounterWidgetState extends State<DhikrCounterWidget> {
  int _counter = 0;
  int _completedCount = 0;

  @override
  void initState() {
    _counter = widget.currentCount;
    _completedCount = widget.completedCount!;

    super.initState();
  }

  double get percentage => _counter / widget.maxCount;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width * 0.75;
    return InkWell(
      borderRadius: BorderRadius.circular(deviceWidth),
      onTap: () {
        setState(() {
          if (_counter >= widget.maxCount) {
            _counter = 0;
            _completedCount++;
          } else {
            _counter++;
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
            '$_counter/${widget.maxCount}',
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
