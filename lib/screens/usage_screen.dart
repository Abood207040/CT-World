import 'package:flutter/material.dart';
import '../widgets/fade_in_page.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInPage(
        child: Container(
         color: Colors.black,
          child: SafeArea(
            child: Column(
              children: [
                _header(context, "CT Usage", Icons.local_hospital),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      _image(),
                      const SizedBox(height: 20),
                      _card(
                          "CT scans are used to detect diseases, injuries, and internal abnormalities. They help guide surgeries, monitor treatments, and provide accurate diagnosis."),
                      const SizedBox(height: 20),
                      const _SectionTitle("🩺 Common Uses"),
                      const StepItem("Detect brain hemorrhage or stroke."),
                      const StepItem("Locate tumors or cancer growth."),
                      const StepItem("Detect internal bleeding or fractures."),
                      const StepItem("Assist in surgical planning."),
                      const SizedBox(height: 24),
                      _tipBox(
                          "💡 Quick Insight:\nCT is the fastest tool to evaluate trauma patients — a full body scan takes less than 5 minutes!"),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context, String title, IconData icon) => Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 26)),
            Text(title,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
            Icon(icon, color: Colors.white, size: 28),
          ],
        ),
      );

  Widget _image() => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset('assets/logo.png',
            height: 180, width: double.infinity, fit: BoxFit.contain),
      );

  static Widget _card(String text) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.redAccent.withOpacity(0.5))),
        child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.6)),
      );

  static Widget _tipBox(String text) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.redAccent.withOpacity(0.3))),
        child: Text(text,
            style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5)),
      );
}

class StepItem extends StatelessWidget {
  final String text;
  const StepItem(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(children: [
          const Icon(Icons.check_circle, color: Colors.redAccent, size: 20),
          const SizedBox(width: 10),
          Expanded(
              child: Text(text,
                  style: const TextStyle(color: Colors.white, fontSize: 16))),
        ]),
      );
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text,
            style: const TextStyle(
                color: Colors.redAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold)),
      );
}
