import 'package:flutter/material.dart';
import 'package:jobsearch/my_prepa.dart';
import 'package:jobsearch/services/provider.dart';
import 'package:provider/provider.dart';

import 'bloc/bloc_export.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AppLang(appLang: 'fr')),
    ], child: MyApp())),
  );
}

// Provider.of<AppStatus>(context, listen: false)
//     .changeUserStatus(val.isSignedIn);
// var loginState = Provider.of<AppStatus>(context).userLoggedIn;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => UserBloc(),
    
        ),
          BlocProvider(
              create: (context) => DomainBloc(),
          ),
          BlocProvider(
              create: (context) => SchoolBloc(),
          ),
          BlocProvider(
              create: (context) => ExamBloc(),
          ),
          BlocProvider(
              create: (context) => FacultyBloc(),
          ),
        ],
              child: MaterialApp(
            home: MyPrepa(),
          ),
    );
  }
}
