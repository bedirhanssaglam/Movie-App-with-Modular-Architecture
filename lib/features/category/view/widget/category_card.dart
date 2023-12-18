part of '../category_view.dart';

final class _CategoryCard extends StatelessWidget {
  const _CategoryCard({
    this.categoryName,
  });

  final String? categoryName;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const ProjectPadding.allMedium(),
        child: Center(
          child: Text(categoryName ?? ''),
        ),
      ),
    );
  }
}
