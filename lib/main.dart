import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_with_flutter/ui/todo_list_page.dart';

import 'data/models/my_model.dart';
import 'ui/cerate_update_totd_page.dart';
import 'ui/todo_details_page.dart';

void main() async {
  // We need this for cashing
  await initHiveForFlutter();

  //This is a graphqlclient
  final GraphQLClient graphQLClient = GraphQLClient(
    link: HttpLink("https://graphqlzero.almansi.me/api"),
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );

  final client = ValueNotifier(graphQLClient);

  runApp(
    GraphQLProvider(
      client: client,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL with Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'GraphQL with Flutter'),
    );
  }
}
