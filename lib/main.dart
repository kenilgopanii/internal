import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linear Layout Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _message = '';

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    setState(() {
      if (name.isEmpty || email.isEmpty) {
        _message = 'Please fill in all fields.';
      } else {
        _message = 'Hello, $name! ($email)';
      }
    });
  }

  void _clear() {
    setState(() {
      _nameController.clear();
      _emailController.clear();
      _message = '';
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Linear Layout Demo'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        // ── VERTICAL Column (Linear Layout - vertical) ──────────────────
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ─ HEADER SECTION ──────────────────────────────────────────
            const Text(
              'User Registration Form',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Fill in your details below.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const Divider(height: 28),

            // ─ VERTICAL INPUT FIELDS ────────────────────────────────────
            const Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Email Address',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 24),

            // ─ HORIZONTAL Row — Submit + Clear buttons ──────────────────
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Submit'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: _clear,
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text('Clear'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ─ STATUS MESSAGE ───────────────────────────────────────────
            if (_message.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                color: Colors.blue.shade50,
                child: Text(
                  _message,
                  style: const TextStyle(fontSize: 15),
                ),
              ),

            const Divider(height: 32),

            // ─ HORIZONTAL ROW — Quick Action Buttons ────────────────────
            const Text(
              'Quick Actions',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionButton(icon: Icons.home, label: 'Home'),
                _ActionButton(icon: Icons.search, label: 'Search'),
                _ActionButton(icon: Icons.settings, label: 'Settings'),
                _ActionButton(icon: Icons.person, label: 'Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Simple vertical icon + label button
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(icon, size: 28, color: Colors.blue),
          style: IconButton.styleFrom(
            backgroundColor: Colors.blue.shade50,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
