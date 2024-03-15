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
      child: MyApp(),
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
      // home: HomePage(),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     BookModel bookModell = BookModel(
//         author: '',
//         categoryId: 0,
//         description: '',
//         imgUrl: '',
//         name: '',
//         price: 0,
//         rate: 0);
//     BookViewModel bookModel = context.watch<BookViewModel>();
//     return Scaffold(
//       body: bookModel.isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Center(
//               child: Column(
//                 children: [
//                   SizedBox(height: 30),
//                   ...List.generate(
//                     bookModel.allBooks.length,
//                     (index) => Text(bookModel.allBooks[index].name),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // context.read<BookViewModel>().addBook(
//                           //   BookModel(
//                           //       author: "Hech kim",
//                           //       categoryId: 2,
//                           //       description: "hello",
//                           //       imgUrl:
//                           //           "https://i.pinimg.com/originals/85/e8/bc/85e8bcae056d96d11b5239565460c427.jpg",
//                           //       name: 'name',
//                           //       price: 230.0,
//                           //       rate: 3),
//                           // );
//
//                       context
//                           .read<BookViewModel>()
//                           .deleteBook(bookModel.allBooks[0].uuid!);
//                       context.read<BookViewModel>().getAllBooks();
//                     },
//                     child: Text("Add to Book"),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
