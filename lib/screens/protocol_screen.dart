import 'package:flutter/material.dart';
import '../widgets/fade_in_page.dart';

class ProtocolScreen extends StatelessWidget {
  const ProtocolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInPage(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: SafeArea(
            child: Column(
              children: [
                _header(context, "CT Protocol", Icons.list_alt_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _image(),
                        const SizedBox(height: 20),
                        _card(
                            "A CT protocol defines how a scan should be performed — from patient prep to image reconstruction — ensuring diagnostic quality with minimal radiation."),
                        const SizedBox(height: 24),
                        const _SectionTitle("🧾 Standard Steps"),
                        const StepItem("1️⃣ Confirm clinical indication."),
                        const StepItem("2️⃣ Position patient correctly."),
                        const StepItem("3️⃣ Set scanning parameters."),
                        const StepItem("4️⃣ Inject contrast if required."),
                        const StepItem("5️⃣ Acquire and reconstruct images."),
                        const SizedBox(height: 24),
                        _tipBox(
                            "💡 Reminder:\nAlways tailor the protocol to patient age, weight, and region being scanned."),
                      ],
                    ),
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
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 16, height: 1.4)),
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
