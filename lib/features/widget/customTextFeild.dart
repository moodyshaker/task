import 'package:flutter/material.dart';
import 'package:task/core/screen_utils/screen_config.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final Color? hintColor;
  final double? hintSize;
  final TextInputType? type;
  final Function(String?)? onChange;
  final Function()? iconCallback;
  final IconData? suffixIcon;
  final Color? fillColor;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final IconData? prefixIcon;
  final FocusNode? focus;
  final bool autoFocus;
  final bool? read;
  final TextInputAction? action;

  CustomTextField({
    this.hint,
    this.maxLines,
    this.onTap,
    this.hintSize,
    this.minLines,
    this.hintColor,
    this.suffixIcon,
    this.type,
    this.fillColor,
    this.action,
    this.onChange,
    this.iconCallback,
    this.controller,
    this.focus,
    this.autoFocus = false,
    this.prefixIcon,
    this.read,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      cursorColor: Colors.grey,
      focusNode: widget.focus,
      textInputAction: widget.action,
      readOnly: widget.read == true ? true : false,
      maxLines: widget.maxLines ?? widget.minLines ?? 1,
      minLines: widget.minLines,
      autofocus: widget.autoFocus,
      keyboardType: widget.type,
      onChanged: widget.onChange,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: widget.hint,
        fillColor: widget.fillColor ?? Colors.grey[200],
        filled: true,
        contentPadding:
        EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 2, vertical: 0),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: Colors.grey,
              )
            : null,
        counterText: '',
        labelStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          fontSize: widget.hintSize ?? SizeConfig.safeBlockHorizontal * 4,
          color: widget.hintColor ?? Colors.black,
        ),
        suffixIcon: widget.suffixIcon != null
            ? Icon(
                widget.suffixIcon,
                color: Colors.black,
              )
            : Container(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0,color: Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0,color: Colors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
