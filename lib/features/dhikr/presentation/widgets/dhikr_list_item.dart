import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:flutter/material.dart';

class DhikrListItem extends StatelessWidget {
  final DhikrDefinitionEntity dhikr;
  final VoidCallback onNavigate;

  const DhikrListItem({
    super.key,
    required this.dhikr,
    required this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      child: Card(
        color: Colors.green.shade100,
        child: ListTile(
          onTap: onNavigate,
          title: Text(dhikr.arabicText, style: textTheme.titleLarge),
          subtitle: Text(
            dhikr.bdTitle,
            style: textTheme.bodyLarge,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (dhikr.completedCount! > 0) ...[
                Chip(
                  backgroundColor: Colors.green,
                  label: Text(
                    '${dhikr.completedCount}',
                    style: textTheme.bodySmall,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              Text(
                '${dhikr.currentCount}/${dhikr.maxCount}',
                style: textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
