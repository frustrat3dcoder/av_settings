import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  Widget get w {
    return SizedBox(width: toDouble());
  }

  Widget get h {
    return SizedBox(height: toDouble());
  }
}
