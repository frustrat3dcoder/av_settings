import 'dart:convert';

import 'package:av_settings/data/data_sources/fake_data/fake_language_data.dart';
import 'package:av_settings/data/data_sources/language_data_source/language_source_contract.dart';
import 'package:av_settings/domain/entities/entities.dart';
import 'package:hive/hive.dart';

class LanguageLocalDataSource implements LanguageSourceContract {
  @override
  Future<List<Language>> getLanguages() async {
    final box = await Hive.openBox('languageBox');
    final result = box.get('language', defaultValue: defaultLanguageList);
    var languageJson = jsonDecode(result);
    List<Language> languageList = [];
    languageJson.forEach((element) {
      languageList.add(Language.fromJson(element as Map<String, dynamic>));
    });
    return languageList;
  }

  @override
  Future<void> updateLanguage(List<Language> languageModel) async {
    final box = await Hive.openBox('languageBox');
    final result = box.put('language', jsonEncode(languageModel));
    return result;
  }
}
