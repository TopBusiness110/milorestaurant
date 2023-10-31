import 'package:flutter/material.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';


class MostWanted extends StatefulWidget {
  const MostWanted({Key? key}) : super(key: key);

  @override
  State<MostWanted> createState() => _MostWantedState();
}

class _MostWantedState extends State<MostWanted> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
        itemCount: 10,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 4,
        mainAxisSpacing:  0.01,

        crossAxisCount:  2,
      ), itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(

              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
                child: CustomImage(
                  image:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal:30 ),
                child: Text(
                  '(Laksa) ',
                  style: TextStyle(
                      fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
        },);
  }
}
