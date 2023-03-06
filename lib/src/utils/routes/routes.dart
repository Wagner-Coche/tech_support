import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:e_support/src/modules/auth/auth_module.dart';
import 'package:e_support/src/modules/step/step_module.dart';
import 'package:e_support/src/modules/home/home_module.dart';
import 'package:e_support/src/modules/splash/splash_module.dart';
import 'package:e_support/src/modules/loading/loading_module.dart';
import 'package:e_support/src/modules/auth/signin/signin_auth.dart';
import 'package:e_support/src/modules/auth/signup/signup_auth.dart';
import 'package:e_support/src/modules/loading_register/check_register.dart';
import 'package:e_support/src/modules/loading_register/loading_register_module.dart';

import '../../models/user/user_sign_in.dart';
import '../../models/user/user_sign_up.dart';

class Routes {
  static GoRouter get routes => GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: "/", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SplashModule(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/auth_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const AuthModule(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: "/auth_module/signin", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignInAuth(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: "/auth_module/signup", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const SignUpAuth(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: "/step_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const StepModule(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/loading_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoadingModule(userSignIn: state.extra as UserSignIn), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/loading_register_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoadingRegisterModule(userSignUp: state.extra as UserSignUp), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/home_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomeModule(user: state.extra as User?), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/check_register", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CheckRegister(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
    ], 
  );
}
