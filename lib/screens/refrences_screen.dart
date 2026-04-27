import 'package:flutter/material.dart';
import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';

class CasesScreen extends StatefulWidget {
  const CasesScreen({super.key});

  @override
  State<CasesScreen> createState() => _CasesScreenState();
}

class _CasesScreenState extends State<CasesScreen> {
  final TextEditingController _query = TextEditingController();

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  static const List<_ReferenceItem> _refs = [
    _ReferenceItem(
      number: 1,
      citation:
          "Schulz, R. A., Stein, J. A., & Pelc, N. J. (2021). How CT happened: the early development of medical computed tomography. Journal of Medical Imaging, 8(5), 052110-052110.",
    ),
    _ReferenceItem(
      number: 2,
      citation:
          "Seeram, E. (2010). Computed tomography: physical principles and recent technical advances. Journal of Medical Imaging and Radiation Sciences, 41(2), 87-109.",
    ),
    _ReferenceItem(
      number: 3,
      citation:
          "Al-Naser, Y., & Tafti, D. (2023). CT Instrumentation and Physics. StatPearls.",
    ),
    _ReferenceItem(
      number: 4,
      citation:
          "Zheng, X., Al-Hayek, Y., Cummins, C., Li, X., Nardi, L., Albari, K., ... & Seaton, T. (2020). Body size and tube voltage dependent corrections for Hounsfield Unit in medical X-ray computed tomography: theory and experiments. Scientific Reports, 10(1), 15696.",
    ),
    _ReferenceItem(
      number: 5,
      citation:
          "Hsieh, J., & Flohr, T. (2021). Computed tomography recent history and future perspectives. Journal of Medical Imaging, 8(5), 052109-052109.",
    ),
    _ReferenceItem(
      number: 6,
      citation:
          "Seeram, E. (2015). Computed tomography: physical principles, clinical applications, and quality control. Elsevier.",
    ),
    _ReferenceItem(
      number: 7,
      citation:
          "Hsieh, J. (2003). Computed tomography: principles, design, artifacts, and recent advances.",
    ),
    _ReferenceItem(
      number: 8,
      citation:
          "Bushong, S. C. (1984). Radiologic science for technologists. Physics, Biology, and Protection, 9.",
    ),
    _ReferenceItem(
      number: 9,
      citation:
          "Anderson, M. W., Fox, M. G., & Nacey, N. C. (Eds.). (2024). Sectional Anatomy by MRI and CT E-Book. Elsevier Health Sciences.",
    ),
    _ReferenceItem(
      number: 10,
      citation: "Atlas of Human Anatomy on CT Imaging.",
    ),
    _ReferenceItem(
      number: 11,
      citation:
          "Chest anatomy - radiographs and CT https://radnotes.substack.com/",
    ),
    _ReferenceItem(
      number: 12,
      citation:
          "Junn, J. C., & Som, P. M. (2022). Maxillofacial Skeleton and Facial Anatomy. Neuroimaging Clinics of North America, 32(4), 735-748.",
    ),
    _ReferenceItem(
      number: 13,
      citation:
          "Romans, L. E. (2025). Computed Tomography for Technologists: A comprehensive text. Lippincott Williams & Wilkins.",
    ),
    _ReferenceItem(
      number: 14,
      citation:
          "Adam, A., Dixon, A. K., Gillard, J. H., & Schaefer-Prokop, C. (2020). Grainger & Allison's Diagnostic Radiology, 2 Volume Set E-Book. Elsevier Health Sciences.",
    ),
    _ReferenceItem(
      number: 15,
      citation:
          "Henrot, P., Blum, A., Toussaint, B., Troufleau, P., Stines, J., & Roland, J. (2003). Dynamic maneuvers in local staging of head and neck malignancies with current imaging techniques: principles and clinical applications. Radiographics, 23(5), 1201-1213.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final q = _query.text.trim().toLowerCase();
    final filtered = q.isEmpty
        ? _refs
        : _refs
            .where((r) =>
                r.citation.toLowerCase().contains(q) ||
                r.number.toString() == q)
            .toList(growable: false);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FadeInPage(
        child: Container(
          decoration: AppScreenBackground.decoration,
          child: SafeArea(
            child: Column(
              children: [
                _header(context, "References", Icons.menu_book_rounded),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: filtered.length + 2,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                           
                            _searchField(),
                          ],
                        );
                      }

                      if (index == 1) {
                        return _statsRow(filtered.length);
                      }

                      final r = filtered[index - 2];
                      return _ReferenceTile(
                        number: r.number,
                        citation: r.citation,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.redAccent.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _query,
              onChanged: (_) => setState(() {}),
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.redAccent,
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: "Search (number or text)…",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
          if (_query.text.isNotEmpty)
            InkWell(
              onTap: () => setState(() => _query.clear()),
              borderRadius: BorderRadius.circular(999),
              child: const Padding(
                padding: EdgeInsets.all(6),
                child: Icon(Icons.close, color: Colors.white70, size: 18),
              ),
            ),
        ],
      ),
    );
  }

  Widget _statsRow(int count) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.redAccent.withOpacity(0.10),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.redAccent.withOpacity(0.25)),
            ),
            child: Row(
              children: [
                const Icon(Icons.library_books_rounded,
                    color: Colors.redAccent),
                const SizedBox(width: 10),
                Text(
                  "$count references",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
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
}

class _ReferenceItem {
  final int number;
  final String citation;

  const _ReferenceItem({
    required this.number,
    required this.citation,
  });
}

class _ReferenceTile extends StatelessWidget {
  final int number;
  final String citation;

  const _ReferenceTile({
    required this.number,
    required this.citation,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.redAccent.withOpacity(0.45)),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          childrenPadding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 14),
          iconColor: Colors.redAccent,
          collapsedIconColor: Colors.white70,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.redAccent.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.35)),
                ),
                child: Text(
                  "#$number",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  citation,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          children: [
            Text(
              citation,
              style: const TextStyle(color: Colors.white70, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
