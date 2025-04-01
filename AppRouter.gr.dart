// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'AppRouter.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AboutRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AboutPage(),
      );
    },
    BikeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BikePage(),
      );
    },
    CarRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CarPage(),
      );
    },
    CycleRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CyclePage(),
      );
    },
    DashBoardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashBoardPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const Homepage(),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingPage(),
      );
    },
  };
}

/// generated route for
/// [AboutPage]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BikePage]
class BikeRoute extends PageRouteInfo<void> {
  const BikeRoute({List<PageRouteInfo>? children})
    : super(BikeRoute.name, initialChildren: children);

  static const String name = 'BikeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CarPage]
class CarRoute extends PageRouteInfo<void> {
  const CarRoute({List<PageRouteInfo>? children})
    : super(CarRoute.name, initialChildren: children);

  static const String name = 'CarRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CyclePage]
class CycleRoute extends PageRouteInfo<void> {
  const CycleRoute({List<PageRouteInfo>? children})
    : super(CycleRoute.name, initialChildren: children);

  static const String name = 'CycleRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DashBoardPage]
class DashBoardRoute extends PageRouteInfo<void> {
  const DashBoardRoute({List<PageRouteInfo>? children})
    : super(DashBoardRoute.name, initialChildren: children);

  static const String name = 'DashBoardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [Homepage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'Homepage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingPage]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
