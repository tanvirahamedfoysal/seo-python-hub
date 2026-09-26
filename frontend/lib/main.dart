import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEO Python Hub',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'SEO Python Hub'),
      onGenerateRoute: (settings) {
        if (settings.name == '/app/send' || settings.name == '/app/send/') {
          return MaterialPageRoute(builder: (context) => const SendPage());
        }
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'SEO Python Hub'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text(
              'Welcome to the Flutter app for SEO Python Hub',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text('Counter updated this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, '/app/send'),
              child: const Text('Open /app/send'),
            ),
            TextButton(
              onPressed: () => _openHtmlPage('/'),
              child: const Text('Open HTML welcome page'),
            ),
            TextButton(
              onPressed: () => _openHtmlPage('/topics'),
              child: const Text('Open HTML topics page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('/app/send')),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('This is the second Flutter page.'),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () => Navigator.pushNamed(context, '/app'),
              child: const Text('Back to Flutter welcome'),
            ),
            TextButton(
              onPressed: () => _openHtmlPage('/'),
              child: const Text('Open HTML welcome page'),
            ),
            TextButton(
              onPressed: () => _openHtmlPage('/topics'),
              child: const Text('Open HTML topics page'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _openHtmlPage(String path) async {
  await launchUrl(Uri.base.resolve(path));
}
