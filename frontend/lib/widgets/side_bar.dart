part of '../app.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({required this.path, super.key});

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: AppColors.ink,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 20, 28),
              child: Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(
                      Icons.code_rounded,
                      color: AppColors.ink,
                      size: 21,
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Expanded(
                    child: Text(
                      'Python\nLearning Hub',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        height: 1.05,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 20, 10),
              child: Text(
                'LEARN',
                style: TextStyle(
                  color: Color(0xFF9BA9AF),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
            ),
            NavItem(
              icon: Icons.grid_view_rounded,
              label: 'Dashboard',
              path: '/app/dashboard',
              selected: path == '/app/dashboard',
            ),
            NavItem(
              icon: Icons.route_rounded,
              label: 'My progress',
              path: '/app/progress',
              selected: path == '/app/progress',
            ),
            NavItem(
              icon: Icons.bookmark_border_rounded,
              label: 'Bookmarks',
              path: '/app/bookmarks',
              selected: path == '/app/bookmarks',
            ),
            NavItem(
              icon: Icons.insights_rounded,
              label: 'Activity',
              path: '/app/activity',
              selected: path == '/app/activity',
            ),
            NavItem(
              icon: Icons.forum_outlined,
              label: 'My discussions',
              path: '/app/discussions',
              selected: path == '/app/discussions',
            ),
            NavItem(
              icon: Icons.chat_bubble_outline_rounded,
              label: 'Messages',
              path: '/app/messages',
              selected: path.startsWith('/app/messages'),
              badge: '2',
            ),
            NavItem(
              icon: Icons.notifications_none_rounded,
              label: 'Notifications',
              path: '/app/notifications',
              selected: path == '/app/notifications',
              badge: '4',
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 20, 10),
              child: Text(
                'WORKSPACE',
                style: TextStyle(
                  color: Color(0xFF9BA9AF),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
            ),
            NavItem(
              icon: Icons.admin_panel_settings_outlined,
              label: 'Admin overview',
              path: '/app/admin',
              selected: path == '/app/admin',
            ),
            NavItem(
              icon: Icons.article_outlined,
              label: 'Content',
              path: '/app/admin/content',
              selected: path == '/app/admin/content',
            ),
            NavItem(
              icon: Icons.account_tree_outlined,
              label: 'Roadmap',
              path: '/app/admin/roadmap',
              selected: path == '/app/admin/roadmap',
            ),
            NavItem(
              icon: Icons.people_outline_rounded,
              label: 'Users',
              path: '/app/admin/users',
              selected: path == '/app/admin/users',
            ),
            NavItem(
              icon: Icons.shield_outlined,
              label: 'Moderation',
              path: '/app/admin/moderation',
              selected: path == '/app/admin/moderation',
              badge: '6',
            ),
            NavItem(
              icon: Icons.bar_chart_rounded,
              label: 'Analytics',
              path: '/app/admin/analytics',
              selected: path == '/app/admin/analytics',
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.all(14),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: .08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 17,
                    backgroundColor: AppColors.coral,
                    child: Text(
                      'MC',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  const SizedBox(width: 9),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Maya Chen',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Administrator',
                          style: TextStyle(
                            color: Color(0xFFACBBC0),
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: 'Account settings',
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: Color(0xFFB9C5C9),
                      size: 17,
                    ),
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed('/app/profile'),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints.tightFor(
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
