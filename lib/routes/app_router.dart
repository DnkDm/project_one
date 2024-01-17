import 'package:auto_route/auto_route.dart';
import 'package:project_one/MainPage.dart';

import '../auth/RegisterPage.dart';
import '../closeBody/head.dart';
import '../mainPages/MainLogInPage.dart';
import '../mainPages/threeMainPages/HomePage.dart';
import '../mainPages/threeMainPages/NewsPage.dart';
import '../mainPages/threeMainPages/PersonPage.dart';
import '../mainPages/threeMainPages/SupportPage.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    /// routes go here

    AutoRoute(page: MainRoute.page, initial: true, children: [
      AutoRoute(page: RegisterRoute.page),
      AutoRoute(page: HomeRoute.page,),
      AutoRoute(page: NewsRoute.page),
      AutoRoute(page: PersonRoute.page),
      AutoRoute(page: SupportRoute.page)
    ]),
    AutoRoute(page: HeadRoute.page),


  ];
}