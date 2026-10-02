part of '../app.dart';

void _confirmDelete(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Delete your account?'),
      content: const Text(
        'This permanently removes your account, progress, bookmarks, and private data. This cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: AppColors.coral),
          onPressed: () {
            Navigator.pop(context);
            _notice(
              context,
              'Account deletion requires a final confirmation email.',
            );
          },
          child: const Text('Continue'),
        ),
      ],
    ),
  );
}
