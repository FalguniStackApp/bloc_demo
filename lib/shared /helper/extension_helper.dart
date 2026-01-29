import 'package:blocdemo/shared%20/helper/common_snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

extension SnackBar on String {
  Future<void> showSnack(
      BuildContext context, {
        required AppSnackType type,
        String? subtitle,
        Duration duration = const Duration(seconds: 4),
        double topPadding = 10,
      }) async {
    AppSnack.show(
      context,
      type: type,
      title: this,
      subtitle: subtitle,
      duration: duration,
      topPadding: topPadding,
    );
  }

  Future<void> showSuccess(
      BuildContext context, {
        String? subtitle,
        Duration duration = const Duration(seconds: 4),
        double topPadding = 10,
      }) async {
    AppSnack.show(
      context,
      type: AppSnackType.success,
      title: this,
      subtitle: subtitle,
      duration: duration,
      topPadding: topPadding,
    );
  }

  Future<void> showError(
      BuildContext context, {
        String? subtitle,
        Duration duration = const Duration(seconds: 4),
        double topPadding = 10,
      }) async {
    AppSnack.show(
      context,
      type: AppSnackType.error,
      title: this,
      subtitle: subtitle,
      duration: duration,
      topPadding: topPadding,
    );
  }

  Future<void> showWarning(
      BuildContext context, {
        String? subtitle,
        Duration duration = const Duration(seconds: 4),
        double topPadding = 10,
      }) async {
    AppSnack.show(
      context,
      type: AppSnackType.warning,
      title: this,
      subtitle: subtitle,
      duration: duration,
      topPadding: topPadding,
    );
  }

  void logs() {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 0)).d(this);
    }
  }

  void infoLogs() {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 0)).i(this);
    }
  }

  void traceLogs() {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 0)).t(this);
    }
  }

  void warningLogs() {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 0)).w(this);
    }
  }

  void errorLogs() {
    if (kDebugMode) {
      Logger(printer: PrettyPrinter(methodCount: 0)).e(this);
    }
  }
  
  Future<void> launchLink({LaunchMode mode = LaunchMode.inAppBrowserView}) async {
    final Uri? uri = Uri.tryParse(this);
    if (uri == null) throw Exception('Invalid URL: $this');

    final success = await launchUrl(uri, mode: mode);
    if (!success) throw Exception('Could not launch $this');
  }

  String toTwoDecimalFormatted() {
    if (trim().isEmpty) return '';

    final cleaned = replaceAll(',', '').trim();
    final value = double.tryParse(cleaned);
    if (value == null) return '';

    if (value == value.toInt()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(2);
  }

  Future<void> copyToClipboard(BuildContext context) async {
    Clipboard.setData(ClipboardData(text: this));
    'Copied to clipboard'.showSuccess(context);
  }

}
