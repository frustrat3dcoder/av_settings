import 'package:av_settings/domain/domain.dart';

class CustomInterfaceUsecase {
  final CustomInterfaceRepo customInterfaceRepo;
  CustomInterfaceUsecase({required this.customInterfaceRepo});

  Future<bool> isCustomUserfaceSelected() async {
    final result = await customInterfaceRepo.isCustomInterfaceSelected();
    return result;
  }

  Future<void> updateCustomInterfaceValue(bool value) async {
    await customInterfaceRepo.updateCustomInterfaceValue(value);
  }
}
