import 'package:flutter/material.dart';
import 'package:graphql_api_integration_practice/injections.dart';
import 'package:graphql_api_integration_practice/presentation/controller/screens/dashboard_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initCore();
  initGraphQLApi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GraphQL API's Practice",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
    );
  }
}


