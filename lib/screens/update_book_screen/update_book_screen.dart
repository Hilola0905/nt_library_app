import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nt_library_app/model/book_model.dart';
import 'package:nt_library_app/model/category_name_enum.dart';
import 'package:nt_library_app/view_model/book_view_model.dart';
import 'package:provider/provider.dart';

class UpdateBookScreen extends StatefulWidget {
  final BookModel bookModel;
  const UpdateBookScreen({super.key, required this.bookModel,  });

  @override
  State<UpdateBookScreen> createState() => _UpdateBookScreenState();
}

class _UpdateBookScreenState extends State<UpdateBookScreen> {

  var formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  late  final TextEditingController descriptionController = TextEditingController();
  late final TextEditingController priceController = TextEditingController();
  late int activeIndex;
  @override
  void initState() {
    activeIndex=widget.bookModel.categoryId;
    nameController.text=widget.bookModel.name;
    descriptionController.text=widget.bookModel.description;
    priceController.text=widget.bookModel.price.toString();
    super.initState();
  }
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
                  autofocus: true,
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: widget.bookModel.name,
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
                  controller: descriptionController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    //contentPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    hintText: widget.bookModel.description,
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
                  controller: priceController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: widget.bookModel.price.toString(),
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
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              print("$index  index");
                              setState(() {
                                activeIndex= index+1;
                              });
                            },
                            child: Container(

                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              decoration: BoxDecoration(
                                color:activeIndex-1== index
                                    ? Colors.blue
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.black,
                                ),
                              ),
                              child: Text(
                                CategoryNames.values[index].name,
                                style: const TextStyle(
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
                const SizedBox(height: 90),
                Ink(
                  child: InkWell(
                    onTap: () {
                      BookModel myBookModel = widget.bookModel.copyWith(
                        name: nameController.text,
                        description: descriptionController.text,
                        price: double.parse(priceController.text.isEmpty
                            ? "0"
                            : priceController.text),
                        categoryId: activeIndex,
                      );

                      if (BookModel.canAddDatabase(myBookModel) && formKey.currentState!.validate()) {
                         context.read<BookViewModel>().updateBook(myBookModel);
                         context.read<BookViewModel>().getAllBooks();
                         ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("SUCCESS"),
                          ),
                        );
                        Navigator.pop(context);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Nimadur Xato"),
                          ),
                        );
                      }
                    },
                    child: Container(
                      width: 140,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const  Center(
                        child: Text("Update Book"),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
