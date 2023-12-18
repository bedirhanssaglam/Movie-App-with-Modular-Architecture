part of '../details_view.dart';

final class _MovieOverviewRow extends StatelessWidget {
  const _MovieOverviewRow({
    required this.firstText,
    this.secondText,
  });

  final String firstText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const ProjectPadding.smallVertical(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LocalizeText(firstText),
          Text(
            secondText ?? '-',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
