import 'package:flutter/material.dart';
import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';

class UsageScreen extends StatelessWidget {
  const UsageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final teamNames = [
      "Wed Hassan Abdelrazek",
      "Allshimaa Abdelnaby Mahmoud",
      
      "Shahernan Mohamed Ibrahim",
      "Fedaa Mohamed Ali",
      "Waad Farrag Abd Elnaby",
      "Alaa Mohamed Al Saeed",
      "Nada Sabry Abdelhafez",
      "Rofida Amgad Abd Elkhaleq",
      "Zahraa Saeed Hassan",
      "Rewaa Azmy Abdelhamid",
      "Aya Mohamed Abd Elmoneem",
      "Amira Soliman Mesalam",
      "Salma Amr Abdelmohsen",
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FadeInPage(
        child: Container(
          decoration: AppScreenBackground.decoration,
          child: SafeArea(
            child: Column(
              children: [
                _header(context, "About Us", Icons.group_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _image(),
                        const SizedBox(height: 20),

                        _card(
                          "Welcome to \"CT WORLD\", a graduation project developed with passion, dedication, and a commitment to advancing medical knowledge through technology.\n\n"
                          "This application is created as part of our academic journey, combining learning, research, and innovation in the medical field. "
                          "It is intended for educational purposes, promoting safe and effective use of technology in healthcare.",
                        ),

                        const SizedBox(height: 20),

                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.redAccent,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.3),
                                  blurRadius: 16,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/second.jpeg',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        const _SectionTitle("Our Team"),
                        const SizedBox(height: 8),
                        _teamList(teamNames),

                        const SizedBox(height: 24),

                        const _SectionTitle("Our Supervisors"),
                        const SizedBox(height: 8),

                        _supervisorCard(
                          title: "Dr. Alzahraa Sayed Hassan",
                          subtitle:
                              "Lecturer of Diagnostic Radiology, Faculty of Medicine, Assiut University",
                        ),

                        const SizedBox(height: 12),

                        _supervisorCard(
                          title: "TA. Mohamed Mubarak Hassan",
                          subtitle:
                              "Teaching Assistant of Radiology and Medical Imaging – Sphinx University",
                        ),

                        const SizedBox(height: 24),
                        

_card(
  "This application is created as part of our academic journey, combining learning, research, and innovation in the medical field. "
  "It is intended for educational purposes, promoting safe and effective use of technology in healthcare.",
),
const SizedBox(height: 20),
  Center(
                          child: Column(
                            children: const [
                              Text(
                                "Sphinx University",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Faculty of Applied Health Sciences Technology\n"
                                "Department of Radiology and Medical Imaging Technology\n"
                                "Academic Year 2025–2026",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

const _SectionTitle("Acknowledgments"),
const SizedBox(height: 10),

Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white.withOpacity(0.06),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          children: [
            TextSpan(text: "We would like to express our sincere thanks and appreciation to "),
            TextSpan(
              text: "Dr. Alzahraa Sayed Hassan",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  " for her guidance, support, and valuable advice during the preparation of our graduation project. "
                  "Her encouragement and constructive feedback helped us complete this work successfully. "
                  "We are truly grateful for her time and effort.",
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),

      RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          children: [
            TextSpan(text: "We would like to express our deepest appreciation and sincere gratitude to "),
            TextSpan(
              text: "TA. Mohamed Mubarak Hassan",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  " for his outstanding guidance and continuous support throughout the preparation of this project. "
                  "His dedication in planning the project, closely following up on our progress, carefully reviewing our work and revisions, and providing valuable feedback and final evaluation played a crucial role in improving the quality of this work. "
                  "His constructive comments and constant encouragement greatly helped us complete this project in its best possible form. "
                  "We are truly grateful for his time, effort, and guidance.",
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),

      RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          children: [
            TextSpan(text: "We are also grateful to "),
            TextSpan(
              text: "Sphinx University – Faculty of Applied Health Sciences Technology",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  " for providing the academic environment and resources that made this project possible.",
            ),
          ],
        ),
      ),

      const SizedBox(height: 16),

      RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          children: [
            TextSpan(text: "Additionally, we would like to express our deepest gratitude and heartfelt appreciation to "),
            TextSpan(
              text: "our families",
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text:
                  " for their endless love, patience, and support throughout our academic journey. "
                  "Their constant encouragement, sacrifices, and belief in us have been the foundation of our success. "
                  "They stood by our side during every challenge, motivated us in difficult moments, and celebrated every small achievement with us. "
                  "Without their understanding, prayers, and unwavering support, this accomplishment would not have been possible. "
                  "We are truly grateful for everything they have done for us, and this achievement is as much theirs as it is ours.",
            ),
          ],
        ),
      ),
    ],
  ),
),
                        const SizedBox(height: 24),
const _SectionTitle("Created By"),
const SizedBox(height: 8),

_supervisorCard(
  label: "Designer",
  title: "Eng. Mohamed Hassan Abdelrazek",
  subtitle:
      "The Designer who crafted the visual identity and user experience of the application with creativity, clarity, and attention to detail.",
),

const SizedBox(height: 12),

_supervisorCard(
  label: "Software Engineer",
  title: "Eng. Abdullah Ahmed Mahmoud",
  subtitle:
      "Software Engineer who led the development and implementation of the application, transforming ideas into a reliable and fully functional solution.",
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
                  color: Colors.white, size: 26),
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Icon(icon, color: Colors.white, size: 28),
          ],
        ),
      );

  Widget _image() => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/logo.png',
          height: 180,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
      );

  static Widget _card(String text) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.06),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
        ),
        child: Text(
          text,
          style:
              const TextStyle(color: Colors.white, fontSize: 18, height: 1.6),
        ),
      );
}

Widget _teamList(List<String> names) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: names
        .map(
          (name) => Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.redAccent.withOpacity(0.45)),
            ),
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        )
        .toList(),
  );
}

Widget _supervisorCard({
  required String title,
  required String subtitle,
  String label = "Supervisor",
}) {
  IconData icon;

  // 👇 Choose icon based on label
  switch (label) {
    case "Designer":
      icon = Icons.palette_rounded;
      break;
    case "Software Engineer":
      icon = Icons.code_rounded;
      break;
    default:
      icon = Icons.school_rounded;
  }

  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.05),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.redAccent, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.4,
          ),
        ),
      ],
    ),
  );
}
class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}