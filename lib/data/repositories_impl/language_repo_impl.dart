import 'package:av_settings/data/data.dart';
import 'package:av_settings/domain/domain.dart';
import 'package:av_settings/domain/entities/entities.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageSourceContract languageSourceContract;

  LanguageRepositoryImpl({required this.languageSourceContract});

  @override
  Future<List<Language>> getLanguages() async {
    try {
      final result = await languageSourceContract.getLanguages();
      return result;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> updateLanguageSelection(List<Language> language) async {
    try {
      await languageSourceContract.updateLanguage(language);
    } catch (e) {
      throw e;
    }
  }
}
