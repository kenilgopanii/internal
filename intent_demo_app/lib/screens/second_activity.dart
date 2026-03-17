import 'package:flutter/material.dart';

/// SecondActivity — receives and displays data passed from MainActivity.
/// This is the Flutter equivalent of:
///   String name = getIntent().getStringExtra("name");
///   textView.setText(name);
class SecondActivity extends StatelessWidget {
  final String name;
  final String age;
  final String city;

  const SecondActivity({
    super.key,
    required this.name,
    required this.age,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('SecondActivity'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        // Back button is provided automatically by Navigator.
        // Equivalent to Android's finish() / onBackPressed()
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back to MainActivity',
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────
            const Text(
              'Received Data',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'The following data was passed via Intent from MainActivity.',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 24),

            // ── Data Display Cards (TextView equivalent) ───────────────
            _DataRow(label: 'Full Name', value: name, icon: Icons.person),
            const SizedBox(height: 12),
            _DataRow(label: 'Age', value: '$age years', icon: Icons.cake),
            const SizedBox(height: 12),
            _DataRow(
                label: 'City',
                value: city,
                icon: Icons.location_city),

            const SizedBox(height: 36),

            // ── Back Button ───────────────────────────────────────────
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Go Back to MainActivity',
                  style: TextStyle(fontSize: 15),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.indigo,
                  side: const BorderSide(color: Colors.indigo),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A simple row that displays a label and its value — equivalent to a TextView.
class _DataRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _DataRow({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        border: Border.all(color: Colors.indigo.shade100),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.indigo, size: 22),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
