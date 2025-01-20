import 'package:dhikr_reminder/core/store/objectbox.dart';
import 'package:dhikr_reminder/features/dhikr/domain/entities/dhikr_definition.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

final List<DhikrDefinitionEntity> defaulttDhikrs = [
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'سُبْحَانَ اللَّهِ',
    enTitle: 'Tasbih - SubhanAllah',
    bdTitle: 'তাসবীহ - সুবহানআল্লাহ',
    bdPronunciation: 'সুবহানআল্লাহ',
    bdTranslation: 'আল্লাহ পবিত্র।',
    enPronunciation: 'SubhanAllah',
    enTranslation: 'Allah is free from imperfections.',
    reference: '[Sahih Muslim 2691]',
    maxCount: 33,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'الْحَمْدُ لِلَّهِ',
    enTitle: 'Tahmid - Alhamdulillah',
    bdTitle: 'তাহমীদ - আলহামদুলিল্লাহ',
    bdPronunciation: 'আলহামদুলিল্লাহ',
    bdTranslation: 'সকল প্রশংসা আল্লাহর জন্য।',
    enPronunciation: 'Alhamdulillah',
    enTranslation: 'All praise is for Allah.',
    reference: '[Sahih Muslim 2691]',
    maxCount: 33,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'اللَّهُ أَكْبَرُ',
    enTitle: 'Takbir of Allahu Akbar',
    bdTitle: 'তাকবীর - আল্লাহু আকবার',
    bdPronunciation: 'আল্লাহু আকবার',
    bdTranslation: 'আল্লাহ মহান।',
    enPronunciation: 'Allahu Akbar',
    enTranslation: 'Allah is the Greatest.',
    reference: '[Sahih Muslim 2691]',
    maxCount: 33,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'لَا إِلَهَ إِلَّا اللَّهُ',
    enTitle: 'Tahleel - La ilaha illallah',
    bdTitle: 'তাহলীল - লা ইলাহা ইল্লাল্লাহ',
    bdPronunciation: 'লা ইলাহা ইল্লাল্লাহ',
    bdTranslation: 'আল্লাহ ছাড়া আর কোনো ইলাহ নেই।',
    enPronunciation: 'La ilaha illallah',
    enTranslation: 'There is no deity but Allah.',
    reference: '[Sunan Tirmidhi 3468]',
    maxCount: 100,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'أَسْتَغْفِرُ اللَّهَ',
    enTitle: 'Seeking Forgiveness (Istighfar)',
    bdTitle: 'ক্ষমা প্রার্থনা (ইস্তেগফার)',
    bdPronunciation: 'আসতাগফিরুল্লাহ',
    bdTranslation: 'আমি আল্লাহর কাছে ক্ষমা চাই।',
    enPronunciation: 'Astaghfirullah',
    enTranslation: 'I seek forgiveness from Allah.',
    reference: '[Sahih al-Bukhari 6307]',
    maxCount: 100,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'اللَّهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ',
    enTitle: 'Sending Salawat on the Prophet ﷺ ' '- 1',
    bdTitle: 'নবী ﷺ প্রতি দরুদ পাঠ করা - ১',
    bdPronunciation: 'আল্লাহুম্মা সাল্লি আলা মুহাম্মাদ',
    bdTranslation: 'হে আল্লাহ, মুহাম্মদ ﷺ এর প্রতি দয়া বর্ষণ করুন।',
    enPronunciation: 'Allahumma salli ala Muhammad',
    enTranslation: 'O Allah, send blessings upon Muhammad.',
    reference: '[Sahih al-Bukhari 3370]',
    maxCount: 100,
    currentCount: 0,
  ),
  DhikrDefinitionEntity(
    id: const Uuid().v4(),
    arabicText: 'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَىٰ نَبِيِّنَا مُحَمَّدٍ',
    enTitle: 'Sending Salawat on the Prophet ﷺ' '- 2',
    bdTitle: 'নবী ﷺ প্রতি দরুদ পাঠ করা - ২',
    bdPronunciation:
        "আল্লাহুম্মা সল্লি ওয়া সাল্লিম 'আলা নাবিয়্যিনা মুহাম্মাদ",
    bdTranslation:
        'হে আল্লাহ, আমাদের নবী মুহাম্মাদ ﷺ এর প্রতি দয়া এবং শান্তি বর্ষণ করুন।',
    enPronunciation: "Allahumma Salli Wa Sallim 'Ala Nabiyyina Muhammad",
    enTranslation:
        'O Allah, send blessings and peace upon our Prophet Muhammad.',
    reference: "[Sunan an-Nasa'i 1292]",
    maxCount: 100,
    currentCount: 0,
  )
];

Future<void> seedData() async {
  final objectbox = GetIt.I<ObjectBox>();
  final count = objectbox.dhikrs.count();

  if (count > 0) return;

  await objectbox.dhikrs.putManyAsync(defaulttDhikrs);
}

Future<void> cleanupApp() async {
  final objectbox = GetIt.I<ObjectBox>();
  await objectbox.dhikrs.removeAllAsync();
}
