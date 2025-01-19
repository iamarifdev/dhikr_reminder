import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/widgets/dhikr_list_item.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DhikrListPage extends StatefulWidget {
  const DhikrListPage({super.key});

  @override
  State<DhikrListPage> createState() => _DhikrListPageState();
}

class _DhikrListPageState extends State<DhikrListPage> {
  List<DhikrDefinitionEntity> dhikrs = [
    DhikrDefinitionEntity(
      id: const Uuid().v4(),
      title: 'Astaghfirullah',
      arabicTitle: 'أَسْتَغْفِرُ اللّٰهَ',
      maxCount: 100,
      currentCount: 70,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(4),
        child: ListView(
          children: dhikrs.map((dhikr) {
            return DhikrListItem(dhikr: dhikr);
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add new dhikr',
        child: const Icon(Icons.add),
      ),
    );
  }
}
