import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:milorestaurant/features/register/screen/registerFirst.dart';
import 'package:milorestaurant/features/register/screen/registerSeconed.dart';
import 'package:milorestaurant/features/register/screen/registerThird.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary),
                ),
                child: Center(
                  child: Icon(
                    _tabController!.index == 0 ? Icons.circle : Icons.check,
                    size: 10,
                    color: AppColors.primary,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                color: _tabController!.index == 0
                    ? AppColors.gray
                    : AppColors.primary,
              )),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        _tabController!.index == 1 || _tabController!.index == 2
                            ? AppColors.primary
                            : AppColors.gray,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _tabController!.index == 1
                        ? Icons.circle
                        : _tabController!.index == 2
                            ? Icons.check
                            : null,
                    size: 10,
                    color:
                        _tabController!.index == 1 || _tabController!.index == 2
                            ? AppColors.primary
                            : AppColors.gray,
                  ),
                ),
              ),
              Expanded(
                  child: Divider(
                color: _tabController!.index == 1||_tabController!.index==2
                    ? AppColors.primary
                    : AppColors.gray,
              )),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                         _tabController!.index == 2
                            ? AppColors.primary
                            : AppColors.gray,
                  ),
                ),
                child: Center(
                  child: Icon(
                     _tabController!.index == 2
                            ? Icons.check
                            : null,
                    size: 10,
                    color:
                        _tabController!.index == 2
                            ? AppColors.primary
                            : AppColors.gray,
                  ),
                ),
              ),
              SizedBox(width: 10,)
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                child: Text("General information",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: getSize(context)/42,color: AppColors.primary),),
              )
,
              Expanded(
                  child: Container()),
              Container(
                width: 50,
                child: Text("Businessplan",
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: getSize(context)/42,color: AppColors.primary),),
              ),
              Expanded(
                  child: Container()),
              Container(
                width: 50,
                child: Text("Complete",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: getSize(context)/42,color: AppColors.primary),),
              ),
              SizedBox(width: 10,)
            ],
          ),
          Expanded(
              child: TabBarView(
            controller: _tabController,
            children: [
              RegisterFirst(),
              RegisterSeconed(),
              RegisterThird()
            ],
          )),
          CustomButton(
            paddingHorizontal: 20,
            // margin: EdgeInsets.all(8),

            onClick: () {
              if (_tabController!.index == 0) {
                _tabController!.animateTo(1);
              }
              else  if (_tabController!.index == 1) {
                _tabController!.animateTo(2);
              }else {
                Navigator.pushNamed(context, Routes.homeScreen);

              }
              setState(() {});
            },
            color: AppColors.primary,
            text: 'next'.tr() ,
          ),
        ],
      ),
    );
  }
}
