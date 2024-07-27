import 'package:go_router/go_router.dart';
import 'package:video_streaming_ui/pages/account/main.dart';
import 'package:video_streaming_ui/pages/dashboard/main.dart';
import 'package:video_streaming_ui/pages/library/main.dart';
import 'package:video_streaming_ui/pages/login-page/main.dart';
import 'package:video_streaming_ui/pages/signup-page/choose_avatar.dart';
import 'package:video_streaming_ui/pages/signup-page/main.dart';
import 'package:video_streaming_ui/pages/signup-page/select_intrerests.dart';
import 'package:video_streaming_ui/pages/signup-page/select_username_and_dob.dart';

class CustomRouter {
  // public routes
  static const String home = '/';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';

  // private routes
  static const String dashboard = '/dashboard';
  static const String explore = '/explore';
  static const String library = '/library';
  static const String account = '/account';
  static const String chooseAvatar = 'choose-avatar';
  static const String chooseUsernameAndDOB = 'choose-username-dob';
  static const String selectInterests = 'select-interests';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        name: home,
        path: home,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: signup,
        path: signup,
        builder: (context, state) => const SignupPage(),
        routes: [
          GoRoute(
            name: chooseAvatar,
            path: chooseAvatar,
            builder: (context, state) {
              return const ChooseAvatar();
            },
          ),
          GoRoute(
            path: chooseUsernameAndDOB,
            name: chooseUsernameAndDOB,
            builder: (context, state) {
              return const SelectUsernameAndDob();
            },
          ),
          GoRoute(
            name: selectInterests,
            path: selectInterests,
            builder: (context, state) {
              return const SelectInterests();
            },
          ),
        ],
      ),
      GoRoute(
        name: login,
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: dashboard,
        path: dashboard,
        builder: (context, state) => const Dashboard(),
      ),
      GoRoute(
        name: account,
        path: account,
        builder: (context, state) => const Account(),
      ),
      GoRoute(
        path: library,
        name: library,
        builder: (context, state) {
          return const Library();
        },
      ),
    ],
  );
}
