import 'package:app_vidracaria/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:app_vidracaria/modules/auth/presenter/login/login_controller.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: Modular.initialRoute,
        onGenerateRoute: Modular.generateRoute,
    );
  }
}
