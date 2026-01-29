import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final Color? textFieldColor;
  final String? hintText;
  final String? label;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final bool? readOnly;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final bool isPassword;
  final double paddingVertical;
  final AutovalidateMode? autoValidateMode;
  final int? maxLength;
  final String? prefixText;
  final InputBorder? border;
  final TextInputAction? textInputAction;
  final Function(PointerDownEvent)? onTapOutside;
  final BoxBorder? outerBorder;
  final List<BoxShadow>? boxShadow;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? fillColor;

  const CommonTextField({
    super.key,
    this.controller,
    this.initialValue,
    this.textFieldColor,
    this.hintText,
    this.label,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.contentPadding,
    this.onChanged,
    this.readOnly,
    this.enabled = true,
    this.maxLines,
    this.minLines,
    this.isPassword = false,
    this.paddingVertical = 0.0,
    this.autoValidateMode,
    this.maxLength,
    this.prefixText,
    this.border,
    this.textInputAction,
    this.onTapOutside,
    this.outerBorder,
    this.boxShadow,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor
  });

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool showPassword = false;
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController =
        widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void didUpdateWidget(CommonTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller == null) {
      final newText = widget.initialValue ?? '';
      if (_internalController.text != newText) {
        final previousSelection = _internalController.selection;
        final collapsedOffset =
            min(previousSelection.baseOffset, newText.length);
        _internalController.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: collapsedOffset),
        );
      }
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shouldObscure = widget.isPassword && !showPassword;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              widget.label!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
          ),
          SizedBox(height: 6),
        ],
        Container(
          decoration: BoxDecoration(
            color: widget.textFieldColor ?? colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(12),
            border: widget.outerBorder ?? Border.all(
              color: colorScheme.onSurface.withValues(alpha: 0.1),
              width: 1,
            ),
            boxShadow: widget.boxShadow ?? [
              BoxShadow(
                color: const Color(0xffD0D5DD).withValues(alpha: 0.4),
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 0,
              ),
            ],
          ),
          child: TextFormField(
            controller: widget.controller ?? _internalController,
            enabled: widget.enabled,
            onChanged: widget.onChanged,
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines ?? 1,
            minLines: widget.minLines,
            maxLength: widget.maxLength,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            obscureText: shouldObscure,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            onTapOutside: widget.onTapOutside,
            decoration: InputDecoration(
              counterText: "",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixText: widget.prefixText,
              contentPadding: widget.contentPadding ??
                  EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              isDense: true,
              border: widget.border ?? InputBorder.none,
              enabledBorder: widget.border ?? InputBorder.none,
              focusedBorder: widget.border ?? InputBorder.none,
              hintText: widget.hintText ?? "",
              hintStyle: TextStyle(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 14,
              ),
              prefixIcon: widget.prefixIcon,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              filled: widget.fillColor != null,
              fillColor: widget.fillColor,
              suffixIcon: widget.isPassword
                  ? SizedBox(
                      width: 32,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        iconSize: 18,
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () =>
                            setState(() => showPassword = !showPassword),
                      ),
                    )
                  : widget.suffixIcon,
              errorStyle: TextStyle(fontSize: 12, height: 0.9),
            ),
            style: TextStyle(
              color: colorScheme.onSurface,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            autovalidateMode: widget.autoValidateMode,
          ),
        )
      ],
    );
  }
}
