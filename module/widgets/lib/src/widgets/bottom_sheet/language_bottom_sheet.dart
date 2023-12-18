import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/src/core/bottom_sheet_base.dart';
import 'package:widgets/src/utility/constants/language_constants.dart';

final class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
    required this.onTurkishTapped,
    required this.onEnglishTapped,
  });

  final VoidCallback onTurkishTapped;
  final VoidCallback onEnglishTapped;

  /// Show the dialog for page info
  static Future<void> show(
    BuildContext context, {
    required VoidCallback onTurkishTapped,
    required VoidCallback onEnglishTapped,
  }) async {
    await BottomSheetBase.show<void>(
      context: context,
      builder: (context) => LanguageBottomSheet(
        onTurkishTapped: onTurkishTapped,
        onEnglishTapped: onEnglishTapped,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .2.sh,
      width: 1.sw,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              onTurkishTapped();
              Navigator.of(context).pop();
            },
            title: const Text(LanguageConstants.turkish),
          ),
          ListTile(
            onTap: () {
              onEnglishTapped();
              Navigator.of(context).pop();
            },
            title: const Text(LanguageConstants.english),
          ),
        ],
      ),
    );
  }
}
