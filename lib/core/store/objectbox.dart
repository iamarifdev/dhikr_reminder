import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:dhikr_reminder/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: p.join(docsDir.path, "dhikr_reminder"),
    );
    return ObjectBox._create(store);
  }

  Box<DhikrDefinitionEntity> get dhikrs => store.box<DhikrDefinitionEntity>();
}
