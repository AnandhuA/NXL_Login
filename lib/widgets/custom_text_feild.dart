import 'package:flutter/material.dart';
import 'package:nxl_login/core/config/sizes.dart';

class CustomTextFeild extends StatefulWidget {
  final bool isPassword;
  final TextEditingController controller;
  final String title;
  final String? Function(String?)? validator;
  const CustomTextFeild({
    super.key,
    this.isPassword = false,
    required this.controller,
    required this.title,
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
    return TextFormField(
      controller: widget.controller,
      obscureText: visibility,
      validator: widget.validator,
      decoration: InputDecoration(
        label: Text(widget.title),
        border: OutlineInputBorder(borderRadius: AppRadius.br12()),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon: Icon(
                  visibility ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
