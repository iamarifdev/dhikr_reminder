// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'features/dhikr/domain/entities/dhikr_definition.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 7837403286889798015),
      name: 'DhikrDefinitionEntity',
      lastPropertyId: const obx_int.IdUid(7, 5161230015852708454),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4885415537204801871),
            name: 'objectBoxId',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7660501994880844891),
            name: 'id',
            type: 9,
            flags: 2080,
            indexId: const obx_int.IdUid(1, 9014654759481701213)),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1050622584608071366),
            name: 'arabicTitle',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 4536480623105018370),
            name: 'title',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5705287401113277239),
            name: 'maxCount',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(6, 1795798516300165588),
            name: 'currentCount',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(7, 5161230015852708454),
            name: 'completedCount',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
Future<obx.Store> openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) async {
  await loadObjectBoxLibraryAndroidCompat();
  return obx.Store(getObjectBoxModel(),
      directory: directory ?? (await defaultStoreDirectory()).path,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(1, 7837403286889798015),
      lastIndexId: const obx_int.IdUid(1, 9014654759481701213),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    DhikrDefinitionEntity: obx_int.EntityDefinition<DhikrDefinitionEntity>(
        model: _entities[0],
        toOneRelations: (DhikrDefinitionEntity object) => [],
        toManyRelations: (DhikrDefinitionEntity object) => {},
        getId: (DhikrDefinitionEntity object) => object.objectBoxId,
        setId: (DhikrDefinitionEntity object, int id) {
          object.objectBoxId = id;
        },
        objectToFB: (DhikrDefinitionEntity object, fb.Builder fbb) {
          final idOffset = fbb.writeString(object.id);
          final arabicTitleOffset = fbb.writeString(object.arabicTitle);
          final titleOffset = fbb.writeString(object.title);
          fbb.startTable(8);
          fbb.addInt64(0, object.objectBoxId ?? 0);
          fbb.addOffset(1, idOffset);
          fbb.addOffset(2, arabicTitleOffset);
          fbb.addOffset(3, titleOffset);
          fbb.addInt64(4, object.maxCount);
          fbb.addInt64(5, object.currentCount);
          fbb.addInt64(6, object.completedCount);
          fbb.finish(fbb.endTable());
          return object.objectBoxId ?? 0;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final objectBoxIdParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 4);
          final idParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final arabicTitleParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, '');
          final titleParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final maxCountParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0);
          final currentCountParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 14, 0);
          final completedCountParam =
              const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 16);
          final object = DhikrDefinitionEntity(
              objectBoxId: objectBoxIdParam,
              id: idParam,
              arabicTitle: arabicTitleParam,
              title: titleParam,
              maxCount: maxCountParam,
              currentCount: currentCountParam,
              completedCount: completedCountParam);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [DhikrDefinitionEntity] entity fields to define ObjectBox queries.
class DhikrDefinitionEntity_ {
  /// See [DhikrDefinitionEntity.objectBoxId].
  static final objectBoxId = obx.QueryIntegerProperty<DhikrDefinitionEntity>(
      _entities[0].properties[0]);

  /// See [DhikrDefinitionEntity.id].
  static final id = obx.QueryStringProperty<DhikrDefinitionEntity>(
      _entities[0].properties[1]);

  /// See [DhikrDefinitionEntity.arabicTitle].
  static final arabicTitle = obx.QueryStringProperty<DhikrDefinitionEntity>(
      _entities[0].properties[2]);

  /// See [DhikrDefinitionEntity.title].
  static final title = obx.QueryStringProperty<DhikrDefinitionEntity>(
      _entities[0].properties[3]);

  /// See [DhikrDefinitionEntity.maxCount].
  static final maxCount = obx.QueryIntegerProperty<DhikrDefinitionEntity>(
      _entities[0].properties[4]);

  /// See [DhikrDefinitionEntity.currentCount].
  static final currentCount = obx.QueryIntegerProperty<DhikrDefinitionEntity>(
      _entities[0].properties[5]);

  /// See [DhikrDefinitionEntity.completedCount].
  static final completedCount = obx.QueryIntegerProperty<DhikrDefinitionEntity>(
      _entities[0].properties[6]);
}