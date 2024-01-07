import 'package:av_settings/data/data_sources/custom_interface/custom_interface_contract.dart';
import 'package:hive/hive.dart';

class CustomInterfaceLocalDataSource implements CustomInterfaceContract {
  @override
  Future<bool> isCustomInterfaceSelected() async {
    try {
      final box = await Hive.openBox('customInterfaceBox');
      final result = box.get('customInterface', defaultValue: false);

      return result;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<void> updateCustomInterfaceValue(bool value) async {
    try {
      final box = await Hive.openBox('customInterfaceBox');
      box.put('customInterface', value);
    } catch (e) {
      throw e;
    }
  }
}
