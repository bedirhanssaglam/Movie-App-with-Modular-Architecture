import 'package:flutter/material.dart';
import 'package:widgets/src/core/dialog_base.dart';

/// Show a dialog
final class InfoDialog extends StatelessWidget {
  /// Constructor for dialog
  const InfoDialog({required this.title, super.key, required this.content});

  /// Title for the dialog
  final String title;

  final String content;

  /// Show the dialog for page info
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String content,
  }) async {
    await DialogBase.show<void>(
      context: context,
      builder: (context) => InfoDialog(title: title, content: content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: Text(title),
      content: Text(content),
      actions: [
        IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
