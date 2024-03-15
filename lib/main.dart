import 'package:flutter/material.dart';
import 'package:nt_library_app/network/network.dart';
import 'package:nt_library_app/repository/book_repository.dart';
import 'package:nt_library_app/view_model/book_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  ApiProvider apiProvider = ApiProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BookViewModel(
            productRepo: BookRepo(apiProvider: apiProvider),
          ),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home:
    );
  }
}
