import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  final BuildContext context;

  NavigationService(this.context);

  void push(String routeName,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters,
      Object? extra}) {
    context.pushNamed(
      routeName,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
      extra: extra,
    );
  }

  void replace(String routeName,
      {Map<String, String>? pathParameters,
      Map<String, dynamic>? queryParameters,
      Object? extra}) {
    context.replaceNamed(
      routeName,
      queryParameters: queryParameters ?? {},
      pathParameters: pathParameters ?? {},
      extra: extra,
    );
  }

  void pop() {
    Navigator.of(context).pop();
  }
}
