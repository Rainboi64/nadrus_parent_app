// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Children.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChildrenScreen(),
      );
    },
    DetectTenant.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DetectTenantScreen(),
      );
    },
    Home.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    Initial.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InitialScreen(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          username: args.username,
        ),
      );
    },
    Main.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
    TeachersFeedback.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TeachersFeedbackScreen(),
      );
    },
  };
}

/// generated route for
/// [ChildrenScreen]
class Children extends PageRouteInfo<void> {
  const Children({List<PageRouteInfo>? children})
      : super(
          Children.name,
          initialChildren: children,
        );

  static const String name = 'Children';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DetectTenantScreen]
class DetectTenant extends PageRouteInfo<void> {
  const DetectTenant({List<PageRouteInfo>? children})
      : super(
          DetectTenant.name,
          initialChildren: children,
        );

  static const String name = 'DetectTenant';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InitialScreen]
class Initial extends PageRouteInfo<void> {
  const Initial({List<PageRouteInfo>? children})
      : super(
          Initial.name,
          initialChildren: children,
        );

  static const String name = 'Initial';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class Login extends PageRouteInfo<LoginArgs> {
  Login({
    Key? key,
    required String username,
    List<PageRouteInfo>? children,
  }) : super(
          Login.name,
          args: LoginArgs(
            key: key,
            username: username,
          ),
          initialChildren: children,
        );

  static const String name = 'Login';

  static const PageInfo<LoginArgs> page = PageInfo<LoginArgs>(name);
}

class LoginArgs {
  const LoginArgs({
    this.key,
    required this.username,
  });

  final Key? key;

  final String username;

  @override
  String toString() {
    return 'LoginArgs{key: $key, username: $username}';
  }
}

/// generated route for
/// [MainScreen]
class Main extends PageRouteInfo<void> {
  const Main({List<PageRouteInfo>? children})
      : super(
          Main.name,
          initialChildren: children,
        );

  static const String name = 'Main';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TeachersFeedbackScreen]
class TeachersFeedback extends PageRouteInfo<void> {
  const TeachersFeedback({List<PageRouteInfo>? children})
      : super(
          TeachersFeedback.name,
          initialChildren: children,
        );

  static const String name = 'TeachersFeedback';

  static const PageInfo<void> page = PageInfo<void>(name);
}
