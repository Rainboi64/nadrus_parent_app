import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/screens/children/children_screen.dart';
import '../ui/screens/detect_tenant/detect_tenant_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/initial/initial_screen.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/main/main_screen.dart';
import '../ui/screens/teachers_feedback/teachers_feedback_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route,Screen')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/teachers_feedback', page: TeachersFeedback.page),
        AutoRoute(path: '/children', page: Children.page),
        AutoRoute(path: '/main', page: Main.page),
        AutoRoute(path: '/initial', page: Initial.page, initial: true),
        AutoRoute(path: '/login', page: Login.page),
        AutoRoute(path: '/home', page: Home.page),
        AutoRoute(path: '/detect_tenant', page: DetectTenant.page),
      ];
}

final appRouter = AppRouter();
