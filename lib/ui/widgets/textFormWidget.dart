import 'package:auxilidok/constants/constants.dart' as constant;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextFormWidget extends StatefulWidget {
  final String attributeAndLabel;
  final List<String Function(dynamic)> validation;
  final bool obTxt;
  final TextInputType keyboardType;
  final IconData icon;
  final double width;
  final double height;

  TextFormWidget({
    @required this.attributeAndLabel,
    this.validation,
    this.obTxt = false,
    this.keyboardType = TextInputType.text,
    this.icon = Icons.edit,
    this.height,
    this.width,
  });

  @override
  _TextFormWidgetState createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  bool isObTxt;

 @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isObTxt = widget.obTxt;
  }

  void toggleObscurity() {
    setState(() {
      isObTxt = !isObTxt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      attribute: widget.attributeAndLabel,
      decoration: InputDecoration(
        labelText: widget.attributeAndLabel,
        icon: Icon(widget.icon),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        suffixIcon: 
        widget.attributeAndLabel == constant.password ?
        IconButton(
          icon: isObTxt ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
          onPressed: toggleObscurity,
        )
        :null,
      ),
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.min(3),
        if (widget.validation != null) ...widget.validation,
      ],
      obscureText: isObTxt,
      onSaved: (newValue) => newValue.toString().trim(),
      keyboardType: widget.keyboardType,
    );
  }
}
