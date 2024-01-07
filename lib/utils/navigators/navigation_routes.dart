import 'package:av_settings/presentation/screens.dart';
import 'package:flutter/material.dart';

import 'route_names.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.av_settings:
        return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SettingsScreen());

      default:
        throw Error();
    }
  }
}
