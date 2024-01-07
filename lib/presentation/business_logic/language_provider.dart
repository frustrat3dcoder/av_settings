import 'package:av_settings/di.dart';
import 'package:av_settings/domain/domain.dart';
import 'package:av_settings/domain/entities/entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final languageProvider = FutureProvider<List<Language>>(
final languageProvider =
    StateNotifierProvider<LanguageNotifier, List<Language>>(
  (ref) => LanguageNotifier(),
);

class LanguageNotifier extends StateNotifier<List<Language>> {
  final languageUseCase = sl<LanguageUseCase>();

  LanguageNotifier() : super([]) {
    getLanguageList();
  }

  void getLanguageList() async {
    final result = await languageUseCase.getLanguages();

    state = result;
  }

  void toggle(Language language) async {
    final updatedList = [
      for (final data in state)
        if (data.name == language.name)
          Language(
            name: data.name,
            alternateName: data.alternateName,
            isSelected: !(data.isSelected!), // Toggle the isSelected property
          )
        else
          data,
    ];

    state = updatedList;
    languageUseCase.updateLanguageSelection(updatedList);
  }
}
