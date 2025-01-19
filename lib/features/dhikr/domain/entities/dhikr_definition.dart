import 'package:objectbox/objectbox.dart';

@Entity()
class DhikrDefinitionEntity {
  @Id()
  int? objectBoxId;

  @Unique()
  final String id;

  final String arabicTitle;
  final String title;
  final int maxCount;
  int currentCount;
  int? completedCount;

  DhikrDefinitionEntity({
    this.objectBoxId,
    required this.id,
    required this.arabicTitle,
    required this.title,
    required this.maxCount,
    required this.currentCount,
    this.completedCount = 0,
  });

  factory DhikrDefinitionEntity.fromJson(Map<String, dynamic> json) {
    return DhikrDefinitionEntity(
      id: json['id'],
      arabicTitle: json['headline'],
      title: json['supportingText'],
      maxCount: json['actionText'],
      currentCount: json['currentCount'],
      completedCount: json['completedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicTitle': arabicTitle,
      'title': title,
      'maxCount': maxCount,
      'currentCount': currentCount,
      'completedCount': completedCount,
    };
  }
}
