import 'package:flutter/material.dart';
import 'package:milorestaurant/core/widgets/custom_image.dart';


class Catering extends StatefulWidget {
  const Catering({Key? key}) : super(key: key);

  @override
  State<Catering> createState() => _CateringState();
}

class _CateringState extends State<Catering> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) {
       return Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(
            height: 200,
            child: Stack(
              children: [
                Container(

                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: CustomImage(
                      image:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAgC3P9STBiexieI0Rolg7xYJvjejDvVQrtA&usqp=CAU",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.white, width: 10)),
                    child: Container(
                        width: 150,
                        height: 100,
                      decoration: BoxDecoration(
                     color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
                      child: Center(
                        child: Text(
"Catering for an engagement party in Amsterdam consisting of 20 people",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
       );
    },);
  }
}
