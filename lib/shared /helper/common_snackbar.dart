// lib/utils/common_widget/app_snack.dart
import 'dart:async';
import 'package:flutter/material.dart';

enum AppSnackType { success, error, warning ,info}

class AppSnack {
  AppSnack._();

  static void show(
    BuildContext context, {
    required AppSnackType type,
    required String title,
    String? subtitle,
    Duration duration = const Duration(seconds: 4),
    double topPadding = 10,
  }) {
    final theme = Theme.of(context);
    final p = _palette(type, theme);

    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (_) => _SnackWidget(
        title: title,
        subtitle: subtitle,
        palette: p,
        duration: duration,
        topPadding: topPadding,
        onDismissed: () {
          if (entry.mounted) entry.remove();
        },
      ),
    );

    overlay.insert(entry);
  }

  static _Palette _palette(AppSnackType type, ThemeData theme) {
    switch (type) {
      case AppSnackType.success:
        return const _Palette(
          fg: Color(0xFF1F8A4D),
          border: Color(0xFF70E1A5),
          bg: Color(0xFFF2FFF7),
          icon: Icons.check_circle,
        );
      case AppSnackType.error:
        return const _Palette(
          fg: Color(0xFFB3261E),
          border: Color(0xFFF2B8B5),
          bg: Color(0xFFFFF2F1),
          icon: Icons.error_outline,
        );
      case AppSnackType.warning:
        return const _Palette(
          fg: Color(0xFF9A5B00),
          border: Color(0xFFF6B722),
          bg: Color(0xFFF6E8B5),
          icon: Icons.warning_amber_rounded,
        );
      case AppSnackType.info:
        return const _Palette(
          fg: Color(0xFF075EBB),
          border: Color(0xFF8CC8FF),
          bg: Color(0xFFE8F3FF),
          icon: Icons.info_outline,
        );
    }
  }
}

class _SnackWidget extends StatefulWidget {
  final String title;
  final String? subtitle;
  final _Palette palette;
  final Duration duration;
  final double topPadding;
  final VoidCallback onDismissed;

  const _SnackWidget({
    required this.title,
    this.subtitle,
    required this.palette,
    required this.duration,
    required this.topPadding,
    required this.onDismissed,
  });

  @override
  State<_SnackWidget> createState() => _SnackWidgetState();
}

class _SnackWidgetState extends State<_SnackWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<Offset> _offset;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();

    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 220),
    );
    _offset = Tween(begin: const Offset(0, -1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.addStatusListener((s) {
      if (s == AnimationStatus.dismissed) {
        widget.onDismissed();
      }
    });

    _ctrl.forward();
    _hideTimer = Timer(widget.duration, () {
      if (mounted && _ctrl.status != AnimationStatus.dismissed) {
        _ctrl.reverse();
      }
    });
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned(
      top: MediaQuery.of(context).padding.top + widget.topPadding,
      left: 12,
      right: 12,
      child: SlideTransition(
        position: _offset,
        child: Material(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: widget.palette.bg,
              border: Border.all(color: widget.palette.border, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(widget.palette.icon, color: widget.palette.fg, size: 22),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: widget.palette.fg,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.subtitle != null &&
                          widget.subtitle!.trim().isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          widget.subtitle!,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.75),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Palette {
  final Color fg;
  final Color border;
  final Color bg;
  final IconData icon;

  const _Palette(
      {required this.fg,
      required this.border,
      required this.bg,
      required this.icon});
}
