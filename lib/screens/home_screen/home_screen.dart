import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:nt_library_app/screens/add_book_screen/add_book_screen.dart';
import 'package:nt_library_app/screens/update_book_screen/update_book_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex=0;
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child:  Text("All Books",textAlign: TextAlign.center,style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),)),
          actions: [
           Ink(
             padding: const EdgeInsets.symmetric(horizontal: 15) ,
             child: InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return AddBookScreen();
                   }));
                 }, child:  Container(
                  width: 40,
                  height: 40,
                  color: Colors.blueAccent,
                  child: const Column(
                    children: [
                      Icon(Icons.add,color: Colors.white,weight: 20,),
                      Text("add book",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                      ),
                      ),

                    ],
                  ))),
           ),
          ],
          backgroundColor: Colors.blueAccent,
        ),
       body: Container(
         padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
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
                   ...List.generate(5, (index) =>
                       Ink(
                         child: InkWell(
                           onTap: (){
                             activeIndex==index;
                           },
                           child:  Container(
                             padding:const  EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                             margin:const  EdgeInsets.symmetric(horizontal: 8),
                             decoration: BoxDecoration(
                                 color: activeIndex==index ? Colors.green : Colors.white,
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
             SizedBox(height: 10,),
             Expanded(
                 flex: 16,
                 child: GridView.count(
                     crossAxisCount: 2,
                     mainAxisSpacing: 10,
                     crossAxisSpacing: 10,
                   children: [
                     ...List.generate(8, (index) =>

                         Container(
                           padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
                           // height: 100,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               border: Border.all(
                                 color: Colors.black,
                               ),
                               borderRadius: BorderRadius.circular(16),
                               boxShadow: const  [
                                 BoxShadow(
                                     color: Colors.blue,
                                     spreadRadius: 4,
                                     blurRadius: 2,
                                     offset: Offset(8,16)
                                 )
                               ]
                           ),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               ClipRRect(
                                 borderRadius: BorderRadius.circular(16),
                                 child: Container(
                                   height: 100,
                                   color: Colors.black,
                                 ),
                               ),
                               Row(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                  const  Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Text("InterBook ",
                                         textAlign: TextAlign.start,
                                         style: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.blue,
                                         ),),
                                        Text("\$2000",
                                         textAlign: TextAlign.start,
                                         style: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.w400,
                                           color: Colors.blue,
                                         ),),
                                     ],
                                   ),
                                   InkWell(
                                   onTap: (){},
                                   child: const Icon(Icons.delete,color: Colors.red,),
                                 ),
                                   InkWell(
                                   onTap: (){
                                     Navigator.push(context, MaterialPageRoute(builder: (context){
                                       return const UpdateBookScreen();
                                     }));
                                   },
                                   child: const Icon(Icons.edit,color: Colors.black,),
                                 ),
                                 ],
                               ),

                             ],
                           ),
                         )
                     )
                   ],
                 )
             ),
           ],
         ),
       ),
      ),
    );
  }
}
