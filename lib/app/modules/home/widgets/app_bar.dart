import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function(String section) onMenuTap;

  const CustomAppBar({
    super.key,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      color: colorScheme.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Govind P',
                style: TextStyle(
                  color: colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _menuItem(context, 'Home'),
                    _menuItem(context, 'Work'),
                    _menuItem(context, 'About'),
                    _menuItem(context, 'Contact'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Divider(
            color: colorScheme.outline.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget _menuItem(BuildContext context, String label) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: _HoverAnimatedMenuItem(
        label: label,
        onTap: () => onMenuTap(label),
        activeColor: colorScheme.primary,
        textColor: colorScheme.onBackground,
      ),
    );
  }
}

class _HoverAnimatedMenuItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final Color activeColor;
  final Color textColor;

  const _HoverAnimatedMenuItem({
    required this.label,
    required this.onTap,
    required this.activeColor,
    required this.textColor,
  });

  @override
  State<_HoverAnimatedMenuItem> createState() => _HoverAnimatedMenuItemState();
}

class _HoverAnimatedMenuItemState extends State<_HoverAnimatedMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          transform: _isHovered
              ? (Matrix4.identity()..scale(1.1))
              : Matrix4.identity(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: _isHovered ? widget.activeColor : widget.textColor,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovered ? 20 : 0,
                color: widget.activeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
