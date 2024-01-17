import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_one/routes/app_router.dart';

@RoutePage()
class MainLogInPage extends StatelessWidget {
  const MainLogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(

      routes: [HomeRoute(), NewsRoute(), PersonRoute(), SupportRoute() ],
      transitionBuilder: (context, child, animation) => child,
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          extendBody: true,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              tabsRouter.setActiveIndex(value);
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.hiking_outlined), label: "Знаки тела", ),
              BottomNavigationBarItem(icon: Icon(Icons.back_hand_rounded), label: "Ангельские знаки", ),
              BottomNavigationBarItem(icon: Icon(Icons.hourglass_bottom), label: "Блог"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Поддержка")
            ],
          ),
        );
      },
    );
  }
}
