import 'package:av_settings/di.dart';
import 'package:av_settings/domain/domain.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final customInterfaceProvider =
    StateNotifierProvider<CustomInterfaceProvider, bool>(
  (ref) => CustomInterfaceProvider(),
);

class CustomInterfaceProvider extends StateNotifier<bool> {
  final customInterfaceUseCase = sl<CustomInterfaceUsecase>();

  CustomInterfaceProvider() : super(false) {
    getCustomInterfaceValue();
  }

  void getCustomInterfaceValue() async {
    final result = await customInterfaceUseCase.isCustomUserfaceSelected();

    state = result;
  }

  void toggle(bool value) {
    customInterfaceUseCase.updateCustomInterfaceValue(value);

    state = value;
  }
}
