import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_support/src/modules/auth/auth_module.dart';
import 'package:e_support/src/modules/step/step_module.dart';
import 'package:e_support/src/modules/home/home_module.dart';
import 'package:e_support/src/modules/splash/splash_module.dart';
import 'package:e_support/src/modules/loading/loading_module.dart';
import 'package:e_support/src/modules/auth/signin/signin_auth.dart';
import 'package:e_support/src/modules/auth/signup/signup_auth.dart';
import 'package:e_support/src/modules/auth/recover/recover_auth.dart';
import 'package:e_support/src/modules/logout/loading_logout_module.dart';
import 'package:e_support/src/modules/auth/recover/confirm_password.dart';
import 'package:e_support/src/modules/loading_register/check_register.dart';
import 'package:e_support/src/modules/loading_register/loading_register_module.dart';
import 'package:e_support/src/modules/loading_sign_in_google/loading_sign_in_google_module.dart';

import '../../models/user/user_sign_in.dart';
import '../../models/user/user_sign_up.dart';
import '../../modules/home/profile_user.dart';
import '../../modules/home/notifications_tickets.dart';
import '../../modules/auth/recover/check_email_reset_password.dart';

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
        path: "/auth_module/recover", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const RecoverAuth(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: "/auth_module/checkemail", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const CheckEmailResetPassword(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        },
      ),
      GoRoute(
        path: "/auth_module/confirmpassword", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ConfirmPassword(), 
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
        path: "/home_module/notifications_tickets", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const NotificationsTickets(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/home_module/profile_user", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const ProfileUser(), 
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
      GoRoute(
        path: "/loading_logout_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoadingLogoutModule(), 
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          );
        }
      ),
      GoRoute(
        path: "/loading_sign_in_google_module", 
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const LoadingSignInGoogleModule(), 
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