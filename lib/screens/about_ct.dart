import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gal/gal.dart';

import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';
class DefinitionScreen extends StatelessWidget {
  const DefinitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: FadeInPage(
        child: Container(
          decoration: AppScreenBackground.decoration,
          child: SafeArea(
            child: Column(
              children: [
                _header(context, "About CT", Icons.medical_services_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        
                        _AboutSectionTile(
                          title: "WHAT IS CT?",
                          children: [
                            _infoCard(
                              "Computed tomography (CT), also known as computerized axial tomography (CAT), is a medical imaging technique that uses X-rays and computer processing to generate detailed cross-sectional images, or \"slices,\" of the body. It revolutionized diagnostics by providing high-resolution views of internal structures, surpassing traditional X-ray projections.\nComputed tomography creates tomographic images by measuring the attenuation of X-ray beams passing through the body from multiple angles, reconstructing a 2D or 3D density map. Unlike conventional radiography, which produces overlapping shadows, CT isolates tissue planes, enabling precise visualization of anatomy like bones, organs, and vessels. The process yields grayscale images where pixel values reflect tissue density, quantified in Hounsfield Units (HU): air at -1000 HU, water at 0 HU, and bone up to +1000 HU or more."
                            ),
                            
                          ],
                        ),
                        _AboutSectionTile(
                          title: "Historical Development",
                          children: [
                            _infoCard(
                              "CT originated in the 1970s with Godfrey Hounsfield's first clinical scanner, earning a Nobel Prize for enabling cross-sectional imaging. Early systems used step-and-shoot acquisition, but helical/spiral scanning in the 1990s, enabled by slip-ring technology, allowed continuous volume data collection for breath-hold imaging. Multi-slice detectors (from 4 to 64 rows) in the late 1990s achieved isotropic resolution, while wide-cone and dual-source systems improved coverage and temporal resolution for cardiac applications."
                            ),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "Basic Physics Principles",
                          children: [
                            _infoCard(
                              "CT relies on X-ray attenuation, governed by the Beer-Lambert law: I = I₀ e^(-μx), where I is transmitted intensity, I₀ initial intensity, μ the linear attenuation coefficient, and x path length. Tissues differ in μ due to photoelectric effect (dominant at low energies) and Compton scatter (higher energies), varying by atomic number and density. Detectors measure transmitted X-rays after the gantry rotates 180°–360° around the patient, producing sinograms—projection data profiles."
                            ),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "Clinical Relevance",
                          children: [
                            _infoCard(
                              "CT excels in trauma, oncology, and cardiology, offering rapid volumetric imaging. Dual-energy CT differentiates materials (e.g., iodine vs. calcium), aiding embolism detection. Dose reduction via IR and wide coverage minimizes risks, with ongoing AI enhancing workflows."
                            ),
                          ],
                        ),
                       _AboutSectionTile(
  title: "CT COMPONENTS",
  children: [
    const _SubTitle("Control room:"),
    const _SubTitle("Computer System:"),
    const _IndentedBullet("Processes raw data from the Data Acquisition System (DAS)."),
    const _IndentedBullet("Reconstructs the data into cross-sectional images."),
    const _IndentedBullet("Stores and display the images."),
    const SizedBox(height: 8),
    const _SubTitle("Operator Console:"),
    const _IndentedBullet("The workstation is used by technologists."),
    const _IndentedBullet("Controls scan parameters (kVp, mA, slice thickness)."),
    const _IndentedBullet("Displays images and patient information."),
    const SizedBox(height: 8),
    const _SubTitle("Data Acquisition System (DAS):"),
    const _IndentedBullet("Collects electrical signals from the detectors."),
    const _IndentedBullet("Converts them into digital data."),
    const _IndentedBullet("Sends data to the computer for image reconstruction."),
    const SizedBox(height: 16),
    const _AboutImageSmall(imagePath: 'assets/aboutct/computersystem.jpg'),
    const SizedBox(height: 12),
    const _SubTitle("Scan room:"),
    const SizedBox(height: 8),
    const _AboutImageSmall(imagePath: 'assets/aboutct/gantry.jpg'),
    const _SubTitle("Gantry:"),
    const _IndentedBullet("The large circular frame of the CT scanner."),
    const _IndentedBullet("The patient passes through it."),
    const _IndentedBullet("It contains the X-ray tube, detectors, and other parts."),
    const _IndentedBullet("It rotates around the patient during scanning."),
    const SizedBox(height: 12),
    const _SubTitle("Components:"),
    const _SubTitle("X-ray Tube:"),
    const _IndentedBullet("The source of X-rays."),
    const _IndentedBullet("Produces X-ray beams that pass through the patient's body."),
    const _IndentedBullet("Rotates inside the gantry to take images from different angles."),
    const SizedBox(height: 8),
    const _SubTitle("Detectors:"),
    const _IndentedBullet("Receive the X-rays after they pass through the body."),
    const _IndentedBullet("Convert X-rays into electrical signals."),
    const _IndentedBullet("These signals are used to create the CT image."),
    const SizedBox(height: 12),
    const _SubTitle("Collimators:"),
    const _IndentedBullet("Control the size, shape, and thickness of the X-ray beam."),
    const _IndentedBullet("Reduce scattered radiation."),
    const SizedBox(height: 8),
    const _SubTitle("High Voltage Generator:"),
    const _AboutImageSmall(imagePath: 'assets/aboutct/detectors2.png'),
    const _IndentedBullet("Supplies high voltage to the X-ray tube."),
    const _IndentedBullet("Allows production of X-rays with proper energy."),
    const _AboutImageSmall(imagePath: 'assets/aboutct/detectors1.png'),
    const SizedBox(height: 8),
    const _SubTitle("Patient Table (Couch):"),
    const _IndentedBullet("The table where the patient lies."),
    const _IndentedBullet("Moves smoothly in and out of the gantry."),
    const _IndentedBullet("Helps position the patient accurately."),
    const SizedBox(height: 8),
    const _SubTitle("Automatic Injector:"),
    const _SubTitle("Components:"),
    const _IndentedBullet("Injector head"),
    const _IndentedBullet("Syringe (contrast media)"),
    const _IndentedBullet("Control panel"),
    const _IndentedBullet("Connecting tubing"),
    const SizedBox(height: 8),
    const _SubTitle("Used in:"),
    const _IndentedBullet("Injection of contrast media during CT scan"),
    const _IndentedBullet("CT Angiography"),
    const _IndentedBullet("CT Abdomen and Pelvis with contrast"),
    const _IndentedBullet("CT Chest with contrast"),
    const _AboutImageSmall(imagePath: 'assets/aboutct/detectors3.png'),
    const SizedBox(height: 8),
    const _SubTitle("Cooling System:"),
    const _IndentedBullet("Prevents overheating of the X-ray tube."),
    const _IndentedBullet("Uses oil, air-, or water-cooling system."),
    const SizedBox(height: 8),
    const _AboutImageSmall(imagePath: 'assets/aboutct/coolingsystem.png'),
  ],
),
                        _AboutSectionTile(
                          title: "CT INDICATIONS",
                          children: [
                            const BulletItem("Evaluation of trauma and internal injuries, especially after accidents."),
                            const BulletItem("Detection of fractures not visible on regular X-ray."),
                            const BulletItem("Diagnosis of internal bleeding or hemorrhage."),
                            const BulletItem("Detection and characterization of tumors or masses (cancer)."),
                            const BulletItem("Monitoring tumor size and response to treatment."),
                            const BulletItem("Infection or abscess detection within organs."),
                            const BulletItem("Evaluation of inflammatory diseases (e.g., appendicitis, diverticulitis)."),
                            const BulletItem("Assessment of abdominal pain or bowel problems."),
                            const BulletItem("Evaluation of lung pathology (e.g., pneumonia, nodules)."),
                            const BulletItem("Assessment of kidney stones and urinary tract issues."),
                            const BulletItem("Evaluation of vascular conditions (with or without contrast)."),
                            const BulletItem("Guidance for biopsy or interventional procedures."),
                            const BulletItem("Pre-operative planning for complex surgeries."),
                            const BulletItem("Post-operative follow-up to check results or complications."),
                            const BulletItem("Evaluation of degenerative bone and joint diseases."),
                            const BulletItem("Assessment of spinal issues (discs, canal stenosis)."),
                            const BulletItem("Evaluation of brain conditions (e.g., stroke, hemorrhage, trauma)."),
                            const BulletItem("Assessment of sinus and skull pathology."),
                            const BulletItem("Evaluation of soft tissue abnormalities throughout the body."),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "CT CONTRAINDICATIONS",
                          children: [
                            const BulletItem("Pregnancy: Absolute contraindication, particularly in the first trimester, due to radiation risks to the fetus. Alternatives like ultrasound or MRI are preferred."),
                            const BulletItem("Contrast Dye Allergy: Previous severe allergic reactions to iodinated contrast media (e.g., anaphylaxis, severe hives)."),
                            const BulletItem("Renal Impairment/Kidney Disease: For contrast-enhanced scans, patients with reduced kidney function (e.g., kidney failure, acute renal injury) are at risk for contrast-induced nephropathy."),
                            const BulletItem("Thyroid Disorders: Active hyperthyroidism or multinodular goiter may cause a thyrotoxic crisis when exposed to iodinated contrast."),
                            const BulletItem("Claustrophobia: Extreme fear of enclosed spaces, though this can sometimes be managed with sedation."),
                            const BulletItem("Metformin Usage: Patients with diabetes taking metformin may need to pause the medication to prevent lactic acidosis if they have underlying kidney issues."),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "GENERAL CT PREPARATION",
                          children: [
                            const BulletItem("Remove metallic objects (jewelry, glasses, dentures, hairpins)."),
                            const BulletItem("Verify patient identity (name, age, ID)."),
                            const BulletItem("Check the clinical indication and request form."),
                            const BulletItem("Position the patient correctly on the CT table."),
                            const BulletItem("Immobilize the patient to avoid motion artifacts."),
                            const BulletItem("Obtain informed consent (especially if contrast is used)."),
                            const BulletItem("Assess history of allergies (especially to contrast media)."),
                            const BulletItem("Check renal function (serum creatinine / eGFR) if contrast is required."),
                            const BulletItem("Ask about pregnancy in females of childbearing age."),
                            const BulletItem("Fasting 4–6 hours before contrast studies."),
                            const BulletItem("Ensure IV line is secured (if contrast will be given)."),
                            const BulletItem("Explain the procedure to the patient and give breathing instructions if needed."),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "ADVANTAGES OF CT",
                          children: [
                            const BulletItem("High spatial resolution: Provides very detailed images, especially for bones and lungs."),
                            const BulletItem("High contrast resolution: Can differentiate small differences in tissue density."),
                            const BulletItem("Cross-sectional imaging: Produces axial images without superimposition of structures."),
                            const BulletItem("Fast scanning time: Very quick examination, ideal for emergency cases."),
                            const BulletItem("Excellent for trauma assessment: Detects internal bleeding, fractures, and organ injuries."),
                            const BulletItem("3D reconstruction capability: Allows multiplanar reformations (axial, coronal, sagittal) and 3D images."),
                            const BulletItem("CT angiography: Visualizes blood vessels clearly with IV contrast."),
                            const BulletItem("Guided interventional procedures: Used to guide biopsies and drainage procedures accurately."),
                            const BulletItem("Quantitative measurement (Hounsfield Units): Provides numerical values for tissue density."),
                            const BulletItem("Widely available: Accessible in most hospitals and medical centers."),
                            const BulletItem("Non-Invasive: They often eliminate the need for exploratory surgeries and are painless."),
                            const BulletItem("Less Motion Sensitive: CT scans are less sensitive to patient movement than MRIs."),
                          ],
                        ),
                       _AboutSectionTile(
  title: "CT LIMITATIONS",
  children: [
    Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          _SubTitle("Ionizing Radiation Exposure"),
          Text(
            "The most significant drawback is the use of X-rays. Unlike MRI or Ultrasound, CT scans expose the body to ionizing radiation.\n\n"
            "While a single scan is generally safe, repeated scans over a lifetime may slightly increase the risk of cancer.\n\n"
            "Because of radiation risk to the fetus, CT scans are usually avoided during pregnancy unless it is a life-saving emergency.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          SizedBox(height: 14),

          _SubTitle("Soft Tissue Resolution"),
          Text(
            "Although CT is excellent for imaging bone and lung structures, it often lacks the contrast resolution required for certain soft tissues.\n\n"
            "For detecting early strokes, small tumors, or ligament injuries such as ACL tears, MRI is generally superior because it differentiates subtle variations in soft tissue density.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          SizedBox(height: 14),

          _SubTitle("Contrast Agent Risks"),
          Text(
            "To visualize blood vessels and organs more clearly, CT often requires iodinated contrast agents.\n\n"
            "These contrast materials can stress the kidneys, especially in patients with pre-existing renal disease.\n\n"
            "Some patients may also experience allergic reactions ranging from mild itching to severe anaphylaxis.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          SizedBox(height: 14),

          _SubTitle("Artifacts and Motion"),
          Text(
            "CT images are sensitive to motion and certain materials that interfere with the X-ray beam.\n\n"
            "Patient movement or breathing during the scan may produce motion blur.\n\n"
            "Metal implants such as pacemakers, dental fillings, or joint prostheses can produce streak artifacts that obscure diagnostic details.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),

          SizedBox(height: 14),

          _SubTitle("Cost and Accessibility"),
          Text(
            "CT scanners are expensive to install and maintain, making CT examinations more costly than conventional X-ray or ultrasound.\n\n"
            "Most systems are large, fixed installations, which limits portability and makes them less suitable for remote locations or critically unstable patients.",
            style: TextStyle(color: Colors.white70, fontSize: 16, height: 1.6),
          ),
        ],
      ),
    ),
  ],
),
                        const SizedBox(height: 40),
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
            Text(title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Icon(icon, color: Colors.white, size: 28),
          ],
        ),
      );

static Widget _infoCard(String text) => Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 500, // 👈 controls line length for better wrapping
          ),
          child: Text(
            text,
            textAlign: TextAlign.start, // 👈 normal clean alignment
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              height: 1.6, // 👈 improves readability
            ),
          ),
        ),
      ),
    );
}

class _AboutSectionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _AboutSectionTile({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    Color titleColor = Colors.redAccent;

    if (title == "Historical Development" ||
        title == "Basic Physics Principles" ||
        title == "Clinical Relevance") {
      titleColor = Colors.white;
    }

    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        childrenPadding:
            const EdgeInsets.only(left: 0, right: 0, bottom: 12, top: 4),
        iconColor: Colors.redAccent,
        collapsedIconColor: Colors.redAccent,
        title: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: children,
      ),
    );
  }
}
class BulletItem extends StatelessWidget {
  final String text;

  const BulletItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 👈 IMPORTANT
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6), // 👈 aligns with first line
            child: Icon(Icons.circle, color: Colors.redAccent, size: 8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.4, // 👈 improves alignment consistency
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IndentedBullet extends StatelessWidget {
  final String text;

  const _IndentedBullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 👈 IMPORTANT
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6), // 👈 aligns to first line
            child: Icon(Icons.circle, color: Colors.redAccent, size: 6),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  final String text;

  const _SubTitle(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      );
}

class _AboutImage extends StatelessWidget {
  final String imagePath;

  const _AboutImage({required this.imagePath});

  void _openFullScreen(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (_) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: InteractiveViewer(
            maxScale: 4.0,
            minScale: 1.0,
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openFullScreen(context),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: AspectRatio(
            aspectRatio: 1.4,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class _AboutImageCarousel extends StatefulWidget {
  final List<String> imagePaths;

  const _AboutImageCarousel({required this.imagePaths});

  @override
  State<_AboutImageCarousel> createState() => _AboutImageCarouselState();
}

class _AboutImageCarouselState extends State<_AboutImageCarousel> {
  late final PageController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openFullScreen(String path) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (_) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: InteractiveViewer(
            maxScale: 4.0,
            minScale: 1.0,
            child: Image.asset(path),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imagePaths;
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.redAccent.withOpacity(0.5)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 1.4,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (index) => setState(() => _current = index),
                  itemBuilder: (context, index) {
                    final path = images[index];
                    return GestureDetector(
                      onTap: () => _openFullScreen(path),
                      child: Image.asset(path, fit: BoxFit.contain),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              final isActive = index == _current;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: isActive ? 10 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: isActive ? Colors.redAccent : Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}
class _AboutImageSmall extends StatelessWidget {
  final String imagePath;

  const _AboutImageSmall({required this.imagePath, super.key});

  void _openImage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => FullScreenGallery(
          title: "CT Components",
          imagePaths: [imagePath],
          initialIndex: 0,
        ),
      ),
    );
  }

  bool get _isLargeImage => imagePath.contains('detectors2'); // high voltage
  bool get _isTallImage => imagePath.contains('detectors3');  // tall one

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => _openImage(context),
        child: Container(
          width: double.infinity,

          // 🔥 FIX: give tall image more height so it can expand width naturally
          height: _isTallImage ? 260 : 230,

          margin: const EdgeInsets.symmetric(vertical: 8),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              child: FractionallySizedBox(
                // 🔥 wider but still natural
                widthFactor: _isTallImage
                    ? 0.99
                    : (_isLargeImage ? 0.8 : 0.95),

                heightFactor: _isTallImage
                    ? 0.95
                    : (_isLargeImage ? 0.8 : 0.95),

                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class FullScreenGallery extends StatefulWidget {
  final String title;
  final List<String> imagePaths;
  final int initialIndex;

  const FullScreenGallery({
    super.key,
    required this.title,
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  State<FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<FullScreenGallery> {
  late final PageController _pageController;
  late int _currentIndex;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: AppScreenBackground.decoration,
        child: SafeArea(
          child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.imagePaths.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final path = widget.imagePaths[index];
                return Center(
                  child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 1.0,
                    maxScale: 8.0,
                    boundaryMargin: const EdgeInsets.all(100),
                    clipBehavior: Clip.none,
                    child: Image.asset(
                      path,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.75,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: 10,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  _topButton(
                    icon: Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 11,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.45),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.08),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${_currentIndex + 1} / ${widget.imagePaths.length}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 12.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  
                ],
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }

  Widget _topButton({
    required IconData icon,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.45),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.08)),
        ),
        child: Icon(
          icon,
          color: onTap == null ? Colors.white38 : Colors.white,
          size: 22,
        ),
      ),
    );
  }
}