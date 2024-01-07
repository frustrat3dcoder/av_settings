import 'package:av_settings/domain/entities/entities.dart';

abstract class LanguageSourceContract {
  Future<List<Language>> getLanguages();
  Future<void> updateLanguage(List<Language> languageModel);
}
