import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/getsize.dart';

import '../../../core/utils/app_colors.dart';

class RegisterThird extends StatefulWidget {
  const RegisterThird({super.key});

  @override
  State<RegisterThird> createState() => _RegisterThirdState();
}

class _RegisterThirdState extends State<RegisterThird> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Column(
          children: [
            Icon(Icons.check_circle,color: AppColors.success,size: 50,),
            Center(
              child: Text('Congratulations !',

                textAlign: TextAlign.center,
                style: TextStyle(fontSize: getSize(context)/24,color: AppColors.black),),
            ),
            Center(
              child: Text('your Registration Has been Complete Successfully. \n '
                  'Admin Will Confirm your registration request / \n '
                  'provide review within 48 hour',style: TextStyle(fontSize: getSize(context)/32,color: AppColors.black),),
            )

          ],
        ),
      ),
    );
  }
}
