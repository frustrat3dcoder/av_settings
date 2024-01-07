import 'package:av_settings/data/data_sources/custom_interface/custom_interface_contract.dart';
import 'package:av_settings/domain/domain.dart';

class CustomInterfaceRepoImpl implements CustomInterfaceRepo {
  final CustomInterfaceContract customInterfaceContract;
  CustomInterfaceRepoImpl({required this.customInterfaceContract});
  @override
  Future<bool> isCustomInterfaceSelected() async {
    final result = await customInterfaceContract.isCustomInterfaceSelected();
    return result;
  }

  @override
  Future<void> updateCustomInterfaceValue(bool value) async {
    await customInterfaceContract.updateCustomInterfaceValue(value);
  }
}
