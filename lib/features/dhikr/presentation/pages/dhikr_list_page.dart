import 'package:dhikr_reminder/core/store/objectbox.dart';
import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/features/dhikr/presentation/widgets/dhikr_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DhikrListPage extends StatefulWidget {
  const DhikrListPage({super.key});

  @override
  State<DhikrListPage> createState() => _DhikrListPageState();
}

class _DhikrListPageState extends State<DhikrListPage> {
  final objectBox = GetIt.I<ObjectBox>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(4),
        child: FutureBuilder<List<DhikrDefinitionEntity>>(
            future: objectBox.dhikrs.getAllAsync(),
            initialData: const [],
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasData) {
                final dhikrs = snapshot.data ?? [];

                if (dhikrs.isEmpty) {
                  return const Center(child: Text('No dhikrs found'));
                }

                return ListView(
                  children: dhikrs.map((dhikr) {
                    return DhikrListItem(dhikr: dhikr);
                  }).toList(),
                );
              }

              return const Center(child: Text('No dhikrs found'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add new dhikr',
        child: const Icon(Icons.add),
      ),
    );
  }
}
