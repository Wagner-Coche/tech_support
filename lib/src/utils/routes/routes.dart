import 'package:go_router/go_router.dart';
import 'package:e_support/src/modules/main/main_module.dart';
import 'package:e_support/src/modules/auth/auth_module.dart';
import 'package:e_support/src/modules/splash/splash_module.dart';

class Routes {
  static GoRouter get routes => GoRouter(
    routes: <RouteBase>[
      GoRoute(path: "/", builder: (context, state) => const SplashModule()),
      GoRoute(path: "/auth_module", builder: (context, state) => const AuthModule()),
      GoRoute(path: "/main_module", builder: (context, state) => const MainModule())
    ], 
  );
}
