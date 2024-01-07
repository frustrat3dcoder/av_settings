import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Language extends Equatable {
  final String name;
  final String? alternateName;
  bool? isSelected;

  Language({
    required this.name,
    this.isSelected = false,
    this.alternateName = '',
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
        name: json['name'],
        alternateName: json['alternateName'],
        isSelected: json['isSelected']);
  }

  toJson() {
    return {
      'name': name,
      'alternateName': alternateName,
      'isSelected': isSelected
    };
  }

  @override
  List<Object?> get props => [name, alternateName, isSelected];
}
