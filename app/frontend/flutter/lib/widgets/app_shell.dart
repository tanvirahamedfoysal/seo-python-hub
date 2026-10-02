part of '../app.dart';

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
          drawer: desktop ? null : Drawer(child: Sidebar(path: path)),
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
                  actions: const [TopBarAvatar()],
                ),
          body: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (desktop) Sidebar(path: path),
              Expanded(
                child: Column(
                  children: [
                    if (desktop) DesktopTopBar(title: title),
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
