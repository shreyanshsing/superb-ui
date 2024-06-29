import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:video_streaming_ui/config/config.dart';
import 'package:video_streaming_ui/pages/homepage/main.dart';
import 'package:video_streaming_ui/pages/signup-page/controller/signup_bloc.dart';
import 'package:video_streaming_ui/router/main.dart';
import 'package:video_streaming_ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.askForPermissions();
  await AppConfig.registerRepository();
  await AppConfig.registerBloc();

  List<SingleChildWidget> customBlocProvider = <SingleChildWidget>[
    BlocProvider<SignupBloc>(
      create: (context) => AppConfig.serviceLocator<SignupBloc>(),
    ),
  ];

  runApp(
    MultiBlocProvider(
      providers: customBlocProvider,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      title: 'Superb',
      theme: CustomTheme.darkTheme,
      home: const Homepage(),
    );
  }
}
