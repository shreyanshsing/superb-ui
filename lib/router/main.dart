import 'package:flutter/material.dart';
import 'package:video_streaming_ui/pages/account/main.dart';
import 'package:video_streaming_ui/pages/dashboard/main.dart';
import 'package:video_streaming_ui/pages/explore/main.dart';
import 'package:video_streaming_ui/pages/homepage/main.dart';
import 'package:video_streaming_ui/pages/library/main.dart';
import 'package:video_streaming_ui/pages/login-page/main.dart';
import 'package:video_streaming_ui/pages/signup-page/main.dart';

class CustomRouter {
  static const String home = '/';
  static const String signupLandingPage = '/signup-landing-page';
  static const String loginLandingPage = '/login-landing-page';

  // private routes
  static const String dashboard = '/dashboard';
  static const String explore = '/explore';
  static const String library = '/library';
  static const String account = '/account';

  static Route _createRoute(page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 10),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _createRoute(const Homepage());
      case loginLandingPage:
        return _createRoute(const LoginPage());
      case signupLandingPage:
        return _createRoute(const SignupPage());
      case dashboard:
        return _createRoute(const Dashboard());
      case explore:
        return _createRoute(const Explore());
      case library:
        return _createRoute(const Library());
      case account:
        return _createRoute(const Account());
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
