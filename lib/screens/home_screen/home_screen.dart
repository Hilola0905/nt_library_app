import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_library_app/model/book_model.dart';
import 'package:nt_library_app/model/category_name_enum.dart';
import 'package:nt_library_app/screens/add_book_screen/add_book_screen.dart';
import 'package:nt_library_app/screens/update_book_screen/update_book_screen.dart';
import 'package:nt_library_app/view_model/book_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<BookModel> bookModels = [];
    for (int i = 0; i < context.watch<BookViewModel>().allBooks.length; i++) {
      if (context.watch<BookViewModel>().allBooks[i].categoryId ==
          (activeIndex + 1)) {
        bookModels.add(context.watch<BookViewModel>().allBooks[i]);
      }
    }

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "All Books",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
          actions: [
            Ink(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddBookScreen();
                  }));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.blueAccent,
                  child: const Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        weight: 20,
                      ),
                      Text(
                        "add book",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.blueAccent,
        ),
        body: context.watch<BookViewModel>().isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                width: width,
                height: height,
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...List.generate(
                            CategoryNames.values.length,
                            (index) => Ink(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 8,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: activeIndex == index
                                          ? Colors.green
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.black,
                                      )),
                                  child: Text(
                                    CategoryNames.values[index].name,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 16,
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        children: [
                          ...List.generate(bookModels.length, (index) {
                            var book = bookModels[index];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 6),
                              // height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.blue,
                                        spreadRadius: 4,
                                        blurRadius: 2,
                                        offset: Offset(8, 16))
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: Image.network(
                                        book.imgUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              book.name,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 16,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              book.author,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                fontSize: 16,
                                                overflow: TextOverflow.ellipsis,

                                                // textBaseline: ,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context
                                              .read<BookViewModel>()
                                              .deleteBook(book.uuid!);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // String name = context.watch<BookViewModel>().allBooks[index].name;
                                          // print(name);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return UpdateBookScreen(
                                                  bookModel: context
                                                      .watch<BookViewModel>()
                                                      .allBooks[index],
                                                );
                                              },
                                            ),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
