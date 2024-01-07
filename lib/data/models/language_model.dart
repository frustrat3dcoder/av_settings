import 'package:av_settings/domain/entities/entities.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LanguageModel extends Language with EquatableMixin {
  final String name;
  final bool? isSelected;
  final String? alternateName;

  LanguageModel({
    required this.name,
    this.isSelected = false,
    this.alternateName = '',
  }) : super(
          name: name,
          alternateName: alternateName,
          isSelected: isSelected,
        );
}
