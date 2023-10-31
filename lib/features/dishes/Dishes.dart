import 'package:flutter/material.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';


class Dishes extends StatefulWidget {
  const Dishes({Key? key}) : super(key: key);

  @override
  State<Dishes> createState() => _DishesState();
}

class _DishesState extends State<Dishes> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (context, index) {
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [
             Container(

               child: ClipRRect(
                 borderRadius: BorderRadius.all(
                     Radius.circular(25),
                 ),
                 child: CustomImage(
                   image:
                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
                   height: 150,
                   width: MediaQuery.of(context).size.width,
                   fit: BoxFit.fill,
                 ),
               ),
             ),
             Row(
               children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal:30 ),
                     child: Text(
                       '(Laksa) ',
                       style: TextStyle(
                           fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal:8),
                   child: Text(
                     '(chickens . spices. soy. lettuce The secret mixture)',
                     style:TextStyle(
                         fontSize: 10, color: Colors.grey, ),
                   ),
                 )
               ],
             ),
           ],
         ),
       );
    },);
  }
}
