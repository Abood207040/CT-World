import 'package:flutter/material.dart';
import '../widgets/fade_in_page.dart';

class CasesScreen extends StatelessWidget {
  const CasesScreen({super.key});

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
                _header(context, "CT Cases", Icons.folder_special_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _image(),
                        const SizedBox(height: 20),
                        _card(
                            "Real-world CT cases demonstrate how imaging saves lives. These examples highlight CT’s diagnostic accuracy and speed in emergencies."),
                        const SizedBox(height: 24),
                        const _SectionTitle("📚 Example Cases"),
                        const CaseItem("Head Injury", "CT detects brain hemorrhage within seconds."),
                        const CaseItem("Lung Cancer", "Identifies small nodules not seen on X-ray."),
                        const CaseItem("Abdominal Pain", "Finds kidney stones or appendicitis quickly."),
                        const CaseItem("Cardiac Imaging", "Visualizes coronary arteries in detail."),
                        const SizedBox(height: 24),
                        _tipBox(
                            "💡 Insight:\nCT angiography is now the gold standard for detecting vascular blockages."),
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
          border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
        ),
        child: Text(text,
            style: const TextStyle(color: Colors.white, fontSize: 18, height: 1.6)),
      );

  static Widget _tipBox(String text) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.redAccent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
        ),
        child: Text(text,
            style: const TextStyle(color: Colors.white70, fontSize: 16, height: 1.5)),
      );
}

class CaseItem extends StatelessWidget {
  final String title, desc;
  const CaseItem(this.title, this.desc, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
          ),
          padding: const EdgeInsets.all(12),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text(desc,
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
              ]),
        ),
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
