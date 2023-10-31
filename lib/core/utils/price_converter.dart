
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:milorestaurant/features/register/cubit/register_cubit.dart';

class PriceConverter {
  static String convertPrice(double? price, {double? discount, String? discountType,required BuildContext context, int? asFixed}) {
    if(discount != null && discountType != null){
      if(discountType == 'amount') {
        price = price! - discount;
      }else if(discountType == 'percent') {
        price = price! - ((discount / 100) * price);
      }
    }
    bool isRightSide =context.read<RegisterCubit>().configModel!.currencySymbolDirection == 'right';
    return '${isRightSide ? '' : '${context.read<RegisterCubit>().configModel!.currencySymbol!} '}'
        '${(toFixed(price!, context.read<RegisterCubit>().configModel!.digitAfterDecimalPoint!,context)).toStringAsFixed(asFixed ?? context.read<RegisterCubit>().configModel!.digitAfterDecimalPoint!)
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
        '${isRightSide ? ' ${context.read<RegisterCubit>().configModel!.currencySymbol!}' : ''}';
  }

  static double? convertWithDiscount(double? price, double? discount, String? discountType) {
    if(discountType == 'amount') {
      price = price! - discount!;
    }else if(discountType == 'percent') {
      price = price! - ((discount! / 100) * price);
    }
    return price;
  }

  static double calculation(double amount, double? discount, String type, int quantity) {
    double calculatedAmount = 0;
    if(type == 'amount') {
      calculatedAmount = discount! * quantity;
    }else if(type == 'percent') {
      calculatedAmount = (discount! / 100) * (amount * quantity);
    }
    return calculatedAmount;
  }

  static String percentageCalculation(String price, String discount, String discountType,BuildContext context) {
    return '$discount${discountType == 'percent' ? '%' : context.read<RegisterCubit>().configModel!.currencySymbol} OFF';
  }

  static double toFixed(double val, int places,BuildContext context) {
    num mod = power(10, places);
    return (((val * mod).toPrecision(context.read<RegisterCubit>().configModel!.digitAfterDecimalPoint!)).floor().toDouble() / mod);
  }

  static int power(int x, int n) {
    int retval = 1;
    for (int i = 0; i < n; i++) {
      retval *= x;
    }
    return retval;
  }
}