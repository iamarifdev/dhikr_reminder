import 'package:objectbox/objectbox.dart';

@Entity()
class DhikrDefinitionEntity {
  @Id()
  int? objectBoxId;

  @Unique()
  final String id;

  final String arabicText;
  final String enTitle;
  final String bdTitle;
  final String bdPronunciation;
  final String bdTranslation;
  final String enPronunciation;
  final String enTranslation;
  final String reference;
  final int maxCount;
  int currentCount;
  int? completedCount;

  DhikrDefinitionEntity({
    this.objectBoxId,
    required this.id,
    required this.arabicText,
    required this.enTitle,
    required this.bdTitle,
    required this.bdPronunciation,
    required this.bdTranslation,
    required this.enPronunciation,
    required this.enTranslation,
    required this.reference,
    required this.maxCount,
    required this.currentCount,
    this.completedCount = 0,
  });

  factory DhikrDefinitionEntity.fromJson(Map<String, dynamic> json) {
    return DhikrDefinitionEntity(
      id: json['id'],
      enTitle: json['enTitle'],
      bdTitle: json['bdTitle'],
      arabicText: json['arabicText'],
      bdPronunciation: json['bdPronunciation'],
      bdTranslation: json['bdTranslation'],
      enPronunciation: json['enPronunciation'],
      enTranslation: json['enTranslation'],
      reference: json['reference'],
      maxCount: json['maxCount'],
      currentCount: json['currentCount'],
      completedCount: json['completedCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'arabicText': arabicText,
      'enTitle': enTitle,
      'bdTitle': bdTitle,
      'bdPronunciation': bdPronunciation,
      'bdTranslation': bdTranslation,
      'enPronunciation': enPronunciation,
      'enTranslation': enTranslation,
      'reference': reference,
      'maxCount': maxCount,
      'currentCount': currentCount,
      'completedCount': completedCount,
    };
  }
}
