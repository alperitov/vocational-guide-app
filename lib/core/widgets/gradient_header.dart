import 'package:flutter/material.dart';
import '../theme/light_theme.dart';

class GradientHeader extends StatelessWidget implements PreferredSizeWidget {
  const GradientHeader({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.bottom,
    this.height = kToolbarHeight,
  });

  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double height;

  @override
  Size get preferredSize =>
      Size.fromHeight(height + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: lightGradientHeader),
      child: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        title:
            titleWidget ??
            (title != null
                ? Text(
                    title!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  )
                : null),
        leading: leading,
        actions: actions,
        bottom: bottom,
      ),
    );
  }
}
