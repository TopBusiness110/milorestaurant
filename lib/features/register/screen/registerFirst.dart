import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/getsize.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/customtextfield.dart';
import '../../../core/widgets/search_field.dart';
import '../../../core/widgets/select_location_view.dart';


class RegisterFirst extends StatefulWidget {
  const RegisterFirst({super.key});

  @override
  State<RegisterFirst> createState() => _RegisterFirstState();
}

class _RegisterFirstState extends State<RegisterFirst> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Resturant Name",style: TextStyle(color: AppColors.black,
            fontSize: getSize(context)/24),),
            CustomTextField(hintText:"Resturant Name" ,
              showBorder: false,
            ),
            Text("Resturant Address",style: TextStyle(color: AppColors.black,
            fontSize: getSize(context)/24),),
            CustomTextField(hintText:"Resturant Address" ,
              maxLines: 4,
              showBorder: false,
            ),
            Text("Vat/Tax",style: TextStyle(color: AppColors.black,
            fontSize: getSize(context)/24),),
            CustomTextField(hintText:"Vat/Tax" ,

              inputType: TextInputType.number,
              showBorder: false,
            ),
            Text("Cusines",style: TextStyle(color: AppColors.black,
            fontSize: getSize(context)/24),),
            CustomTextField(hintText:"Cusines" ,

              showBorder: false,
            ),
           Row(
             children: [
               Expanded(child: Column(children: [
                 Text("Minimum Delivery Time",style: TextStyle(color: AppColors.black,
                     fontSize: getSize(context)/32),),
                 CustomTextField(hintText:"Minimum Delivery Time" ,

                   showBorder: false,
                 ),
               ],)) ,
               SizedBox(width: 2,),

               Expanded(child: Column(children: [
                 Text("Maximum Delivery Time",style: TextStyle(color: AppColors.black,
                     fontSize: getSize(context)/32),),
                 CustomTextField(hintText:"Maximum Delivery Time" ,
                   showBorder: false,
                 ),
               ],))
             ],
           ),
            Text(
              'logo',
              style: TextStyle(color: AppColors.black,fontSize:getSize(context)/32 ), textAlign: TextAlign.center,
            ),
            Align(alignment: Alignment.center, child:
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getSize(context)/22),
                  child:
              Container(
                    width: 150, height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22)),

                        border: Border.all(color: AppColors.primary),
                      color: AppColors.gray2
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                        Icon(Icons.image, size: 38, color: Theme.of(context).disabledColor),
                         SizedBox(height: getSize(context)/24),


                      ]),
                    ),
                  ),
                ),
              ),

            ])),    
            Text(
              'cover photo',
              style: TextStyle(color: AppColors.black,fontSize:getSize(context)/32 ), textAlign: TextAlign.center,
            ),
            Align(alignment: Alignment.center, child:
            Stack(children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(getSize(context)/24),
                  child:
              Container(
                    width: getSize(context),
                height: 180,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary,),
                      borderRadius: BorderRadius.all(Radius.circular(getSize(context)/22)),
                      color: AppColors.gray2
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

                        Icon(Icons.image, size: 38, color: Theme.of(context).disabledColor),
                         SizedBox(height: getSize(context)/24),


                      ]),
                    ),
                  ),
                ),
              ),

            ])),
            Container(
              color: AppColors.white,
              child:Padding(
                padding:  EdgeInsets.all(getSize(context)/22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Zone',
                      style: TextStyle(color: AppColors.black,fontSize:getSize(context)/32 ), textAlign: TextAlign.center,
                    ),
                    Row(
                      
                      children: [
                        Icon(Icons.pin_drop,color: AppColors.primary,),
                        Expanded(
                          child: SearchField(controller: TextEditingController(),
                              hint: 'search', suffixIcon: Icons.search, iconPressed: (){},),
                        ),
                      ],
                    ),
                    SelectLocationView(fromView: true),
                    Row(
                      children: [
                        Expanded(child: Column(children: [
                          Text("Latitude",style: TextStyle(color: AppColors.black,
                              fontSize: getSize(context)/32),),
                          CustomTextField(hintText:"Latitude" ,

                            showBorder: false,
                          ),
                        ],)) ,
                        SizedBox(width: 2,),

                        Expanded(child:
                        Column(children: [
                          Text("Longitude",style: TextStyle(color: AppColors.black,
                              fontSize: getSize(context)/32),),
                          CustomTextField(hintText:"Longitude" ,
                            showBorder: false,

                          ),
                        ],))
                      ],
                    ),
                    Center(child: Text(
                      'Service Not Available in This Area'
                          ,style: TextStyle(fontSize: getSize(context)/32),
                    ),)
                  ],
                ),
              ),
            ),
            Center(child: Text(
              'Owner Information'
              ,style: TextStyle(fontSize: getSize(context)/32),
            ),),
            Row(
              children: [
                Expanded(child: Column(children: [
                  Text("First Name",style: TextStyle(color: AppColors.black,
                      fontSize: getSize(context)/32),),
                  CustomTextField(hintText:"First Name" ,

                    showBorder: false,
                  ),
                ],)) ,
                SizedBox(width: 2,),

                Expanded(child: Column(children: [
                  Text("Last Name",style: TextStyle(color: AppColors.black,
                      fontSize: getSize(context)/32),),
                  CustomTextField(hintText:"Lat Name" ,
                    showBorder: false,
                  ),
                ],))
              ],
            ),
            Text("Phone",style: TextStyle(color: AppColors.black,
                fontSize: getSize(context)/32),),
            CustomTextField(hintText:"Phone" ,
              inputType: TextInputType.phone,
              showBorder: false,
            ),
            Center(child: Text(
              'Login Information'
              ,style: TextStyle(fontSize: getSize(context)/32),
            ),),
            Text("Email",style: TextStyle(color: AppColors.black,
                fontSize: getSize(context)/32),),
            CustomTextField(hintText:"Email" ,
inputType: TextInputType.emailAddress,
              showBorder: false,
            ),
            Row(
              children: [
                Expanded(child: Column(children: [
                  Text("password",style: TextStyle(color: AppColors.black,
                      fontSize: getSize(context)/32),),
                  CustomTextField(hintText:"password" ,
isPassword: true,
                    showBorder: false,
                  ),
                ],)) ,
                SizedBox(width: 2,),
                Expanded(child: Column(children: [
                  Text("Confirm Password",style: TextStyle(color: AppColors.black,
                      fontSize: getSize(context)/32),),
                  CustomTextField(hintText:"Confirm Password" ,
                    showBorder: false,
                    isPassword: true,
                  ),
                ],))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
