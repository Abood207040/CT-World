import 'package:flutter/material.dart';
import '../widgets/fade_in_page.dart';

class RisksScreen extends StatelessWidget {
  const RisksScreen({super.key});

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
                _header(context, "CT Risks", Icons.warning_amber_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        _image(),
                        const SizedBox(height: 20),
                        _card(
                          "While CT scans are safe when medically justified, they expose the body to ionizing radiation. Modern scanners minimize dose, but unnecessary repetition should be avoided.",
                        ),
                        const SizedBox(height: 24),
                        const _SectionTitle("⚠️ Potential Risks"),
                        const RiskItem("Radiation exposure (especially in children)."),
                        const RiskItem("Allergic reaction to contrast dye."),
                        const RiskItem("Kidney stress from contrast material."),
                        const RiskItem("Not advised during pregnancy."),
                        const SizedBox(height: 24),
                        _tipBox(
                          "💡 Safety Tip:\nAlways inform your doctor of previous scans and allergies before a new CT exam.",
                        ),
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

class RiskItem extends StatelessWidget {
  final String text;
  const RiskItem(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
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
