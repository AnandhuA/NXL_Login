import 'package:flutter/material.dart';
import 'package:nxl_login/core/config/sizes.dart';
import 'package:nxl_login/core/theme/colors.dart';

class CustomTextFeild extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String title;
  final String headingText;
  final String? Function(String?)? validator;
  final IconData icon;
  final TextInputType keyboardType;
  const CustomTextFeild({
    super.key,
    this.isPassword = false,
    this.keyboardType =TextInputType.text,
    required this.controller,
    required this.title,
    required this.icon,
    required this.headingText,

    this.validator,
  });

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
  late bool visibility;
  @override
  void initState() {
    visibility = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(widget.headingText),
        AppSpacing.h4(),
        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: visibility,
          validator: widget.validator,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
              borderRadius: AppRadius.br12(),
            ),
            label: Text(widget.title),
            border: OutlineInputBorder(
              borderRadius: AppRadius.br12(),
              borderSide: BorderSide(color: AppColors.boderColor),
            ),
            prefixIcon: Icon(widget.icon, color: AppColors.textFeildIcon),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: Icon(
                      visibility ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textFeildIcon,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
