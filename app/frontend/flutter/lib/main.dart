import 'package:flutter/material.dart';
import 'package:python_learning_hub/app.dart';

void main() {
  runApp(const PythonLearningHubApp());
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
          AppShell(path: path, title: title, admin: admin, child: child),
    );
  }
}
