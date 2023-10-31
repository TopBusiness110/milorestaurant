import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:milorestaurant/core/utils/getsize.dart';
import 'package:milorestaurant/core/widgets/code_picker_widget.dart';

import '../utils/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String titleText;
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final String? prefixImage;
  final IconData? prefixIcon;
  final double prefixSize;
  final TextAlign textAlign;
  final bool isAmount;
  final bool isNumber;
  final bool showTitle;
  final bool showBorder;
  final double iconSize;
  final bool divider;
  final bool isPhone;
  final String? countryDialCode;
  final Function(CountryCode countryCode)? onCountryChanged;

  const CustomTextField(
      {Key? key,
        this.titleText = 'Write something...',
        this.hintText = '',
        this.controller,
        this.focusNode,
        this.nextFocus,
        this.isEnabled = true,
        this.inputType = TextInputType.text,
        this.inputAction = TextInputAction.next,
        this.maxLines = 1,
        this.onSubmit,
        this.onChanged,
        this.prefixImage,
        this.prefixIcon,
        this.capitalization = TextCapitalization.none,
        this.isPassword = false,
        this.prefixSize = 10,
        this.textAlign = TextAlign.start,
        this.isAmount = false,
        this.isNumber = false,
        this.showTitle = false,
        this.showBorder = true,
        this.iconSize = 18,
        this.divider = false,
        this.isPhone = false,
        this.countryDialCode,
        this.onCountryChanged,
      }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        widget.showTitle ? Text(widget.titleText,  style:TextStyle(fontSize: getSize(context)*0.022, )) : const SizedBox(),
        SizedBox(height: widget.showTitle ?
        getSize(context)/22 : 0),

        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textAlign: widget.textAlign,
          style:TextStyle(fontSize: getSize(context)*0.022,),
          textInputAction: widget.inputAction,
          keyboardType: widget.isAmount ? TextInputType.number : widget.inputType,
          cursorColor: AppColors.primary,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
              : widget.isAmount ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))] : widget.isNumber ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))] : null,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getSize(context)/22),
              borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 0.3, color: AppColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getSize(context)/22),
              borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 1, color: AppColors.primary),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(getSize(context)/22),
              borderSide: BorderSide(style: widget.showBorder ? BorderStyle.solid : BorderStyle.none, width: 0.3, color: AppColors.primary),
            ),
            isDense: true,
            hintText: widget.hintText.isEmpty ? widget.titleText : widget.hintText,
            fillColor: AppColors.white,
            hintStyle:TextStyle(fontSize: getSize(context)*0.022, color: AppColors.hint),
            filled: true,
            prefixIcon:  widget.isPhone ? SizedBox(width: 95, child: Row(children: [
              Container(
                width: 85,height: 40,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(getSize(context)/22),
                    bottomLeft: Radius.circular(getSize(context)/22),
                  ),
                ),
                margin: const EdgeInsets.only(right: 0),
                padding: const EdgeInsets.only(left: 5),
                child: Center(
                  child: CodePickerWidget(
                      flagWidth: 25,
                      padding: EdgeInsets.zero,
                      onChanged: widget.onCountryChanged,
                      initialSelection: widget.countryDialCode,
                      favorite: [widget.countryDialCode!],
                      dialogBackgroundColor: AppColors.white,
                      textStyle:  TextStyle(fontSize: getSize(context)*0.022, color: AppColors.black)
                  ),
                ),
              ),


              Container(
                height: 20, width: 2,
                color: AppColors.disabledColor,
              )
            ]),
            ) : widget.prefixImage != null && widget.prefixIcon == null ? Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.prefixSize),
              child: Image.asset(widget.prefixImage!, height: 20, width: 20),
            ) : widget.prefixImage == null && widget.prefixIcon != null ? Icon(widget.prefixIcon, size: widget.iconSize) : null,
            suffixIcon: widget.isPassword ? IconButton(
              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility, color: AppColors.hint.withOpacity(0.3)),
              onPressed: _toggle,
            ) : null,
          ),
          onSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null ? widget.onSubmit!(text) : null,
          onChanged: widget.onChanged as void Function(String)?,
        ),

        widget.divider ?  Padding(padding: EdgeInsets.symmetric(horizontal: getSize(context)/22), child: Divider()) : const SizedBox(),

      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}



