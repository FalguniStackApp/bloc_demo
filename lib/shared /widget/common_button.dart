import 'package:blocdemo/core/constant/app_colors.dart';
import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final double width;
  final double? height;
  final double borderRadius;
  final double fontSize;
  final double verticalPadding;
  final bool isSaving;
  final bool isBorder;
  final Widget? icon;
  final double iconSpacing;

  const CommonButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height,
    this.borderRadius = 8.0,
    this.fontSize = 14.0,
    this.verticalPadding = 0.0,
    this.isSaving = false,
    this.isBorder = false,
    this.icon,
    this.iconSpacing = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isSaving;
    final Color finalBackgroundColor =
        backgroundColor ?? Theme.of(context).colorScheme.primary;

    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        height: height ?? 45,
        // Use provided height or default to 45.h
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey : finalBackgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: isBorder
              ? Border.all(
            color: AppColors.appBlack600,
            width: 0.5,
          )
              : null,
          boxShadow: isDisabled
              ? []
              : [
            BoxShadow(
              color: finalBackgroundColor.withValues(alpha: 0.3),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: isSaving
            ? SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            color: Theme.of(context).colorScheme.onPrimary,
            strokeWidth: 2,
          ),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min, // Keep content centered
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: iconSpacing),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
