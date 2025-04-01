import 'package:auto_route/auto_route.dart';
import 'package:riverpodbasic/presentation/home_page.dart';
import 'package:riverpodbasic/router/HomePage.dart';
import 'package:riverpodbasic/router/bike.dart';
import 'package:riverpodbasic/router/cycle.dart';

import 'About_page.dart';
import 'Setting_page.dart';
import 'car.dart';
import 'dashBoard_page.dart';



part 'AppRouter.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page,initial: true,
    children:[
      AutoRoute(page: CarRoute.page),
      AutoRoute(page: CycleRoute.page),
      AutoRoute(page: BikeRoute.page),
      AutoRoute(page: DashBoardRoute.page),
      AutoRoute(page: SettingRoute.page,path: 'setting'),
      AutoRoute(page: AboutRoute.page,path: 'about'),
    ]),
  ];
}