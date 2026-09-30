import 'package:flutter/material.dart';

void main() {
  runApp(const PythonLearningHubApp());
}

class AppColors {
  static const ink = Color(0xFF14232F);
  static const inkMuted = Color(0xFF61717D);
  static const canvas = Color(0xFFF6F8F7);
  static const surface = Color(0xFFFFFFFF);
  static const line = Color(0xFFE5EBE8);
  static const teal = Color(0xFF117C78);
  static const tealSoft = Color(0xFFE0F4EF);
  static const coral = Color(0xFFE86D59);
  static const coralSoft = Color(0xFFFFE9E3);
  static const gold = Color(0xFFE7AC3A);
  static const goldSoft = Color(0xFFFFF4D9);
  static const violet = Color(0xFF7565C8);
  static const violetSoft = Color(0xFFEEEAFE);
  static const blue = Color(0xFF3576C8);
  static const blueSoft = Color(0xFFE5F0FF);
}

class ApiConfig {
  static const baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://127.0.0.1:8000',
  );
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.canvas,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.teal,
        brightness: Brightness.light,
        surface: AppColors.surface,
      ).copyWith(
        primary: AppColors.teal,
        onPrimary: Colors.white,
        secondary: AppColors.coral,
        onSurface: AppColors.ink,
      ),
      textTheme: base.textTheme
          .apply(
            fontFamily: 'Arial',
            bodyColor: AppColors.ink,
            displayColor: AppColors.ink,
          )
          .copyWith(
            displayLarge: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
              letterSpacing: -1.2,
            ),
            headlineLarge: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.7,
            ),
            headlineSmall: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
            titleLarge: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
            titleMedium: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
            bodyLarge: const TextStyle(fontSize: 15, height: 1.45),
            bodyMedium: const TextStyle(fontSize: 13, height: 1.4),
            labelLarge: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.canvas,
        foregroundColor: AppColors.ink,
        elevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          side: BorderSide(color: AppColors.line),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.teal, width: 1.5),
        ),
        labelStyle: const TextStyle(color: AppColors.inkMuted),
      ),
      dividerColor: AppColors.line,
      chipTheme: base.chipTheme.copyWith(
        backgroundColor: AppColors.tealSoft,
        side: BorderSide.none,
        labelStyle: const TextStyle(
          color: AppColors.teal,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
    );
  }
}

class PythonLearningHubApp extends StatelessWidget {
  const PythonLearningHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Python Learning Hub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      initialRoute: '/app/dashboard',
      onGenerateRoute: _route,
    );
  }

  Route<dynamic> _route(RouteSettings settings) {
    final path = settings.name ?? '/app/dashboard';
    switch (path) {
      case '/app/login':
        return _page(const LoginScreen());
      case '/app/register':
        return _page(const RegisterScreen());
      case '/app/forgot-password':
      case '/app/reset-password':
        return _page(
          PasswordRecoveryScreen(reset: path == '/app/reset-password'),
        );
      case '/app/verify-email':
        return _page(const VerifyEmailScreen());
      case '/app/dashboard':
        return _shell(path, 'Dashboard', const DashboardScreen());
      case '/app/progress':
        return _shell(path, 'Progress', const ProgressScreen());
      case '/app/bookmarks':
        return _shell(path, 'Bookmarks', const BookmarksScreen());
      case '/app/activity':
        return _shell(path, 'Activity', const ActivityScreen());
      case '/app/profile':
        return _shell(path, 'Profile & settings', const ProfileScreen());
      case '/app/notifications':
        return _shell(path, 'Notifications', const NotificationsScreen());
      case '/app/messages':
        return _shell(path, 'Messages', const MessagesScreen());
      case '/app/messages/mentor-jules':
        return _shell(path, 'Messages', const ConversationScreen());
      case '/app/discussions':
        return _shell(path, 'My discussions', const DiscussionsScreen());
      case '/app/admin':
        return _shell(
          path,
          'Admin overview',
          const AdminDashboardScreen(),
          admin: true,
        );
      case '/app/admin/content':
        return _shell(
          path,
          'Content management',
          const ContentManagementScreen(),
          admin: true,
        );
      case '/app/admin/roadmap':
        return _shell(
          path,
          'Roadmap management',
          const RoadmapManagementScreen(),
          admin: true,
        );
      case '/app/admin/users':
        return _shell(
          path,
          'User management',
          const UserManagementScreen(),
          admin: true,
        );
      case '/app/admin/moderation':
        return _shell(
          path,
          'Moderation',
          const ModerationScreen(),
          admin: true,
        );
      case '/app/admin/analytics':
        return _shell(path, 'Analytics', const AnalyticsScreen(), admin: true);
      default:
        return _shell('/app/dashboard', 'Dashboard', const DashboardScreen());
    }
  }

  MaterialPageRoute<dynamic> _page(Widget child) =>
      MaterialPageRoute(builder: (_) => child);

  MaterialPageRoute<dynamic> _shell(
    String path,
    String title,
    Widget child, {
    bool admin = false,
  }) {
    return MaterialPageRoute(
      builder: (_) =>
          AppShell(path: path, title: title, child: child, admin: admin),
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({
    required this.path,
    required this.title,
    required this.child,
    this.admin = false,
    super.key,
  });

  final String path;
  final String title;
  final Widget child;
  final bool admin;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final desktop = constraints.maxWidth >= 1080;
        return Scaffold(
          drawer: desktop ? null : Drawer(child: _Sidebar(path: path)),
          appBar: desktop
              ? null
              : AppBar(
                  title: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  leading: Builder(
                    builder: (context) => IconButton(
                      tooltip: 'Open navigation',
                      icon: const Icon(Icons.menu_rounded),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                  actions: const [_TopBarAvatar()],
                ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (desktop) _Sidebar(path: path),
              Expanded(
                child: Column(
                  children: [
                    if (desktop) _DesktopTopBar(title: title),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.fromLTRB(
                          desktop ? 38 : 20,
                          desktop ? 32 : 20,
                          desktop ? 38 : 20,
                          40,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1380),
                          child: child,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Sidebar extends StatelessWidget {
  const _Sidebar({required this.path});

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
            _NavItem(
              icon: Icons.grid_view_rounded,
              label: 'Dashboard',
              path: '/app/dashboard',
              selected: path == '/app/dashboard',
            ),
            _NavItem(
              icon: Icons.route_rounded,
              label: 'My progress',
              path: '/app/progress',
              selected: path == '/app/progress',
            ),
            _NavItem(
              icon: Icons.bookmark_border_rounded,
              label: 'Bookmarks',
              path: '/app/bookmarks',
              selected: path == '/app/bookmarks',
            ),
            _NavItem(
              icon: Icons.insights_rounded,
              label: 'Activity',
              path: '/app/activity',
              selected: path == '/app/activity',
            ),
            _NavItem(
              icon: Icons.forum_outlined,
              label: 'My discussions',
              path: '/app/discussions',
              selected: path == '/app/discussions',
            ),
            _NavItem(
              icon: Icons.chat_bubble_outline_rounded,
              label: 'Messages',
              path: '/app/messages',
              selected: path.startsWith('/app/messages'),
              badge: '2',
            ),
            _NavItem(
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
            _NavItem(
              icon: Icons.admin_panel_settings_outlined,
              label: 'Admin overview',
              path: '/app/admin',
              selected: path == '/app/admin',
            ),
            _NavItem(
              icon: Icons.article_outlined,
              label: 'Content',
              path: '/app/admin/content',
              selected: path == '/app/admin/content',
            ),
            _NavItem(
              icon: Icons.account_tree_outlined,
              label: 'Roadmap',
              path: '/app/admin/roadmap',
              selected: path == '/app/admin/roadmap',
            ),
            _NavItem(
              icon: Icons.people_outline_rounded,
              label: 'Users',
              path: '/app/admin/users',
              selected: path == '/app/admin/users',
            ),
            _NavItem(
              icon: Icons.shield_outlined,
              label: 'Moderation',
              path: '/app/admin/moderation',
              selected: path == '/app/admin/moderation',
              badge: '6',
            ),
            _NavItem(
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
                color: Colors.white.withOpacity(.08),
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.path,
    required this.selected,
    this.badge,
  });

  final IconData icon;
  final String label;
  final String path;
  final bool selected;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushReplacementNamed(path),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white.withOpacity(.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 19,
              color: selected ? AppColors.gold : const Color(0xFFB3C0C4),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: selected ? Colors.white : const Color(0xFFB3C0C4),
                  fontSize: 12.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: selected ? AppColors.coral : const Color(0xFF344852),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _DesktopTopBar extends StatelessWidget {
  const _DesktopTopBar({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 38),
      decoration: const BoxDecoration(
        color: AppColors.canvas,
        border: Border(bottom: BorderSide(color: AppColors.line)),
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          SizedBox(
            width: 235,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your hub',
                prefixIcon: const Icon(Icons.search_rounded, size: 19),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: const BorderSide(color: AppColors.line),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: AppColors.inkMuted,
            ),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed('/app/notifications'),
          ),
          const SizedBox(width: 8),
          const _TopBarAvatar(),
        ],
      ),
    );
  }
}

class _TopBarAvatar extends StatelessWidget {
  const _TopBarAvatar();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      tooltip: 'Account menu',
      offset: const Offset(0, 44),
      onSelected: (value) {
        if (value == 'profile')
          Navigator.of(context).pushReplacementNamed('/app/profile');
        if (value == 'signout')
          Navigator.of(context).pushReplacementNamed('/app/login');
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'profile', child: Text('Profile & settings')),
        PopupMenuItem(value: 'signout', child: Text('Sign out')),
      ],
      child: const CircleAvatar(
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
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    this.actions,
    super.key,
  });
  final String eyebrow;
  final String title;
  final String subtitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.teal,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(title, style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 7),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppColors.inkMuted,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (actions != null) ...[
            const SizedBox(width: 20),
            Wrap(spacing: 10, runSpacing: 8, children: actions!),
          ],
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({
    required this.child,
    this.padding = const EdgeInsets.all(22),
    super.key,
  });
  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(padding: padding, child: child),
      );
}

class StatCard extends StatelessWidget {
  const StatCard({
    required this.label,
    required this.value,
    required this.caption,
    required this.icon,
    required this.color,
    super.key,
  });
  final String label;
  final String value;
  final String caption;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact =
            constraints.maxWidth < 190 || constraints.maxHeight < 150;
        return SectionCard(
          padding: EdgeInsets.all(compact ? 9 : 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    width: compact ? 27 : 34,
                    height: compact ? 27 : 34,
                    decoration: BoxDecoration(
                      color: color.withOpacity(.13),
                      borderRadius: BorderRadius.circular(compact ? 8 : 10),
                    ),
                    child: Icon(icon, color: color, size: compact ? 15 : 18),
                  ),
                  const Spacer(),
                  if (!compact)
                    const Icon(
                      Icons.more_horiz_rounded,
                      color: AppColors.inkMuted,
                      size: 18,
                    ),
                ],
              ),
              SizedBox(height: compact ? 4 : 20),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 19 : 26,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -.7,
                ),
              ),
              SizedBox(height: compact ? 0 : 3),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 10 : 12,
                  color: AppColors.inkMuted,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: compact ? 2 : 11),
              Text(
                caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: compact ? 8 : 11,
                  color: color,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class StatusPill extends StatelessWidget {
  const StatusPill(
    this.label, {
    this.color = AppColors.teal,
    this.background,
    super.key,
  });
  final String label;
  final Color color;
  final Color? background;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
        decoration: BoxDecoration(
          color: background ?? color.withOpacity(.11),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
              color: color, fontSize: 10, fontWeight: FontWeight.w800),
        ),
      );
}

class MiniProgress extends StatelessWidget {
  const MiniProgress({
    required this.value,
    this.color = AppColors.teal,
    super.key,
  });
  final double value;
  final Color color;

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: value,
          minHeight: 7,
          backgroundColor: AppColors.line,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      );
}

class AdaptiveStatGrid extends StatelessWidget {
  const AdaptiveStatGrid({
    required this.children,
    required this.childAspectRatio,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.shrinkWrap,
    required this.physics,
    super.key,
  });

  final List<Widget> children;
  final double childAspectRatio;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth < 560 ? 2 : 4;
          final ratio = constraints.maxWidth < 560
              ? childAspectRatio * .7
              : childAspectRatio;
          return GridView.count(
            crossAxisCount: columns,
            childAspectRatio: ratio,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            shrinkWrap: shrinkWrap,
            physics: physics,
            children: children,
          );
        },
      );
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 780;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              eyebrow: 'Thursday, October 1, 2026',
              title: 'Good morning, Maya',
              subtitle:
                  'A little progress today compounds into a lot of confidence.',
              actions: [
                FilledButton.icon(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/app/progress'),
                  icon: const Icon(Icons.route_rounded, size: 16),
                  label: const Text('View roadmap'),
                ),
              ],
            ),
            SectionCard(
              padding: EdgeInsets.zero,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF163845), Color(0xFF176D6B)],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const StatusPill(
                            'CONTINUE LEARNING',
                            color: AppColors.gold,
                            background: Color(0x3048D5C1),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'Functions & return values',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 7),
                          const Text(
                            'Turn a sequence of steps into a reusable building block.',
                            style: TextStyle(
                              color: Color(0xCDE7F1EE),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 19),
                          SizedBox(
                            width: 190,
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                backgroundColor: AppColors.gold,
                                foregroundColor: AppColors.ink,
                              ),
                              onPressed: () => _notice(
                                context,
                                'Opening the canonical topic page…',
                              ),
                              child: const Text('Continue topic'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!compact) const SizedBox(width: 50),
                    if (!compact)
                      SizedBox(
                        width: 160,
                        height: 160,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 132,
                              height: 132,
                              child: CircularProgressIndicator(
                                value: .68,
                                strokeWidth: 11,
                                backgroundColor: Colors.white.withOpacity(.16),
                                valueColor: const AlwaysStoppedAnimation(
                                  AppColors.gold,
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '68%',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'complete',
                                  style: TextStyle(
                                    color: Color(0xCDE7F1EE),
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: compact ? 2 : 4,
              childAspectRatio: compact ? .82 : 1.2,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                StatCard(
                  label: 'Topics completed',
                  value: '24',
                  caption: '+3 this month',
                  icon: Icons.check_circle_outline_rounded,
                  color: AppColors.teal,
                ),
                StatCard(
                  label: 'Current streak',
                  value: '12 days',
                  caption: 'Personal best: 18',
                  icon: Icons.local_fire_department_outlined,
                  color: AppColors.coral,
                ),
                StatCard(
                  label: 'Roadmap progress',
                  value: '42%',
                  caption: 'Core Python stage',
                  icon: Icons.route_outlined,
                  color: AppColors.violet,
                ),
                StatCard(
                  label: 'Saved for later',
                  value: '18',
                  caption: '4 tutorials · 3 guides',
                  icon: Icons.bookmark_border_rounded,
                  color: AppColors.gold,
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (compact) ...[
              _ActivityCard(),
              const SizedBox(height: 16),
              _NextStepsCard(),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 3, child: _ActivityCard()),
                  const SizedBox(width: 18),
                  const Expanded(flex: 2, child: _NextStepsCard()),
                ],
              ),
            const SizedBox(height: 20),
            if (compact)
              _RecentCard()
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: _RecentCard()),
                  const SizedBox(width: 18),
                  const Expanded(child: _NotificationsPreview()),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _ActivityCard extends StatelessWidget {
  const _ActivityCard();
  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(title: 'Learning activity', action: 'View activity'),
          const SizedBox(height: 24),
          SizedBox(
            height: 160,
            child: CustomPaint(painter: _ActivityPainter()),
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Mon', style: _TinyLabel.style),
              Text('Tue', style: _TinyLabel.style),
              Text('Wed', style: _TinyLabel.style),
              Text('Thu', style: _TinyLabel.style),
              Text('Fri', style: _TinyLabel.style),
              Text('Sat', style: _TinyLabel.style),
              Text('Sun', style: _TinyLabel.style),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActivityPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.line
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++) {
      final y = i * size.height / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final line = Paint()
      ..color = AppColors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    final points = [
      Offset(0, size.height * .7),
      Offset(size.width * .15, size.height * .57),
      Offset(size.width * .29, size.height * .65),
      Offset(size.width * .44, size.height * .25),
      Offset(size.width * .58, size.height * .47),
      Offset(size.width * .73, size.height * .3),
      Offset(size.width * .87, size.height * .37),
      Offset(size.width, size.height * .12),
    ];
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++)
      path.lineTo(points[i].dx, points[i].dy);
    canvas.drawPath(path, line);
    final dots = Paint()..color = AppColors.coral;
    for (final point in points) canvas.drawCircle(point, 4, dots);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _NextStepsCard extends StatelessWidget {
  const _NextStepsCard();
  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(title: 'Your next steps', action: 'See roadmap'),
          const SizedBox(height: 18),
          _StepItem(
            number: '01',
            title: 'Finish functions',
            subtitle: '2 lessons remaining',
            color: AppColors.teal,
          ),
          _StepItem(
            number: '02',
            title: 'Start collections',
            subtitle: 'Prerequisite unlocked',
            color: AppColors.violet,
          ),
          _StepItem(
            number: '03',
            title: 'Try a small project',
            subtitle: 'Recommended for you',
            color: AppColors.coral,
          ),
        ],
      ),
    );
  }
}

class _StepItem extends StatelessWidget {
  const _StepItem({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final String number;
  final String title;
  final String subtitle;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                number,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 11),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.inkMuted,
              size: 19,
            ),
          ],
        ),
      );
}

class _RecentCard extends StatelessWidget {
  const _RecentCard();
  @override
  Widget build(BuildContext context) {
    return SectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _CardTitle(title: 'Recently saved', action: 'All bookmarks'),
          const SizedBox(height: 15),
          _SavedRow(
            icon: Icons.article_outlined,
            title: 'List comprehensions',
            type: 'Topic · Core Python',
            color: AppColors.teal,
          ),
          _SavedRow(
            icon: Icons.layers_outlined,
            title: 'Build a CLI weather app',
            type: 'Tutorial · 35 min',
            color: AppColors.coral,
          ),
          _SavedRow(
            icon: Icons.menu_book_outlined,
            title: 'Testing with pytest',
            type: 'Guide · Testing',
            color: AppColors.violet,
          ),
        ],
      ),
    );
  }
}

class _SavedRow extends StatelessWidget {
  const _SavedRow({
    required this.icon,
    required this.title,
    required this.type,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String type;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withOpacity(.11),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, size: 18, color: color),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    type,
                    style: const TextStyle(
                        fontSize: 11, color: AppColors.inkMuted),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.open_in_new_rounded,
              color: AppColors.inkMuted,
              size: 16,
            ),
          ],
        ),
      );
}

class _NotificationsPreview extends StatelessWidget {
  const _NotificationsPreview();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Recent notifications', action: 'View all'),
            const SizedBox(height: 15),
            _NotificationRow(
              icon: Icons.reply_rounded,
              title: 'Jules replied to your discussion',
              time: '12 min ago',
              color: AppColors.teal,
            ),
            _NotificationRow(
              icon: Icons.emoji_events_outlined,
              title: 'You reached a 12 day streak',
              time: 'Yesterday',
              color: AppColors.gold,
            ),
            _NotificationRow(
              icon: Icons.auto_awesome_outlined,
              title: 'A new guide matches your path',
              time: '2 days ago',
              color: AppColors.violet,
            ),
          ],
        ),
      );
}

class _NotificationRow extends StatelessWidget {
  const _NotificationRow({
    required this.icon,
    required this.title,
    required this.time,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String time;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.inkMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class _CardTitle extends StatelessWidget {
  const _CardTitle({required this.title, required this.action});
  final String title;
  final String action;
  @override
  Widget build(BuildContext context) => Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          Text(
            action,
            style: const TextStyle(
              color: AppColors.teal,
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      );
}

class _TinyLabel {
  static const style = TextStyle(
    color: AppColors.inkMuted,
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
}

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final stages = [
      _RoadmapStage(
        title: 'Orientation & setup',
        subtitle: 'Getting comfortable with the tools',
        progress: .96,
        count: '6 / 6',
        color: AppColors.teal,
        topics: [
          'What is programming?',
          'Install Python',
          'Your first program',
        ],
      ),
      _RoadmapStage(
        title: 'Python fundamentals',
        subtitle: 'The building blocks of every program',
        progress: .72,
        count: '13 / 18',
        color: AppColors.coral,
        topics: [
          'Variables & values',
          'Control flow',
          'Functions & return values',
        ],
      ),
      _RoadmapStage(
        title: 'Core data structures',
        subtitle: 'Modeling and transforming information',
        progress: .18,
        count: '2 / 11',
        color: AppColors.violet,
        topics: ['Lists & tuples', 'Dictionaries', 'Comprehensions'],
      ),
      _RoadmapStage(
        title: 'Reusable Python programs',
        subtitle: 'Build robust, maintainable tools',
        progress: 0,
        count: '0 / 14',
        color: AppColors.gold,
        topics: ['Modules & imports', 'Exceptions', 'Files & paths'],
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          eyebrow: 'Your learning path',
          title: 'Progress',
          subtitle:
              'A private view of your journey through the Python roadmap.',
          actions: [
            OutlinedButton.icon(
              onPressed: () => _notice(context, 'Progress refreshed'),
              icon: const Icon(Icons.refresh_rounded, size: 16),
              label: const Text('Refresh'),
            ),
          ],
        ),
        SectionCard(
          child: Row(
            children: [
              SizedBox(
                width: 102,
                height: 102,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: .42,
                      strokeWidth: 10,
                      backgroundColor: AppColors.line,
                      valueColor: const AlwaysStoppedAnimation(AppColors.teal),
                    ),
                    const Text(
                      '42%',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 25),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You are building a strong foundation.',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      '24 topics completed across 2 stages. Keep your 12-day streak going with one focused lesson today.',
                      style: TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 13,
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: 13),
                    Wrap(
                      spacing: 20,
                      runSpacing: 8,
                      children: [
                        Text(
                          '24 completed',
                          style: TextStyle(
                            color: AppColors.teal,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '5 in progress',
                          style: TextStyle(
                            color: AppColors.coral,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          '28 not started',
                          style: TextStyle(
                            color: AppColors.inkMuted,
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),
        Row(
          children: [
            Text(
              'Roadmap stages',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.tune_rounded, size: 16),
              label: const Text('Filter'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...stages.map(
          (stage) =>
              Padding(padding: const EdgeInsets.only(bottom: 12), child: stage),
        ),
        const SizedBox(height: 8),
        SectionCard(
          child: Row(
            children: [
              const Icon(
                Icons.info_outline_rounded,
                color: AppColors.inkMuted,
                size: 18,
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'Completion is recorded when the API confirms a topic is finished. Every node links back to its canonical public lesson.',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
              ),
              TextButton(
                onPressed: () => _notice(context, 'Opening public roadmap…'),
                child: const Text('Public roadmap'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RoadmapStage extends StatelessWidget {
  const _RoadmapStage({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.count,
    required this.color,
    required this.topics,
  });
  final String title;
  final String subtitle;
  final double progress;
  final String count;
  final Color color;
  final List<String> topics;
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.12),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Icon(Icons.layers_outlined, color: color, size: 19),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: AppColors.inkMuted,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  count,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            MiniProgress(value: progress, color: color),
            const SizedBox(height: 16),
            Row(
              children: topics
                  .map(
                    (topic) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: InkWell(
                          onTap: () => _notice(context, 'Opening $topic…'),
                          child: Container(
                            padding: const EdgeInsets.all(11),
                            decoration: BoxDecoration(
                              color: AppColors.canvas,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  progress > 0
                                      ? Icons.check_circle_rounded
                                      : Icons.lock_outline_rounded,
                                  size: 15,
                                  color:
                                      progress > 0 ? color : AppColors.inkMuted,
                                ),
                                const SizedBox(width: 7),
                                Expanded(
                                  child: Text(
                                    topic,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
}

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PageHeader(
          eyebrow: 'Your library',
          title: 'Bookmarks',
          subtitle:
              'Keep the ideas, guides, and projects you want to return to close by.',
          actions: [
            FilledButton.icon(
              onPressed: () => _notice(
                context,
                'Use the bookmark control on any public lesson to save it here.',
              ),
              icon: const Icon(Icons.add_rounded, size: 16),
              label: const Text('How to save'),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search bookmarks',
                  prefixIcon: Icon(Icons.search_rounded, size: 19),
                ),
              ),
            ),
            const SizedBox(width: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.filter_list_rounded, size: 17),
              label: const Text('All types'),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 8,
          children: const [
            StatusPill('All · 18', color: AppColors.teal),
            StatusPill(
              'Topics · 11',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
            StatusPill(
              'Tutorials · 4',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
            StatusPill(
              'Guides · 3',
              color: AppColors.inkMuted,
              background: AppColors.surface,
            ),
          ],
        ),
        const SizedBox(height: 14),
        SectionCard(
          child: Column(
            children: [
              _BookmarkRow(
                icon: Icons.article_outlined,
                title: 'List comprehensions',
                summary: 'Write concise transformations over iterable data.',
                type: 'Topic',
                category: 'Core Python',
                saved: 'Saved today',
                color: AppColors.teal,
              ),
              _BookmarkRow(
                icon: Icons.layers_outlined,
                title: 'Build a CLI weather app',
                summary: 'A practical project with APIs, parsing, and tests.',
                type: 'Tutorial',
                category: 'Projects',
                saved: 'Saved Sep 28',
                color: AppColors.coral,
              ),
              _BookmarkRow(
                icon: Icons.menu_book_outlined,
                title: 'Testing with pytest',
                summary: 'A friendly introduction to reliable Python tests.',
                type: 'Guide',
                category: 'Testing',
                saved: 'Saved Sep 22',
                color: AppColors.violet,
              ),
              _BookmarkRow(
                icon: Icons.article_outlined,
                title: 'Exceptions & error handling',
                summary: 'Handle expected failures without hiding real bugs.',
                type: 'Topic',
                category: 'Core Python',
                saved: 'Saved Sep 18',
                color: AppColors.teal,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BookmarkRow extends StatelessWidget {
  const _BookmarkRow({
    required this.icon,
    required this.title,
    required this.summary,
    required this.type,
    required this.category,
    required this.saved,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String summary;
  final String type;
  final String category;
  final String saved;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color.withOpacity(.11),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(type, color: color),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    summary,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 12),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '$category  ·  $saved',
                    style: const TextStyle(
                      color: AppColors.inkMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Remove bookmark',
              icon: const Icon(Icons.bookmark_rounded, color: AppColors.gold),
              onPressed: () => _notice(context, 'Bookmark removed'),
            ),
          ],
        ),
      );
}

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Your learning signals',
            title: 'Activity & statistics',
            subtitle:
                'See what is helping you move forward, privately and at your own pace.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.date_range_rounded, size: 16),
                label: const Text('Last 30 days'),
              ),
            ],
          ),
          AdaptiveStatGrid(
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.25,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(
                label: 'Study sessions',
                value: '18',
                caption: '+5 from last month',
                icon: Icons.timer_outlined,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Longest streak',
                value: '18 days',
                caption: 'Keep it going',
                icon: Icons.local_fire_department_outlined,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Topics this month',
                value: '9',
                caption: 'Above your average',
                icon: Icons.auto_graph_rounded,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'Avg. session',
                value: '24 min',
                caption: 'A sustainable pace',
                icon: Icons.schedule_rounded,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? Column(
                    children: [
                      const _StudyChart(),
                      const SizedBox(height: 16),
                      const _CategoryBreakdown(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _StudyChart()),
                      SizedBox(width: 18),
                      Expanded(child: _CategoryBreakdown()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const _HistoryCard(),
        ],
      );
}

class _StudyChart extends StatelessWidget {
  const _StudyChart();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Study time', action: 'By week'),
            const SizedBox(height: 20),
            SizedBox(height: 180, child: CustomPaint(painter: _BarPainter())),
            const SizedBox(height: 12),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('W1', style: _TinyLabel.style),
                Text('W2', style: _TinyLabel.style),
                Text('W3', style: _TinyLabel.style),
                Text('W4', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}

class _BarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final values = [
      0.38,
      0.54,
      0.43,
      0.74,
      0.66,
      0.91,
      0.6,
      0.82,
      0.5,
      0.72,
      0.94,
      0.78,
      0.9,
      0.62,
    ];
    final gap = 8.0;
    final width = (size.width - gap * (values.length - 1)) / values.length;
    for (var i = 0; i < values.length; i++) {
      final height = size.height * values[i];
      final paint = Paint()
        ..color = i > 9 ? AppColors.teal : AppColors.teal.withOpacity(.25);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(i * (width + gap), size.height - height, width, height),
          const Radius.circular(5),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CategoryBreakdown extends StatelessWidget {
  const _CategoryBreakdown();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'By category', action: 'View progress'),
            const SizedBox(height: 22),
            _BreakdownRow(
              label: 'Core Python',
              value: '68%',
              progress: .68,
              color: AppColors.teal,
            ),
            _BreakdownRow(
              label: 'Web development',
              value: '34%',
              progress: .34,
              color: AppColors.coral,
            ),
            _BreakdownRow(
              label: 'Data & science',
              value: '22%',
              progress: .22,
              color: AppColors.violet,
            ),
            _BreakdownRow(
              label: 'Testing',
              value: '17%',
              progress: .17,
              color: AppColors.gold,
            ),
          ],
        ),
      );
}

class _BreakdownRow extends StatelessWidget {
  const _BreakdownRow({
    required this.label,
    required this.value,
    required this.progress,
    required this.color,
  });
  final String label;
  final String value;
  final double progress;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                Text(
                  value,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            MiniProgress(value: progress, color: color),
          ],
        ),
      );
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Recent activity', action: 'Export data'),
            const SizedBox(height: 12),
            _HistoryRow(
              icon: Icons.check_circle_rounded,
              title: 'Completed “Functions & return values”',
              meta: 'Today · Core Python',
              color: AppColors.teal,
            ),
            _HistoryRow(
              icon: Icons.bookmark_rounded,
              title: 'Saved “Testing with pytest”',
              meta: 'Yesterday · Guide',
              color: AppColors.gold,
            ),
            _HistoryRow(
              icon: Icons.forum_rounded,
              title: 'Replied to “When should I use a tuple?”',
              meta: 'Sep 28 · Discussion',
              color: AppColors.violet,
            ),
          ],
        ),
      );
}

class _HistoryRow extends StatelessWidget {
  const _HistoryRow({
    required this.icon,
    required this.title,
    required this.meta,
    required this.color,
  });
  final IconData icon;
  final String title;
  final String meta;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: color, size: 19),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    meta,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.inkMuted,
              size: 18,
            ),
          ],
        ),
      );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Account',
            title: 'Profile & settings',
            subtitle: 'Manage how Python Learning Hub works for you.',
          ),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? Column(
                    children: [
                      const _ProfileCard(),
                      const SizedBox(height: 16),
                      const _PreferencesCard(),
                      const SizedBox(height: 16),
                      _SecurityCard(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(child: _ProfileCard()),
                      const SizedBox(width: 18),
                      Expanded(
                        child: Column(
                          children: [
                            const _PreferencesCard(),
                            const SizedBox(height: 16),
                            _SecurityCard(),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      );
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal details',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const CircleAvatar(
                  radius: 31,
                  backgroundColor: AppColors.coral,
                  child: Text(
                    'MC',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Maya Chen',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Learner · Administrator',
                      style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                    ),
                    const SizedBox(height: 9),
                    TextButton(
                      onPressed: () => _notice(
                        context,
                        'Avatar upload is ready to connect to /api/v1/users/me/avatar.',
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      child: const Text('Change photo'),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 22),
            TextFormField(
              initialValue: 'Maya Chen',
              decoration: InputDecoration(labelText: 'Display name'),
            ),
            const SizedBox(height: 14),
            TextFormField(
              initialValue: 'maya.chen@example.com',
              decoration: InputDecoration(
                labelText: 'Email address',
                suffixIcon: Icon(Icons.verified_rounded, color: AppColors.teal),
              ),
            ),
            const SizedBox(height: 14),
            TextFormField(
              initialValue: 'Learning in public, one small project at a time.',
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Bio (optional)'),
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () => _notice(context, 'Profile saved'),
                child: const Text('Save changes'),
              ),
            ),
          ],
        ),
      );
}

class _PreferencesCard extends StatelessWidget {
  const _PreferencesCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text(
                'Learning reminders',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'A gentle nudge to keep your streak alive.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: true,
              onChanged: (_) {},
              title: const Text(
                'Discussion updates',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'Replies and mentions from conversations you follow.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              value: false,
              onChanged: (_) {},
              title: const Text(
                'Product news',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'Occasional notes about new learning content.',
                style: TextStyle(fontSize: 11, color: AppColors.inkMuted),
              ),
            ),
          ],
        ),
      );
}

class _SecurityCard extends StatelessWidget {
  const _SecurityCard();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Security & account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 13),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.teal,
              ),
              title: const Text(
                'Change password',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'Last changed 3 months ago',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.inkMuted,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.email_outlined, color: AppColors.teal),
              title: const Text(
                'Email verified',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              subtitle: const Text(
                'maya.chen@example.com',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              trailing: const StatusPill('Verified', color: AppColors.teal),
            ),
            const Divider(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.delete_outline_rounded,
                color: AppColors.coral,
              ),
              title: const Text(
                'Delete account',
                style: TextStyle(
                  color: AppColors.coral,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                'This action cannot be undone.',
                style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
              ),
              onTap: () => _confirmDelete(context),
            ),
          ],
        ),
      );
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Stay in the loop',
            title: 'Notifications',
            subtitle:
                'Replies, milestones, and updates that matter to your learning.',
            actions: [
              TextButton(
                onPressed: () =>
                    _notice(context, 'All notifications marked as read'),
                child: const Text('Mark all as read'),
              ),
            ],
          ),
          Row(
            children: [
              const StatusPill('All · 12', color: AppColors.teal),
              const SizedBox(width: 8),
              const StatusPill(
                'Unread · 4',
                color: AppColors.coral,
                background: AppColors.coralSoft,
              ),
              const SizedBox(width: 8),
              const StatusPill(
                'Mentions · 3',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 15),
          SectionCard(
            child: Column(
              children: [
                _FullNotification(
                  icon: Icons.reply_rounded,
                  title: 'Jules replied to your discussion',
                  body:
                      '“A good rule is to use tuples when the shape of your data should not change.”',
                  time: '12 min ago',
                  color: AppColors.teal,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.alternate_email_rounded,
                  title: 'You were mentioned in a discussion',
                  body:
                      'Nadia mentioned you in “How I structure my first Python project”.',
                  time: '2 hours ago',
                  color: AppColors.violet,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.emoji_events_outlined,
                  title: 'You reached a 12 day learning streak',
                  body: 'Nice work. Your personal best is 18 days.',
                  time: 'Yesterday',
                  color: AppColors.gold,
                  unread: true,
                ),
                _FullNotification(
                  icon: Icons.auto_awesome_outlined,
                  title: 'A new guide matches your path',
                  body:
                      '“Testing with pytest” is a great next step after your recent topics.',
                  time: '2 days ago',
                  color: AppColors.coral,
                  unread: false,
                ),
              ],
            ),
          ),
        ],
      );
}

class _FullNotification extends StatelessWidget {
  const _FullNotification({
    required this.icon,
    required this.title,
    required this.body,
    required this.time,
    required this.color,
    required this.unread,
  });
  final IconData icon;
  final String title;
  final String body;
  final String time;
  final Color color;
  final bool unread;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight:
                                unread ? FontWeight.w800 : FontWeight.w600,
                          ),
                        ),
                      ),
                      if (unread)
                        const StatusPill(
                          'NEW',
                          color: AppColors.coral,
                          background: AppColors.coralSoft,
                        ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    body,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.inkMuted,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    time,
                    style: const TextStyle(
                        fontSize: 10, color: AppColors.inkMuted),
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: 'Mark as read',
              icon: Icon(
                unread
                    ? Icons.circle_outlined
                    : Icons.check_circle_outline_rounded,
                size: 18,
                color: unread ? AppColors.teal : AppColors.inkMuted,
              ),
              onPressed: () => _notice(context, 'Notification state updated'),
            ),
          ],
        ),
      );
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Private conversations',
            title: 'Messages',
            subtitle:
                'Talk through tricky ideas with your mentors and learning groups.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'New conversation flow'),
                icon: const Icon(Icons.edit_rounded, size: 16),
                label: const Text('New message'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search conversations',
                    prefixIcon: Icon(Icons.search_rounded, size: 19),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded, size: 17),
                label: const Text('All'),
              ),
            ],
          ),
          const SizedBox(height: 17),
          SectionCard(
            child: Column(
              children: [
                _ConversationRow(
                  name: 'Jules Martin',
                  preview: 'Try writing the test before changing the function.',
                  time: '12 min',
                  initials: 'JM',
                  color: AppColors.coral,
                  unread: 2,
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed('/app/messages/mentor-jules'),
                ),
                _ConversationRow(
                  name: 'Python Study Circle',
                  preview: 'Nadia: Has anyone tried the new data guide?',
                  time: '2 h',
                  initials: 'PS',
                  color: AppColors.teal,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening group conversation…'),
                ),
                _ConversationRow(
                  name: 'Alex Rivera',
                  preview: 'The async example made it click. Thanks!',
                  time: 'Yesterday',
                  initials: 'AR',
                  color: AppColors.violet,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening conversation…'),
                ),
                _ConversationRow(
                  name: 'Project accountability',
                  preview: 'Your weekly check-in is due tomorrow.',
                  time: 'Sep 27',
                  initials: 'PA',
                  color: AppColors.gold,
                  unread: 0,
                  onTap: () => _notice(context, 'Opening group conversation…'),
                ),
              ],
            ),
          ),
        ],
      );
}

class _ConversationRow extends StatelessWidget {
  const _ConversationRow({
    required this.name,
    required this.preview,
    required this.time,
    required this.initials,
    required this.color,
    required this.unread,
    required this.onTap,
  });
  final String name;
  final String preview;
  final String time;
  final String initials;
  final Color color;
  final int unread;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: color.withOpacity(.15),
                    child: Text(
                      initials,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  if (unread > 0)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: AppColors.coral,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            '$unread',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 7,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          time,
                          style: const TextStyle(
                            color: AppColors.inkMuted,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      preview,
                      style: TextStyle(
                        color: unread > 0 ? AppColors.ink : AppColors.inkMuted,
                        fontSize: 12,
                        fontWeight:
                            unread > 0 ? FontWeight.w600 : FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.inkMuted,
                size: 18,
              ),
            ],
          ),
        ),
      );
}

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final controller = TextEditingController();
  final messages = <Map<String, String>>[
    {
      'sender': 'Jules Martin',
      'body': 'Hey Maya! How is the functions lesson landing?',
      'time': '11:42 AM',
    },
    {
      'sender': 'Maya Chen',
      'body':
          'The idea is clear, but I keep reaching for global variables in my examples.',
      'time': '11:44 AM',
    },
    {
      'sender': 'Jules Martin',
      'body':
          'That is a useful signal. Try passing the value into the function instead. Small boundary, much easier to test.',
      'time': '11:47 AM',
    },
    {
      'sender': 'Maya Chen',
      'body':
          'That helped. I can see the inputs and outputs much more clearly now.',
      'time': '11:51 AM',
    },
  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                tooltip: 'Back to messages',
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/app/messages'),
              ),
              const SizedBox(width: 5),
              const CircleAvatar(
                radius: 21,
                backgroundColor: AppColors.coralSoft,
                child: Text(
                  'JM',
                  style: TextStyle(
                    color: AppColors.coral,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jules Martin',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Mentor · active now',
                    style: TextStyle(
                      color: AppColors.teal,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Conversation options',
                icon: const Icon(Icons.more_horiz_rounded),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          SectionCard(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 520,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(22),
                      children: [
                        const Center(
                          child: StatusPill(
                            'TODAY',
                            color: AppColors.inkMuted,
                            background: AppColors.canvas,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ...messages.map((message) {
                          final mine = message['sender'] == 'Maya Chen';
                          return Align(
                            alignment: mine
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 520),
                                child: Column(
                                  crossAxisAlignment: mine
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: mine
                                            ? AppColors.teal
                                            : AppColors.canvas,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(15),
                                          topRight: const Radius.circular(15),
                                          bottomLeft: Radius.circular(
                                            mine ? 15 : 4,
                                          ),
                                          bottomRight: Radius.circular(
                                            mine ? 4 : 15,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        message['body']!,
                                        style: TextStyle(
                                          color: mine
                                              ? Colors.white
                                              : AppColors.ink,
                                          fontSize: 13,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${message['sender']} · ${message['time']}',
                                      style: const TextStyle(
                                        color: AppColors.inkMuted,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: AppColors.line)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: 'Add attachment',
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.inkMuted,
                          ),
                          onPressed: () => _notice(
                            context,
                            'Attachments are available when secure media upload is enabled.',
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: 'Write a message…',
                              fillColor: AppColors.canvas,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Send message',
                          icon: const Icon(
                            Icons.send_rounded,
                            color: AppColors.teal,
                          ),
                          onPressed: () {
                            if (controller.text.trim().isNotEmpty) {
                              setState(() {
                                messages.add({
                                  'sender': 'Maya Chen',
                                  'body': controller.text.trim(),
                                  'time': 'Now',
                                });
                                controller.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}

class DiscussionsScreen extends StatelessWidget {
  const DiscussionsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Community participation',
            title: 'My discussions',
            subtitle:
                'Follow your questions, replies, and conversations in one private view.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'Create discussion form'),
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('Start a discussion'),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            children: const [
              StatusPill('All · 8', color: AppColors.teal),
              StatusPill(
                'Started by me · 3',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
              StatusPill(
                'Following · 5',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
              StatusPill(
                'Mentions · 2',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 15),
          SectionCard(
            child: Column(
              children: [
                _DiscussionRow(
                  title: 'When should I use a tuple instead of a list?',
                  topic: 'Data structures',
                  replies: '8 replies',
                  activity: 'Active 12 min ago',
                  state: 'Following',
                  color: AppColors.teal,
                ),
                _DiscussionRow(
                  title: 'How I structure my first Python project',
                  topic: 'Project workflow',
                  replies: '5 replies',
                  activity: 'Active yesterday',
                  state: 'Started by me',
                  color: AppColors.coral,
                ),
                _DiscussionRow(
                  title: 'My mental model for decorators',
                  topic: 'Advanced Python',
                  replies: '12 replies',
                  activity: 'Active Sep 24',
                  state: 'Following',
                  color: AppColors.violet,
                ),
                _DiscussionRow(
                  title: 'Good beginner-friendly testing projects?',
                  topic: 'Testing',
                  replies: '3 replies',
                  activity: 'Active Sep 18',
                  state: 'Started by me',
                  color: AppColors.gold,
                ),
              ],
            ),
          ),
        ],
      );
}

class _DiscussionRow extends StatelessWidget {
  const _DiscussionRow({
    required this.title,
    required this.topic,
    required this.replies,
    required this.activity,
    required this.state,
    required this.color,
  });
  final String title;
  final String topic;
  final String replies;
  final String activity;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withOpacity(.11),
                borderRadius: BorderRadius.circular(11),
              ),
              child: Icon(Icons.forum_outlined, color: color, size: 19),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      StatusPill(topic, color: color),
                      const SizedBox(width: 8),
                      Text(
                        '$replies  ·  $activity',
                        style: const TextStyle(
                          color: AppColors.inkMuted,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StatusPill(
              state,
              color: AppColors.inkMuted,
              background: AppColors.canvas,
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.inkMuted,
              size: 18,
            ),
          ],
        ),
      );
}

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Workspace overview',
            title: 'Admin overview',
            subtitle:
                'Good morning, Maya. Here is what needs your attention today.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Health checks are green'),
                icon: const Icon(Icons.monitor_heart_outlined, size: 16),
                label: const Text('System health'),
              ),
            ],
          ),
          AdaptiveStatGrid(
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(
                label: 'Total learners',
                value: '12,840',
                caption: '+8.4% this month',
                icon: Icons.people_outline_rounded,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Published content',
                value: '184',
                caption: '6 awaiting review',
                icon: Icons.article_outlined,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'Open reports',
                value: '6',
                caption: '2 need action today',
                icon: Icons.flag_outlined,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Weekly completions',
                value: '3,492',
                caption: '+12.7% vs last week',
                icon: Icons.trending_up_rounded,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? Column(
                    children: [
                      const _AdminAttention(),
                      const SizedBox(height: 16),
                      const _ContentPulse(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _AdminAttention()),
                      SizedBox(width: 18),
                      Expanded(child: _ContentPulse()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const _AdminQuickLinks(),
        ],
      );
}

class _AdminAttention extends StatelessWidget {
  const _AdminAttention();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Needs attention', action: 'Open queue'),
            const SizedBox(height: 15),
            _AttentionRow(
              icon: Icons.shield_outlined,
              title: 'Moderation reports',
              subtitle: '6 open reports · 2 urgent',
              color: AppColors.coral,
              route: '/app/admin/moderation',
            ),
            _AttentionRow(
              icon: Icons.pending_actions_rounded,
              title: 'Content review',
              subtitle: '6 drafts ready for review',
              color: AppColors.violet,
              route: '/app/admin/content',
            ),
            _AttentionRow(
              icon: Icons.account_tree_outlined,
              title: 'Roadmap validation',
              subtitle: '1 link needs attention',
              color: AppColors.gold,
              route: '/app/admin/roadmap',
            ),
          ],
        ),
      );
}

class _AttentionRow extends StatelessWidget {
  const _AttentionRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.route,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String route;
  /*
  Widget build(BuildContext context) => InkWell(onTap: () => Navigator.of(context).pushReplacementNamed(route), child: Padding(padding: const EdgeInsets.symmetric(vertical: 9), child: Row(children: [Icon(icon, color: color, size: 20), const SizedBox(width: 12), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: AppColors.inkMuted, fontSize: 11))])), const Icon(Icons.chevron_right_rounded, color: AppColors.inkMuted, size: 18)]));
  */
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.inkMuted,
                size: 18,
              ),
            ],
          ),
        ),
      );
}

class _ContentPulse extends StatelessWidget {
  const _ContentPulse();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Content pulse', action: 'Analytics'),
            const SizedBox(height: 22),
            SizedBox(height: 150, child: CustomPaint(painter: _PulsePainter())),
            const SizedBox(height: 11),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sep 25', style: _TinyLabel.style),
                Text('Sep 27', style: _TinyLabel.style),
                Text('Sep 29', style: _TinyLabel.style),
                Text('Oct 1', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}

class _PulsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fill = Paint()..color = AppColors.teal.withOpacity(.12);
    final line = Paint()
      ..color = AppColors.teal
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    final points = [
      Offset(0, size.height * .68),
      Offset(size.width * .12, size.height * .56),
      Offset(size.width * .25, size.height * .62),
      Offset(size.width * .39, size.height * .46),
      Offset(size.width * .5, size.height * .52),
      Offset(size.width * .63, size.height * .3),
      Offset(size.width * .76, size.height * .37),
      Offset(size.width * .9, size.height * .18),
      Offset(size.width, size.height * .23),
    ];
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++)
      path.lineTo(points[i].dx, points[i].dy);
    final area = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(area, fill);
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AdminQuickLinks extends StatelessWidget {
  const _AdminQuickLinks();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick links',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _AdminLink(
                  icon: Icons.article_outlined,
                  label: 'Create content',
                  route: '/app/admin/content',
                  color: AppColors.teal,
                ),
                _AdminLink(
                  icon: Icons.account_tree_outlined,
                  label: 'Edit roadmap',
                  route: '/app/admin/roadmap',
                  color: AppColors.violet,
                ),
                _AdminLink(
                  icon: Icons.people_outline_rounded,
                  label: 'Manage users',
                  route: '/app/admin/users',
                  color: AppColors.coral,
                ),
                _AdminLink(
                  icon: Icons.bar_chart_rounded,
                  label: 'View analytics',
                  route: '/app/admin/analytics',
                  color: AppColors.gold,
                ),
              ],
            ),
          ],
        ),
      );
}

class _AdminLink extends StatelessWidget {
  const _AdminLink({
    required this.icon,
    required this.label,
    required this.route,
    required this.color,
  });
  final IconData icon;
  final String label;
  final String route;
  final Color color;
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => Navigator.of(context).pushReplacementNamed(route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
          decoration: BoxDecoration(
            color: AppColors.canvas,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 17),
              const SizedBox(width: 8),
              Text(
                label,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(width: 7),
              const Icon(
                Icons.arrow_outward_rounded,
                size: 14,
                color: AppColors.inkMuted,
              ),
            ],
          ),
        ),
      );
}

class ContentManagementScreen extends StatelessWidget {
  const ContentManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Editorial workspace',
            title: 'Content management',
            subtitle: 'Review, refine, and publish the learning library.',
            actions: [
              FilledButton.icon(
                onPressed: () => _notice(context, 'Create content form'),
                icon: const Icon(Icons.add_rounded, size: 16),
                label: const Text('New content'),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search title or slug',
                    prefixIcon: Icon(Icons.search_rounded, size: 18),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list_rounded, size: 16),
                label: const Text('All statuses'),
              ),
            ],
          ),
          const SizedBox(height: 17),
          Wrap(
            spacing: 8,
            children: const [
              StatusPill('All · 184', color: AppColors.teal),
              StatusPill(
                'Published · 161',
                color: AppColors.teal,
                background: AppColors.tealSoft,
              ),
              StatusPill(
                'Draft · 17',
                color: AppColors.violet,
                background: AppColors.violetSoft,
              ),
              StatusPill(
                'Archived · 6',
                color: AppColors.inkMuted,
                background: AppColors.surface,
              ),
            ],
          ),
          const SizedBox(height: 14),
          SectionCard(
            child: Column(
              children: [
                _ContentRow(
                  type: 'TOPIC',
                  title: 'Functions & return values',
                  slug: '/topics/python-functions',
                  author: 'Maya Chen',
                  date: 'Updated today',
                  state: 'Published',
                  color: AppColors.teal,
                ),
                _ContentRow(
                  type: 'GUIDE',
                  title: 'Testing with pytest',
                  slug: '/guides/testing-with-pytest',
                  author: 'Jules Martin',
                  date: 'Updated Sep 29',
                  state: 'Published',
                  color: AppColors.violet,
                ),
                _ContentRow(
                  type: 'TUTORIAL',
                  title: 'Build a CLI weather app',
                  slug: '/tutorials/cli-weather-app',
                  author: 'Nadia Cole',
                  date: 'Updated Sep 28',
                  state: 'Draft',
                  color: AppColors.coral,
                ),
                _ContentRow(
                  type: 'TOPIC',
                  title: 'Asyncio event loops',
                  slug: '/topics/python-asyncio',
                  author: 'Maya Chen',
                  date: 'Updated Sep 26',
                  state: 'Needs review',
                  color: AppColors.gold,
                ),
              ],
            ),
          ),
        ],
      );
}

class _ContentRow extends StatelessWidget {
  const _ContentRow({
    required this.type,
    required this.title,
    required this.slug,
    required this.author,
    required this.date,
    required this.state,
    required this.color,
  });
  final String type;
  final String title;
  final String slug;
  final String author;
  final String date;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withOpacity(.11),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                type == 'TOPIC'
                    ? Icons.article_outlined
                    : type == 'GUIDE'
                        ? Icons.menu_book_outlined
                        : Icons.layers_outlined,
                color: color,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(type, color: color),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$slug  ·  $author  ·  $date',
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            StatusPill(
              state,
              color: state == 'Published'
                  ? AppColors.teal
                  : state == 'Draft'
                      ? AppColors.violet
                      : AppColors.gold,
            ),
            const SizedBox(width: 8),
            IconButton(
              tooltip: 'Edit content',
              icon: const Icon(
                Icons.edit_outlined,
                size: 18,
                color: AppColors.inkMuted,
              ),
              onPressed: () => _notice(context, 'Opening editor for $title'),
            ),
          ],
        ),
      );
}

class RoadmapManagementScreen extends StatelessWidget {
  const RoadmapManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Learning architecture',
            title: 'Roadmap management',
            subtitle:
                'Keep the public learning path ordered, clear, and connected.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Public roadmap preview'),
                icon: const Icon(Icons.open_in_new_rounded, size: 16),
                label: const Text('Preview public page'),
              ),
              FilledButton.icon(
                onPressed: () => _notice(context, 'Roadmap saved'),
                icon: const Icon(Icons.save_outlined, size: 16),
                label: const Text('Save changes'),
              ),
            ],
          ),
          SectionCard(
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  color: AppColors.teal,
                  size: 20,
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    'Validation passed for 47 nodes and 62 prerequisite links.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
                const StatusPill('1 suggestion', color: AppColors.gold),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SectionCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Stages & nodes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 14),
                _RoadmapAdminRow(
                  stage: 'STAGE 1',
                  title: 'Python fundamentals',
                  nodes: '18 nodes',
                  status: 'Published',
                  color: AppColors.teal,
                  indent: 0,
                ),
                _RoadmapAdminRow(
                  stage: '01.03',
                  title: 'Control flow',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.coral,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: '01.04',
                  title: 'Functions & return values',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.coral,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: 'STAGE 2',
                  title: 'Core data structures',
                  nodes: '11 nodes',
                  status: 'Published',
                  color: AppColors.violet,
                  indent: 0,
                ),
                _RoadmapAdminRow(
                  stage: '02.01',
                  title: 'Lists, tuples & sets',
                  nodes: 'Topic linked',
                  status: 'Ready',
                  color: AppColors.violet,
                  indent: 1,
                ),
                _RoadmapAdminRow(
                  stage: '02.02',
                  title: 'Dictionaries',
                  nodes: 'Topic not linked',
                  status: 'Needs link',
                  color: AppColors.gold,
                  indent: 1,
                ),
              ],
            ),
          ),
        ],
      );
}

class _RoadmapAdminRow extends StatelessWidget {
  const _RoadmapAdminRow({
    required this.stage,
    required this.title,
    required this.nodes,
    required this.status,
    required this.color,
    required this.indent,
  });
  final String stage;
  final String title;
  final String nodes;
  final String status;
  final Color color;
  final int indent;
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.fromLTRB(indent * 28.0, 8, 0, 8),
        child: Row(
          children: [
            Icon(
              indent == 0
                  ? Icons.folder_open_outlined
                  : Icons.subdirectory_arrow_right_rounded,
              color: color,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              stage,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: indent == 0 ? 13 : 12,
                      fontWeight:
                          indent == 0 ? FontWeight.w800 : FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    nodes,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            StatusPill(
              status,
              color: status == 'Needs link' ? AppColors.gold : AppColors.teal,
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.drag_indicator_rounded,
              color: AppColors.inkMuted,
              size: 18,
            ),
          ],
        ),
      );
}

class UserManagementScreen extends StatelessWidget {
  const UserManagementScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'People & permissions',
            title: 'User management',
            subtitle:
                'Manage roles and account status with a clear audit trail.',
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
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
          SectionCard(
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

class _UserRow extends StatelessWidget {
  const _UserRow({
    required this.initials,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.joined,
    required this.color,
  });
  final String initials;
  final String name;
  final String email;
  final String role;
  final String status;
  final String joined;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: color.withOpacity(.15),
              child: Text(
                initials,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    email,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                role,
                style:
                    const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                joined,
                style: const TextStyle(color: AppColors.inkMuted, fontSize: 10),
              ),
            ),
            StatusPill(
              status,
              color: status == 'Active' ? AppColors.teal : AppColors.coral,
            ),
            const SizedBox(width: 7),
            IconButton(
              tooltip: 'User actions',
              icon: const Icon(Icons.more_horiz_rounded,
                  color: AppColors.inkMuted),
              onPressed: () => _notice(context, 'User action menu for $name'),
            ),
          ],
        ),
      );
}

class ModerationScreen extends StatelessWidget {
  const ModerationScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Trust & safety',
            title: 'Moderation',
            subtitle:
                'Review reports carefully and keep community spaces useful.',
            actions: [
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Moderation queue refreshed'),
                icon: const Icon(Icons.refresh_rounded, size: 16),
                label: const Text('Refresh'),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            children: const [
              StatusPill(
                'Open · 6',
                color: AppColors.coral,
                background: AppColors.coralSoft,
              ),
              StatusPill(
                'In review · 2',
                color: AppColors.gold,
                background: AppColors.goldSoft,
              ),
              StatusPill(
                'Resolved · 48',
                color: AppColors.teal,
                background: AppColors.tealSoft,
              ),
            ],
          ),
          const SizedBox(height: 15),
          SectionCard(
            child: Column(
              children: [
                _ReportRow(
                  reason: 'Possible harassment',
                  title: '“Why are you making this so complicated?”',
                  discussionContext:
                      'Reported in: How I structure my first Python project',
                  reporter: '2 hours ago · 1 report',
                  state: 'Urgent',
                  color: AppColors.coral,
                ),
                _ReportRow(
                  reason: 'Spam / promotion',
                  title: '“Click here for the best Python course…”',
                  discussionContext: 'Reported in: General Python questions',
                  reporter: '5 hours ago · 3 reports',
                  state: 'Open',
                  color: AppColors.gold,
                ),
                _ReportRow(
                  reason: 'Needs content review',
                  title: 'Answer contains an outdated package version',
                  discussionContext: 'Reported in: Testing with pytest',
                  reporter: 'Yesterday · 1 report',
                  state: 'Open',
                  color: AppColors.violet,
                ),
              ],
            ),
          ),
        ],
      );
}

class _ReportRow extends StatelessWidget {
  const _ReportRow({
    required this.reason,
    required this.title,
    required this.discussionContext,
    required this.reporter,
    required this.state,
    required this.color,
  });
  final String reason;
  final String title;
  final String discussionContext;
  final String reporter;
  final String state;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.flag_outlined, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        reason,
                        style: TextStyle(
                          color: color,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(width: 8),
                      StatusPill(state, color: color),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    discussionContext,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 11),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reporter,
                    style: const TextStyle(
                        color: AppColors.inkMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () => _notice(context, 'Opening moderation detail'),
              child: const Text('Review'),
            ),
          ],
        ),
      );
}

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            eyebrow: 'Measured platform health',
            title: 'Analytics',
            subtitle:
                'Aggregate signals for improving content and the learner experience.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.date_range_rounded, size: 16),
                label: const Text('Last 30 days'),
              ),
              OutlinedButton.icon(
                onPressed: () => _notice(context, 'Export queued for download'),
                icon: const Icon(Icons.download_outlined, size: 16),
                label: const Text('Export'),
              ),
            ],
          ),
          AdaptiveStatGrid(
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              StatCard(
                label: 'Topic views',
                value: '84.2k',
                caption: '+18.2% vs prior period',
                icon: Icons.visibility_outlined,
                color: AppColors.teal,
              ),
              StatCard(
                label: 'Lesson completion',
                value: '36.8%',
                caption: '+4.1 pts vs prior period',
                icon: Icons.check_circle_outline_rounded,
                color: AppColors.coral,
              ),
              StatCard(
                label: 'Searches',
                value: '21.4k',
                caption: 'Top: “asyncio”',
                icon: Icons.search_rounded,
                color: AppColors.violet,
              ),
              StatCard(
                label: 'New accounts',
                value: '1,284',
                caption: '+8.4% vs prior period',
                icon: Icons.person_add_alt_1_outlined,
                color: AppColors.gold,
              ),
            ],
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, c) => c.maxWidth < 760
                ? Column(
                    children: [
                      const _AnalyticsTrend(),
                      const SizedBox(height: 16),
                      const _TopContent(),
                    ],
                  )
                : const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _AnalyticsTrend()),
                      SizedBox(width: 18),
                      Expanded(flex: 2, child: _TopContent()),
                    ],
                  ),
          ),
          const SizedBox(height: 18),
          const SectionCard(
            child: Row(
              children: [
                Icon(
                  Icons.privacy_tip_outlined,
                  color: AppColors.inkMuted,
                  size: 18,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Metrics are aggregate and privacy-reviewed. Search terms are shown only above the reporting threshold.',
                    style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}

class _AnalyticsTrend extends StatelessWidget {
  const _AnalyticsTrend();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Completion trend', action: 'Measured'),
            const SizedBox(height: 19),
            SizedBox(height: 190, child: CustomPaint(painter: _TrendPainter())),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sep 1', style: _TinyLabel.style),
                Text('Sep 10', style: _TinyLabel.style),
                Text('Sep 20', style: _TinyLabel.style),
                Text('Oct 1', style: _TinyLabel.style),
              ],
            ),
          ],
        ),
      );
}

class _TrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.line
      ..strokeWidth = 1;
    for (var i = 0; i < 4; i++)
      canvas.drawLine(
        Offset(0, i * size.height / 3),
        Offset(size.width, i * size.height / 3),
        grid,
      );
    final points = [
      Offset(0, size.height * .72),
      Offset(size.width * .08, size.height * .7),
      Offset(size.width * .18, size.height * .64),
      Offset(size.width * .3, size.height * .66),
      Offset(size.width * .42, size.height * .5),
      Offset(size.width * .54, size.height * .54),
      Offset(size.width * .65, size.height * .37),
      Offset(size.width * .78, size.height * .29),
      Offset(size.width * .88, size.height * .23),
      Offset(size.width, size.height * .12),
    ];
    final line = Paint()
      ..color = AppColors.coral
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    final path = Path()..moveTo(points.first.dx, points.first.dy);
    for (var i = 1; i < points.length; i++)
      path.lineTo(points[i].dx, points[i].dy);
    canvas.drawPath(path, line);
    final dot = Paint()..color = AppColors.coral;
    for (final point in points) canvas.drawCircle(point, 4, dot);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _TopContent extends StatelessWidget {
  const _TopContent();
  @override
  Widget build(BuildContext context) => SectionCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _CardTitle(title: 'Top content', action: 'All content'),
            const SizedBox(height: 16),
            _RankRow(
              rank: '01',
              title: 'Functions & return values',
              value: '12.4k views',
              color: AppColors.teal,
            ),
            _RankRow(
              rank: '02',
              title: 'Lists, tuples & sets',
              value: '9.8k views',
              color: AppColors.coral,
            ),
            _RankRow(
              rank: '03',
              title: 'Build a CLI weather app',
              value: '8.1k views',
              color: AppColors.violet,
            ),
            _RankRow(
              rank: '04',
              title: 'Testing with pytest',
              value: '7.6k views',
              color: AppColors.gold,
            ),
          ],
        ),
      );
}

class _RankRow extends StatelessWidget {
  const _RankRow({
    required this.rank,
    required this.title,
    required this.value,
    required this.color,
  });
  final String rank;
  final String title;
  final String value;
  final Color color;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 9),
        child: Row(
          children: [
            Text(
              rank,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w800,
                fontSize: 11,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              value,
              style: const TextStyle(color: AppColors.inkMuted, fontSize: 10),
            ),
          ],
        ),
      );
}

class AuthPageFrame extends StatelessWidget {
  const AuthPageFrame({
    required this.child,
    required this.title,
    required this.subtitle,
    super.key,
  });
  final Widget child;
  final String title;
  final String subtitle;

  /*
  Widget build(BuildContext context) => Scaffold(body: SafeArea(child: Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 470), child: Column(children: [Row(mainAxisAlignment: MainAxisAlignment.center, children: [Container(width: 38, height: 38, decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.code_rounded, color: AppColors.ink)), const SizedBox(width: 11), const Text('Python Learning Hub', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17))]), const SizedBox(height: 42), Text(title, style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center), const SizedBox(height: 8), Text(subtitle, style: const TextStyle(color: AppColors.inkMuted, fontSize: 13, height: 1.45), textAlign: TextAlign.center), const SizedBox(height: 28), child, const SizedBox(height: 22), TextButton.icon(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/dashboard'), icon: const Icon(Icons.arrow_back_rounded, size: 16), label: const Text('Back to the learning hub'))])))));
  */
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 470),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.code_rounded,
                            color: AppColors.ink,
                          ),
                        ),
                        const SizedBox(width: 11),
                        const Text(
                          'Python Learning Hub',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 42),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.inkMuted,
                        fontSize: 13,
                        height: 1.45,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    child,
                    const SizedBox(height: 22),
                    TextButton.icon(
                      onPressed: () => Navigator.of(context)
                          .pushReplacementNamed('/app/dashboard'),
                      icon: const Icon(Icons.arrow_back_rounded, size: 16),
                      label: const Text('Back to the learning hub'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscure = true;
  bool loading = false;
  /*
  Widget build(BuildContext context) => AuthPageFrame(title: 'Welcome back', subtitle: 'Sign in to continue your learning journey.', child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline_rounded))), const SizedBox(height: 14), TextField(obscureText: obscure, decoration: InputDecoration(labelText: 'Password', prefixIcon: const Icon(Icons.lock_outline_rounded), suffixIcon: IconButton(tooltip: obscure ? 'Show password' : 'Hide password', icon: Icon(obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined), onPressed: () => setState(() => obscure = !obscure)))), Align(alignment: Alignment.centerRight, child: TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/forgot-password'), child: const Text('Forgot password?'))), const SizedBox(height: 8), SizedBox(height: 48, child: FilledButton(onPressed: loading ? null : () { setState(() => loading = true); Future.delayed(const Duration(milliseconds: 500), () { if (mounted) Navigator.of(context).pushReplacementNamed('/app/dashboard'); }); }, child: loading ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Text('Sign in'))), const SizedBox(height: 16), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('New to the Hub?', style: TextStyle(color: AppColors.inkMuted, fontSize: 12)), TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/register'), child: const Text('Create an account'))])])));
  */
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Welcome back',
        subtitle: 'Sign in to continue your learning journey.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            TextField(
              obscureText: obscure,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock_outline_rounded),
                suffixIcon: IconButton(
                  tooltip: obscure ? 'Show password' : 'Hide password',
                  icon: Icon(
                    obscure
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () => setState(() => obscure = !obscure),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/forgot-password'),
                child: const Text('Forgot password?'),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: loading
                    ? null
                    : () {
                        setState(() => loading = true);
                        Future.delayed(const Duration(milliseconds: 500), () {
                          if (mounted)
                            Navigator.of(context)
                                .pushReplacementNamed('/app/dashboard');
                        });
                      },
                child: loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('Sign in'),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'New to the Hub?',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushReplacementNamed('/app/register'),
                  child: const Text('Create an account'),
                ),
              ],
            ),
          ],
        ),
      );
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  /*
  Widget build(BuildContext context) => AuthPageFrame(title: 'Start learning with intention', subtitle: 'Create a free account to track progress, save lessons, and join the community.', child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [const TextField(decoration: InputDecoration(labelText: 'Display name', prefixIcon: Icon(Icons.person_outline_rounded))), const SizedBox(height: 14), const TextField(decoration: InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.mail_outline_rounded))), const SizedBox(height: 14), const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline_rounded))), const SizedBox(height: 8), const Text('Use at least 8 characters with a number and a symbol.', style: TextStyle(color: AppColors.inkMuted, fontSize: 11)), const SizedBox(height: 14), const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Confirm password', prefixIcon: Icon(Icons.lock_outline_rounded))), const SizedBox(height: 16), const Text('By creating an account, you agree to the Terms of Service and Privacy Policy.', style: TextStyle(color: AppColors.inkMuted, fontSize: 11, height: 1.4)), const SizedBox(height: 18), SizedBox(height: 48, child: FilledButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/verify-email'), child: const Text('Create account'))), const SizedBox(height: 14), Row(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('Already have an account?', style: TextStyle(color: AppColors.inkMuted, fontSize: 12)), TextButton(onPressed: () => Navigator.of(context).pushReplacementNamed('/app/login'), child: const Text('Sign in'))])])));
  */
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Start learning with intention',
        subtitle:
            'Create a free account to track progress, save lessons, and join the community.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Display name',
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email address',
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
            ),
            const SizedBox(height: 14),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use at least 8 characters with a number and a symbol.',
              style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
            ),
            const SizedBox(height: 14),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                prefixIcon: Icon(Icons.lock_outline_rounded),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'By creating an account, you agree to the Terms of Service and Privacy Policy.',
              style: TextStyle(
                color: AppColors.inkMuted,
                fontSize: 11,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 18),
            SizedBox(
              height: 48,
              child: FilledButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/verify-email'),
                child: const Text('Create account'),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: AppColors.inkMuted, fontSize: 12),
                ),
                TextButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/app/login'),
                  child: const Text('Sign in'),
                ),
              ],
            ),
          ],
        ),
      );
}

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({required this.reset, super.key});
  final bool reset;
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: reset ? 'Choose a new password' : 'Reset your password',
        subtitle: reset
            ? 'Make it memorable for you and difficult for anyone else.'
            : 'We will send a neutral recovery link if the account exists.',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!reset) ...[
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.mail_outline_rounded),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: () => _notice(
                    context,
                    'If the account exists, a recovery link is on its way.',
                  ),
                  child: const Text('Send recovery link'),
                ),
              ),
            ] else ...[
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              const SizedBox(height: 14),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm new password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 48,
                child: FilledButton(
                  onPressed: () =>
                      Navigator.of(context).pushReplacementNamed('/app/login'),
                  child: const Text('Save new password'),
                ),
              ),
            ],
            const SizedBox(height: 14),
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/app/login'),
              child: const Text('Back to sign in'),
            ),
          ],
        ),
      );
}

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  @override
  Widget build(BuildContext context) => AuthPageFrame(
        title: 'Check your inbox',
        subtitle:
            'We sent a verification link to the email address you used to register.',
        child: Column(
          children: [
            Container(
              width: 74,
              height: 74,
              decoration: BoxDecoration(
                color: AppColors.tealSoft,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.mark_email_read_outlined,
                color: AppColors.teal,
                size: 37,
              ),
            ),
            const SizedBox(height: 22),
            const Text(
              'Almost there',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            const Text(
              'Verify your email to unlock progress tracking, bookmarks, and community participation.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.inkMuted,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed('/app/dashboard'),
                child: const Text('I have verified my email'),
              ),
            ),
            const SizedBox(height: 9),
            TextButton(
              onPressed: () => _notice(context, 'Verification email resent'),
              child: const Text('Resend verification email'),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can browse public learning content while you wait.',
              style: TextStyle(color: AppColors.inkMuted, fontSize: 11),
            ),
          ],
        ),
      );
}

void _notice(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
    ),
  );
}

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
