import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_library_app/model/book_model.dart';
import 'package:nt_library_app/model/category_name_enum.dart';
import 'package:nt_library_app/view_model/book_view_model.dart';
import 'package:provider/provider.dart';

class UpdateBookScreen extends StatefulWidget {
  final BookModel bookModel;

  const UpdateBookScreen({super.key, required this.bookModel});

  @override
  State<UpdateBookScreen> createState() => _UpdateBookScreenState();
}

class _UpdateBookScreenState extends State<UpdateBookScreen> {
  int activeIndex1 = 0;

  var formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
          ),
          title: const Center(
              child: Text(
            "Update Book Data",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
          backgroundColor: Colors.blueAccent,
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Name Xato";
                    } else {
                      return null;
                    }
                  },
                  autofocus: true,
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  onTap: () {},
                  // obscureText: true,
                  maxLines: 1,

                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value == null) {
                      return " Description is error";
                    } else {
                      return null;
                    }
                  },
                  controller: descriptionController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    hintText: "description",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),

                    //  labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  onTap: () {},
                  //  obscureText: true,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return " Description is error";
                    } else {
                      return null;
                    }
                  },
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "Price",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),

                    //labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        CategoryNames.values.length,
                        (index) => Ink(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex1 = index;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: activeIndex1 == index
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
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
                SizedBox(height: 100),
                Ink(
                  child: InkWell(
                    onTap: () {
                      BookModel myBookModel = widget.bookModel.copyWith(
                        name: nameController.text,
                        description: descriptionController.text,
                        price: double.parse(priceController.text.isEmpty
                            ? "0"
                            : priceController.text),
                        categoryId: activeIndex1,
                      );
                      print(myBookModel.name);
                      print(myBookModel.price);
                      print(myBookModel.description);
                      print(myBookModel.categoryId);
                      print(myBookModel.author);
                      print(myBookModel.imgUrl);
                      if (BookModel.canAddDatabase(myBookModel) && formKey.currentState!.validate()) {
                        context.read<BookViewModel>().updateBook(myBookModel);
                        // context.read<BookViewModel>().getAllBooks();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("SUCCESS"),
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Nimadur Xato"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text("Update Book"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
