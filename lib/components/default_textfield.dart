import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';
// import 'package:power_overload/Shared/constants.dart';

Widget defaultTextField(
    TextEditingController controller, BuildContext context, String label,
    {Icon? prefixIcon,
    int? height,
    TextStyle? style,
    //int maxLines = 1,
    Widget? postfixicon,
    bool obscureText = false,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool autofocus = false,
    ValueChanged<String>? onChanged}) {
  return TextFormField(
    autofocus: autofocus,
    minLines: height,
    maxLines: height,
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscureText,
    onChanged: onChanged,
    decoration: InputDecoration(
      label: Text(
        label,
        style: style,
      ),
      hintStyle: TextStyle(color: cyan500),
      prefixIcon: prefixIcon,
      suffixIcon: postfixicon,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: cyan300, width: .5),
          borderRadius: standardBorderRadius),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
        borderRadius: standardBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        borderRadius: activeBorderRadius,
      ),
    ),
  );
}
