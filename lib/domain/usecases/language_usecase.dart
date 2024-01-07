import 'package:av_settings/domain/domain.dart';
import 'package:av_settings/domain/entities/entities.dart';

class LanguageUseCase {
  final LanguageRepository languageRepository;

  const LanguageUseCase({required this.languageRepository});

  Future<List<Language>> getLanguages() async {
    final result = await languageRepository.getLanguages();

    return result;
  }

  Future<void> updateLanguageSelection(List<Language> language) async {
    final result = await languageRepository.updateLanguageSelection(language);

    return result;
  }
}
