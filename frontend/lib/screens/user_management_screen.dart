part of '../app.dart';

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            eyebrow: 'People & permissions',
            title: 'User management',
            subtitle:
                'Manage roles and account status with a clear audit trail.',
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search name or email',
                    prefixIcon: Icon(Icons.search_rounded, size: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded, size: 16),
                label: const Text('All roles'),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const SectionCard(
            child: Column(
              children: [
                _UserRow(
                  initials: 'MC',
                  name: 'Maya Chen',
                  email: 'maya.chen@example.com',
                  role: 'Administrator',
                  status: 'Active',
                  joined: 'Jan 12, 2026',
                  color: AppColors.coral,
                ),
                _UserRow(
                  initials: 'JM',
                  name: 'Jules Martin',
                  email: 'jules.martin@example.com',
                  role: 'Mentor',
                  status: 'Active',
                  joined: 'Feb 04, 2026',
                  color: AppColors.teal,
                ),
                _UserRow(
                  initials: 'NC',
                  name: 'Nadia Cole',
                  email: 'nadia.cole@example.com',
                  role: 'Learner',
                  status: 'Active',
                  joined: 'Mar 18, 2026',
                  color: AppColors.violet,
                ),
                _UserRow(
                  initials: 'AR',
                  name: 'Alex Rivera',
                  email: 'alex.rivera@example.com',
                  role: 'Learner',
                  status: 'Suspended',
                  joined: 'Apr 09, 2026',
                  color: AppColors.gold,
                ),
              ],
            ),
          ),
        ],
      );
}
