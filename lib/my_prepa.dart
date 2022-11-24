import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jobsearch/Theme/app_theme.dart';
import 'package:jobsearch/models/Domain.dart';
import 'package:jobsearch/models/School.dart';
import 'package:jobsearch/services/callApi.dart';
import 'bloc/bloc/domainBloc/domain_event.dart';
import 'bloc/bloc/schoolBloc/school_event.dart';
import 'bloc/bloc_export.dart';
import 'screens/home/IntroScreen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyPrepa());
}

class MyPrepa extends StatefulWidget {
  const MyPrepa({Key? key}) : super(key: key);

  @override
  State<MyPrepa> createState() => _MyPrepaState();
}

class _MyPrepaState extends State<MyPrepa> {
  // This widget is the root of your application.
  @override
  void initState() {
    _loadingProcess();
    super.initState();
  }

  List<School> schools = <School>[];
  List<Domain> domains = <Domain>[];

  Future<void> _loadingProcess() async {
    await _fetchSchoolInfo();
    await _fetchDomainInfo();
  }

  Future<void> _fetchSchoolInfo() async {
    try {
      await CallApi().getData('schools').then((response) {
        Iterable list = json.decode(response.body);
        schools = List<School>.from((list).map((json) => School.fromMap(json)));
      });

      if (schools.isNotEmpty) {
        // ignore: use_build_context_synchronously
        context.read<SchoolBloc>().add(AddSchools(schools: schools));
        print("fetch all School info");
      } else {
        print(' fetchch school info');
      }
    } catch (e) {
      print('ERROR -----> ${e}');
    }
  }

  Future<void> _fetchDomainInfo() async {
    try {
      await CallApi().getData('domains').then((response) {
        Iterable list = json.decode(response.body);
        domains = List<Domain>.from((list).map((json) => Domain.fromMap(json)));
      });

      if (domains.isNotEmpty) {
        // ignore: use_build_context_synchronously
        context.read<DomainBloc>().add(AddDomains(domains: domains));
        print('fetchch Domain info');
      } else {
        print('could not fetchch Domain info');
      }
    } catch (e) {
      print('ERROR -----> ${e}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Prepa',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      home: const IntroScreen(),
    );
  }
}
