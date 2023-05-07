
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_media/res/color.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
    required this.myController,
    required this.focusNode,
    required this.onFiledSubmittedValue,
    required this.keyBoardType,
    required this.obscureText,
    required this.hint,
    this.enable = true,
    required this.onValidator,
    this.autoFocus = false


  }) : super(key: key);

  final TextEditingController myController;
  final FocusNode focusNode;
  final FormFieldSetter onFiledSubmittedValue;
  final FormFieldValidator onValidator;

  final TextInputType keyBoardType ;
  final String hint;
  final bool obscureText ;
  final bool enable , autoFocus ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        controller: myController,
        focusNode: focusNode,
        obscureText: obscureText,
        onFieldSubmitted: onFiledSubmittedValue,
        validator: onValidator,
        keyboardType: keyBoardType,
        cursorColor: AppColors.primaryTextTextColor,
        style: Theme.of(context).textTheme.bodyText2!.copyWith( height: 0,fontSize: 19),
        decoration: InputDecoration(
          hintText: hint,
          enabled: enable,
          contentPadding: const EdgeInsets.all(15),
          hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(height: 0, color: AppColors.primaryTextTextColor.withOpacity(0.8)),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
            borderRadius: BorderRadius.all(Radius.circular(8))

          ),
          focusedBorder:const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.secondaryColor),
            borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.alertColor),
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
              borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          ),
        ),
    );
  }
}
