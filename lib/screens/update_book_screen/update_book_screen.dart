import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateBookScreen extends StatelessWidget {
  const UpdateBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex1=0;
    var formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,), ),
          title: const Center(child:  Text("Update Book Data",style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
          ),)),
          backgroundColor: Colors.blueAccent,
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 12),
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
                  controller: emailController,
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
                    if (value == null ) {
                      return " Description is error";
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
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
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value == null || value.length < 6) {
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
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(5, (index) =>
                          Ink(
                            child: InkWell(
                                onTap: (){
                                  activeIndex1==index;
                                },
                                child:  Container(
                                  padding:const  EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                  margin:const  EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      color: activeIndex1==index ? Colors.blue : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.black,
                                      )
                                  ),
                                  child: const  Text("Badiiy",style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),),
                                )
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
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("SUCCESS")));
                      }
                    },
                    child:   Container(
                      width: 150,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:Center(child: Text("Update Book")) ,
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
