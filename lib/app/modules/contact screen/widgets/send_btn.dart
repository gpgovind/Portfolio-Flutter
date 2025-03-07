import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? textColor;
  final FontWeight? textFontWeight;
  final double? fontSize;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final MainAxisSize? mainAxisSize;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.textColor,
    this.textFontWeight,
    this.fontSize,
    this.borderRadius,
    this.padding,
    this.leadingIcon,
    this.trailingIcon,
    this.mainAxisSize,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.95);
  void _onTapUp(_) => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final Color defaultBackgroundColor =
        widget.backgroundColor ?? colorScheme.primary;
    final Color defaultTextColor = widget.textColor ?? colorScheme.onPrimary;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: () => setState(() => _scale = 1.0),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            overlayColor: colorScheme.primary.withOpacity(0.1),
            backgroundColor: defaultBackgroundColor,
            padding: widget.padding ??
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: widget.mainAxisSize ?? MainAxisSize.max,
            children: [
              if (widget.leadingIcon != null) ...[
                widget.leadingIcon!,
                const SizedBox(width: 8.0),
              ],
              Text(
                widget.text,
                style: widget.textStyle ??
                    TextStyle(
                      color: defaultTextColor,
                      fontSize: widget.fontSize ?? 16.0,
                      fontWeight: widget.textFontWeight ?? FontWeight.w700,
                    ),
              ),
              if (widget.trailingIcon != null) ...[
                const SizedBox(width: 8.0),
                widget.trailingIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
