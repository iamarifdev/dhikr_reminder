import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/pages/dhikr_counter_page.dart';
import 'package:flutter/material.dart';

class DhikrListItem extends StatelessWidget {
  final DhikrDefinitionEntity dhikr;

  const DhikrListItem({
    super.key,
    required this.dhikr,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Card(
        color: Colors.green.shade100,
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DhikrCounterPage(dhikr: dhikr),
              ),
            );
          },
          title: Text(dhikr.arabicText, style: textTheme.titleMedium),
          subtitle: Text(
            dhikr.enTitle,
            style: textTheme.bodyLarge,
          ),
          trailing: Text(
            '${dhikr.currentCount}/${dhikr.maxCount}',
            style: textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
