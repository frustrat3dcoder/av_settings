// lib/domain/repositories/language_repository.dart
import 'package:av_settings/domain/entities/language_entity.dart';

abstract class LanguageRepository {
  Future<List<Language>> getLanguages();
  Future<void> updateLanguageSelection(List<Language> language);
}
