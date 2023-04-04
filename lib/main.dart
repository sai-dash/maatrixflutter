import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maatrixflutter/model/UserViewModel.dart';
import 'package:maatrixflutter/view/UserListScreen.dart';
import 'package:provider/provider.dart';

import 'model/util/routes.dart';
import 'model/util/routes_name.dart';
import 'model/util/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MyApp());
}

init() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        navigatorKey: Utils.navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
