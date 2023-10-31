import 'package:flutter/material.dart';
import 'package:milorestaurant/core/utils/app_colors.dart';

import '../utils/getsize.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final IconData suffixIcon;
  final Function iconPressed;
  final Function? onSubmit;
  final Function? onChanged;
  const SearchField({Key? key, required this.controller, required this.hint, required this.suffixIcon, required this.iconPressed, this.onSubmit, this.onChanged}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle:TextStyle(fontSize: getSize(context)/22, color: AppColors.disabledColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(getSize(context)/22), borderSide: BorderSide.none),
        filled: true, fillColor: AppColors.white,
        isDense: true,
        suffixIcon: IconButton(
          onPressed: widget.iconPressed as void Function()?,
          icon: Icon(widget.suffixIcon),
        ),
      ),
      onSubmitted: widget.onSubmit as void Function(String)?,
      onChanged: widget.onChanged as void Function(String)?,
    );
  }
}
