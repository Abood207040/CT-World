import 'package:flutter/material.dart';
import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';

class ProtocolScreen extends StatelessWidget {
  const ProtocolScreen({super.key});

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
                _header(context, "CT Examination", Icons.list_alt_rounded),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _AboutSectionTile(
                          title: "HEAD",
                          children: [
                         _NestedSectionTile(
  title: "BRAIN",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Intracranial hemorrhage."),
    _richBullet("Early infarction."),
    _richBullet("Dementia."),
    _richBullet("Hydrocephalus."),
    _richBullet("Cerebral trauma."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Arteriovenous malformation."),
    _richBullet("Mass or lesion."),
    _richBullet("Aneurysm."),
    _richBullet("Symptoms of headache, seizure."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
     _richBullet("Without contrast:"),
    _richIndentedBullet("Explain the procedure to the patient to reduce anxiety and ensure cooperation."),
    _richIndentedBullet("Verify patient identity and check the request form."),
    _richIndentedBullet("Ask the patient to remove all metallic objects from the head and neck area (earrings, hairpins, glasses, dentures, hearing aids)."),
    _richIndentedBullet("Check for pregnancy in females of childbearing age."),
    _richIndentedBullet("Position the patient supine on the CT table."),
    _richIndentedBullet("Head is placed in the head holder and aligned properly."),
    _richIndentedBullet("Instruct the patient to remain still during the scan."),
    _richIndentedBullet("Immobilize the head if necessary to avoid motion artifacts."),

     _richBullet("With contrast:"),
    _richIndentedBullet("Ensure fasting for 4–6 hours before the examination (according to department protocol)."),
    _richIndentedBullet("Ask about history of allergy to contrast media or previous contrast reactions."),
    _richIndentedBullet("Assess renal function (serum creatinine / EGFR) if indicated."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),

    /// 📸 SIDE-BY-SIDE SECTION
  Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, head first, arms by their sides, head in center of the scan field."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Brain",
              imagePath: 'assets/wordimgs/brain.png',
              heroTag: 'brain_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'brain_image',
          child: Image.asset(
            'assets/wordimgs/brain.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
       _richBullet("Scout: AP and lateral."),
    _richBullet("Scan plan: transverse plane."),
    _richBullet("Reference angle: Angle gantry parallel to infraorbital meatal line (be sure patient’s head is straight and not rotated in the head holder)."),
    _richBullet("Patient Instructions: Lie still during the scan, keep the head in position, avoid any movement, normal breathing is allowed, inform the technologist of any discomfort."),
    _richBullet("Start location: 1cm inferior to skull base."),
    _richBullet("End location: end of skull vertex."),
    _richBullet("Scan direction: caudo-cranial."),

    const SizedBox(height: 12),
     _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: (if contrast is ordered) 100 mL at 1.0 mL/s.\n Scan delay = 5 minutes."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAs: 330."),
    _richIndentedBullet("Slice thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),

    const SizedBox(height: 12),
    _richBullet("Algorithm: Standard."),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 140."),
    _richIndentedBullet("Window level: 40."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),
  ],
),
                      _NestedSectionTile(
  title: "SKULL BASE",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Trauma."),
    _richBullet("Hemorrhages."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumor characterization."),
    _richBullet("Arteriovenous malformation."),
    _richBullet("Dural sinuses thrombosis."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
   _richBullet("Without contrast:"),
    _richIndentedBullet("Explain the procedure to the patient."),
    _richIndentedBullet("Verify patient identity and request form."),
    _richIndentedBullet("No fasting is required."),
    _richIndentedBullet("Ask the patient to remove all metallic objects from head and neck (earrings, glasses, dentures, hearing aids)."),
    _richIndentedBullet("Check for pregnancy in females of childbearing age."),
    _richIndentedBullet("Position the patient supine on the CT table."),
    _richIndentedBullet("Head is placed in the head holder and aligned properly."),
    _richIndentedBullet("Instruct the patient to remain still during the scan."),
    _richIndentedBullet("Immobilize the head if necessary to avoid motion artifacts."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Ensure fasting for 4–6 hours before the examination (according to department protocol)."),
    _richIndentedBullet("Ask about history of allergy to contrast media or previous contrast reactions."),
    _richIndentedBullet("Assess renal function (serum creatinine / EGFR) if indicated."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),

    /// 📸 SIDE-BY-SIDE SECTION
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Patient lies supine, headfirst, head centered and immobilized, median sagittal plane aligned with table center, neck slightly extended."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Skull Base",
              imagePath: 'assets/wordimgs/skullbase.png',
              heroTag: 'skullbase_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'skullbase_image',
          child: Image.asset(
            'assets/wordimgs/skullbase.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
    _richBullet("Scout: AP and lateral."),
    _richBullet("Scan plan: transverse plane."),
    _richBullet("Reference angle: Angle gantry parallel to infraorbital meatal line (be sure patient’s head is straight and not rotated in the head holder)."),
    _richBullet("Patient Instructions: Lie still during the scan, keep the head in position, avoid any movement, normal breathing is allowed, inform the technologist of any discomfort."),
    _richBullet("Start location: Foramen magnum."),
    _richBullet("End location: Through petrous ridges."),
    _richBullet("Scan direction: caudo-cranial."),

    const SizedBox(height: 12),
     _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: (if contrast is ordered) 100 mL at 1.0 mL/s.\nScan delay: when all contrast is administered."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
     _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 140."),
    _richIndentedBullet("MAs: 340."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),

    const SizedBox(height: 12),
      _richBullet( "Algorithm: Standard."),

    const SizedBox(height: 12),
      _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 140."),
    _richIndentedBullet("Window level: 40."),

    const SizedBox(height: 12),
      _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
  ],
),
                          _NestedSectionTile(
  title: "SELLA TURCICA",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Evaluation of bony anatomy."),
    _richBullet("Pituitary enlargement (gross)."),
    _richBullet("Calcifications."),
    _richBullet("Fractures of the Sella."),
    _richBullet("Baseline study before contrast."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Pituitary adenoma."),
    _richBullet("Microadenoma detection."),
    _richBullet("Suprasellar extension."),
    _richBullet("Differentiation of lesions."),
    _richBullet("Post-operative evaluation."),
    _richBullet("Assessment of vascular structures."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
   _richBullet("Without contrast:"),
    _richIndentedBullet("Explain the procedure to the patient."),
    _richIndentedBullet("Remove any metallic objects from the head and neck."),
    _richIndentedBullet("Patient lies supine with head immobilized."),
    _richIndentedBullet("Review previous imaging if available."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Explain the procedure and contrast injection."),
    _richIndentedBullet("Fasting for 4–6 hours before the scan."),
    _richIndentedBullet("Ask about history of contrast allergies."),
    _richIndentedBullet("Check renal function (serum creatinine)."),
    _richIndentedBullet("Secure an IV cannula."),
    _richIndentedBullet("Remove any metallic objects from the head and neck."),
    _richIndentedBullet("Patient lies supine with head immobilized."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    _richBullet("Patient position: Supine position, Head first, Head immobilized, MSP centered, OML perpendicular to the table."),
    _richBullet("Group 1:"),

    /// 📸 SIDE-BY-SIDE SECTION
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Scout: AP and lateral."),
          _richBullet("Scan plan: Transverse."),
          _richBullet("Reference angle: Angle gantry parallel to infraorbital meatal line."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Sella Turcica",
              imagePath: 'assets/wordimgs/sellaturcic.png',
              heroTag: 'sellaturcic_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'sellaturcic_image',
          child: Image.asset(
            'assets/wordimgs/sellaturcic.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),

    _richBullet("Patient Instructions: Keep still during scanning / do not swallow during image acquisition / Normal breathing / Inform technologist if any discomfort."),
    _richBullet("Start location: Just below Sellar floor."),
    _richBullet("End location: Through dorsum sellae."),
    _richBullet("Scan direction: Cranio-caudal."),
    _richBullet("IV contrast: 150 mL at 1.0 mL/s. Scan delay = 60–90 sec."),
    _richBullet("Oral contrast: None."),

    const SizedBox(height: 12),
     _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAs: 150–250 mAs (average ≈ 200 mAs)."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
      _richBullet("Algorithm: Soft."),

    const SizedBox(height: 12),
     _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350ww."),
    _richIndentedBullet("Window level: 50wl."),

    const SizedBox(height: 12),
     _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),

    const SizedBox(height: 12),
    _richBullet("Group 2:"),
    _richBullet("Scout: lateral."),
    _richBullet("Scan plan: Coronal."),
    _richBullet("Reference angle: Angle gantry perpendicular to the infraorbital meatal line."),
    _richBullet("Patient Instructions: Keep still during scanning / do not swallow during image acquisition / Normal breathing / Inform technologist if any discomfort."),
    _richBullet("Start location: Anterior clinoid."),
    _richBullet("End location: Through dorsum sellae."),
    _richBullet("Scan direction: Craniocaudal."),

    const SizedBox(height: 12),
      _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAs: 150–250 mAs (average ≈ 200 mAs)."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
    _richIndentedBullet("Algorithm: Soft."),

    const SizedBox(height: 12),
     _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350ww."),
    _richIndentedBullet("Window level: 50wl."),

    const SizedBox(height: 12),
     _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
  ],
),
                          _NestedSectionTile(
  title: "ORBITS",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Orbital trauma."),
    _richBullet("Fractures (blow-out fracture)."),
    _richBullet("Foreign body."),
    _richBullet("Bony lesions."),
    _richBullet("Osteoma."),
    _richBullet("Fibrous dysplasia."),
    _richBullet("Sinus-related orbital extension."),
    _richBullet("Calcifications."),
    _richBullet("Optic nerve sheath meningioma (calcified)."),
    _richBullet("Pre-operative assessment of orbital bones."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Orbital tumors."),
    _richBullet("Inflammatory & infectious conditions."),
    _richBullet("Vascular lesions."),
    _richBullet("Lacrimal gland lesions."),
    _richBullet("Post-operative or post-traumatic complications."),
    _richBullet("Assessment of lesion extension (intracranial or sinus)."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
   _richBullet("Without contrast:"),
    _richIndentedBullet("Remove all metallic objects from head & face (glasses, earrings, hair pins, dentures)."),
    _richIndentedBullet("Patient should be calm and cooperative."),
    _richIndentedBullet("Explain the procedure to the patient."),
    _richIndentedBullet("Pregnancy status should be checked (for females)."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting 4–6 hours before examination."),
    _richIndentedBullet("Check renal function."),
    _richIndentedBullet("Ask about history of contrast allergy."),
    _richIndentedBullet("Ensure good IV access."),
    _richIndentedBullet("Remove all metallic objects."),
    _richIndentedBullet("Explain possible contrast sensations."),
    _richIndentedBullet("Patient should be well hydrated (unless contraindicated)."),
    _richIndentedBullet("Informed consent if required by protocol."),
    _richIndentedBullet("Check pregnancy status."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    _richBullet("Patient position: Supine, with arms by their side."),
    
    /// 📸 GROUP 1 SECTION
    _richBullet("Group 1:"),
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Scout: AP and lateral."),
          _richBullet("Scan plan: Transverse."),
          _richBullet("Reference angle: Angle gantry parallel to infraorbital meatal line."),
          _richBullet("Patient Instructions: Quit breathing / Hold still."),
          _richBullet("Start location: Just below orbital floor."),
        ],
      ),
    ),
    const SizedBox(width: 16),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Orbits",
              imagePath: 'assets/wordimgs/orbits.png',
              heroTag: 'orbits_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'orbits_image',
          child: Image.asset(
            'assets/wordimgs/orbits.png',
            height: 220,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
_richBullet("End location: Just above orbital roof."),
              _richBullet("Scan direction: Caudo-cranial."),
              _richBullet("Contrast:"),
              _richIndentedBullet("IV contrast (if ordered): 100mL at 1.0 mL/s. Split bolus-two 50-mL injections. Delay ≈ 15–20 S."),
              _richIndentedBullet("Oral contrast: None."),
    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAs: 200."),
    _richIndentedBullet("Slice thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),
    _richIndentedBullet("Algorithm: Soft tissue."),

    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350."),
    _richIndentedBullet("Window level: 50."),

    _richBullet("Reconstruction:"),
    _richBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),

    const SizedBox(height: 24),

    /// 📸 GROUP 2 SECTION
    _richBullet("Group 2:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Scout: lateral."),
          _richBullet("Scan plan: Coronal."),
          _richBullet("Reference angle: Angle gantry perpendicular to the infraorbital meatal line."),
        ],
      ),
    ),
    const SizedBox(width: 16),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Orbits",
              imagePath: 'assets/wordimgs/orbits2.jpg',
              heroTag: 'orbits2_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'orbits2_image',
          child: Image.asset(
            'assets/wordimgs/orbits2.jpg',
            height: 120,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Start location: Mid sphenoid sinus."),
              _richBullet("End location: Anterior frontal sinus."),
              _richBullet("Scan direction: Caudo-cranial."),
    const SizedBox(height: 12),
   _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 124."),
    _richIndentedBullet("MAs: 200."),
    _richIndentedBullet("Slice thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),
   SizedBox(height: 10,),
    _richBullet("Algorithm: Soft."),
 SizedBox(height: 10,),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350."),
    _richIndentedBullet("Window level: 50."),

     _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 2.5mm."),
  ],
),
                           _NestedSectionTile(
  title: "FACIAL BONES",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Trauma / fractures."),
    _richBullet("Facial pain / sinus diseases."),
    _richBullet("Congenital anomalies."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumors / masses."),
    _richBullet("Pre-surgical planning."),
    _richBullet("Infection or inflammatory process evaluation."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
     _richBullet("Without contrast:"),
    _richIndentedBullet("Remove metal objects."),
    _richIndentedBullet("Patient lies supine."),
    _richIndentedBullet("Check creatinine."),
 _richBullet("With contrast:"),
    _richIndentedBullet("Remove metal objects."),
    _richIndentedBullet("Ask the patient about any known allergies."),
    _richIndentedBullet("NPO 2–4 hours if required."),
    _richIndentedBullet("IV line for contrast."),
    _richIndentedBullet("Check creatinine."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    _richBullet("Patient position: Supine, Head-first into scanner, Neck neutral / slight extension if needed."),

    /// 📸 SIDE-BY-SIDE SECTION
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Scout: AP and lateral."),
          _richBullet("Scan plan: transverse plan."),
          _richBullet("Reference Angle: gantry parallel to infraorbital meatal line."),
          _richBullet("Patient Instructions: Remain still during the scan / Follow radiographer’s instructions."),
          _richBullet("Start location: Just below mandible."),
          _richBullet("End location: Just above frontal sinus."),
          _richBullet("Scan direction: Craniocaudal."),
          _richBullet("Contrast:"),
          _richIndentedBullet("IV contrast: None"),
          _richIndentedBullet("Oral contrast: None"),
        ],
      ),
    ),
    const SizedBox(width: 8),
    Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _SingleImageViewer(
                  title: "Facial Bone",
                  imagePath: 'assets/wordimgs/facialbone1.png',
                  heroTag: 'facialbone1_image',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: 'facialbone1_image',
              child: Image.asset(
                'assets/wordimgs/facialbone1.png',
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _SingleImageViewer(
                  title: "Facial Bone",
                  imagePath: 'assets/wordimgs/facialbone2.png',
                  heroTag: 'facialbone2_image',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: 'facialbone2_image',
              child: Image.asset(
                'assets/wordimgs/facialbone2.png',
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    ),
  ],
),
    const SizedBox(height: 12),
     _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120 kv."),
    _richIndentedBullet("MAs: 100-200 mAs."),
    _richIndentedBullet("Slice thickness: 1.25mm."),
    _richIndentedBullet("Slice interval: 0.625mm."),
    SizedBox(height: 10,),
     _richBullet("Algorithm: Standard."),
    SizedBox(height: 10,),

    const SizedBox(height: 12),
      _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 4000ww."),
    _richIndentedBullet("Window level: 400ww."),

    const SizedBox(height: 12),
      _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 0.625mm."),

    const SizedBox(height: 12),
      _richBullet("MPRs: bone algorithm."),
    _richIndentedBullet("Axial."),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
                         _NestedSectionTile(
  title: "PARANASAL SINUSES",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Evaluation of chronic sinusitis."),
    _richBullet("Detection of bony abnormalities."),
    _richBullet("Assessment of sinus anatomy before surgery."),
    _richBullet("Detection of air–fluid levels."),
    _richBullet("Evaluation of nasal septum deviation."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Evaluation of sinus tumors or masses."),
    _richBullet("Detection of complications of sinusitis."),
    _richBullet("Assessment of soft tissue involvement."),
    _richBullet("Differentiation between tumor and inflammation."),
    _richBullet("Evaluation of orbital or intracranial extension."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
     _richBullet("Without contrast:"),
    _richIndentedBullet("No special preparation is required."),
    _richIndentedBullet("Remove metallic objects from head and neck."),
    _richIndentedBullet("Patient should remain still during the scan."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting for 4–6 hours before examination."),
    _richIndentedBullet("Check renal function (serum creatinine)."),
    _richIndentedBullet("Ask about history of contrast allergy."),
    _richIndentedBullet("Obtain informed consent."),
    _richIndentedBullet("Ensure adequate hydration before and after the scan."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    /// 📸 SIDE-BY-SIDE SECTION
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Patient lies supine, head centered in head holder, neck slightly extended, head immobilized."),
          _richBullet("Scout: Lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Paranasal Sinuses",
              imagePath: 'assets/wordimgs/paranasalsinuses.jpg',
              heroTag: 'paranasalsinuses_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'paranasalsinuses_image',
          child: Image.asset(
            'assets/wordimgs/paranasalsinuses.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Coronal."),
              _richBullet("Reference angle: Angle gantry perpendicular to the orbital meatal line."),
              _richBullet("Patient Instructions: Remove metal objects / Keep head and body still / Breathe normally."),
              _richBullet("Start location: Mid Sella."),
              _richBullet("End location: Through frontal sinus."),
              _richBullet("Scan Direction: Craniocaudal."),
              _richBullet("Contrast:"),
              _richIndentedBullet("IV contrast: None."),
              _richIndentedBullet("Oral contrast: None."),
    const SizedBox(height: 12),
     _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120 KV."),
    _richIndentedBullet("MAs: 100–200 MAs."),
    _richIndentedBullet("Slice Thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5 mm."),
    SizedBox(height: 10,),
    _richBullet("Algorithm: Standard."),

    const SizedBox(height: 12),
     _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 4000 ww."),
    _richIndentedBullet("Window level: 400 wl."),

    const SizedBox(height: 12),
     _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 2.5mm."),
    _richIndentedBullet("Slice interval: 2.5 mm."),

    const SizedBox(height: 12),
     _richBullet("MPRs:"),
    _richIndentedBullet("Axial."),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
                          _NestedSectionTile(
  title: "TEMPORAL BONE",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Trauma."),
    _richBullet("Inflammatory disease."),
    _richBullet("Cholesteatoma."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("IAC tumor."),
    _richBullet("Hearing loss."),
    _richBullet("Acoustic neuroma."),
    _richBullet("Schwannoma."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Remove all metallic objects from head and neck (earrings, hearing aids, hair pins)."),
    _richIndentedBullet("Explain the procedure to the patient."),
    _richIndentedBullet("Ensure the patient can lie still during scanning."),
    _richIndentedBullet("No fasting is required."),
    _richIndentedBullet("No special medication is needed."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Check history of contrast allergy."),
    _richIndentedBullet("Assess renal function (serum creatinine / eGFR)."),
    _richIndentedBullet("Obtain informed consent."),
    _richIndentedBullet("Secure IV access."),
    _richIndentedBullet("Fasting 4–6 hours before contrast injection."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    /// 📸 SIDE-BY-SIDE SECTION
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Patient lies supine, head first into the gantry, head centered and immobilized, median sagittal plane aligned with the table center, with slight head adjustment to include both temporal bones symmetrically."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Temporal Bone",
              imagePath: 'assets/wordimgs/temporalbone.jpg',
              heroTag: 'temporalbone_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'temporalbone_image',
          child: Image.asset(
            'assets/wordimgs/temporalbone.jpg',
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scout: AP and lateral."),
              _richBullet("Scan plane: Transverse."),
              _richBullet("Reference angle: Angle gantry parallel to infraorbital meatal line (ensure patient’s head is straight and not rotated in the head holder)."),
              _richBullet("Patient Instructions: Remain still, avoid swallowing or moving the head during scanning, breathe normally, and follow technologist instructions."),
              _richBullet("Start location: Just below the mastoid process."),
              _richBullet("End location: Just above petrous ridge (include entire mastoid, internal auditory canal, and external auditory canal)."),
              _richBullet("Scan Direction: Caudocranial."),
              _richBullet("Contrast:"),
              _richIndentedBullet("IV contrast: (if ordered) 100 mL at 1.0 mL/s. Scan delay when all contrast is administered."),
              _richIndentedBullet("Oral contrast: None."),
    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 140."),
    _richIndentedBullet("MAs: 170."),
    _richIndentedBullet("Slice thickness: 0.625 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),
    SizedBox(height: 10,),
    _richBullet("Algorithm: Bone."),
SizedBox(height: 10,  ),
    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 4000."),
    _richIndentedBullet("Window level: 400."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 0.625 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),

    const SizedBox(height: 12),
    _DoubleNestedSectionTile(title: "MPRs:"),
    _richIndentedBullet("Axial."),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
                          ],
                        ),
                         _AboutSectionTile(
                           title: "NECK",
  children: [
    _SubTitle("Indications with contrast:"),
    _richBullet("Evaluation of neck masses or swelling."),
    _richBullet("Suspected tumors (benign or malignant)."),
    _richBullet("Assessment of lymphadenopathy."),
    _richBullet("Infection or abscess (e.g., deep neck space infection)."),
    _richBullet("Airway obstruction or compromise."),
    _richBullet("Thyroid or salivary gland lesions."),
    _richBullet("Vascular abnormalities."),

    const SizedBox(height: 12),
    _SubTitle("Indications without contrast:"),
    _richBullet("Evaluation of suspected airway obstruction."),
    _richBullet("Assessment of neck trauma (e.g., fractures, soft-tissue injury)."),
    _richBullet("Detection of foreign bodies (especially radiopaque)."),
    _richBullet("Evaluation of calcifications (e.g., salivary gland stones, thyroid calcifications)."),
    _richBullet("Assessment of cervical spine abnormalities."),
    _richBullet("Suspected hemorrhage or hematoma."),
    _richBullet("Evaluation of bony lesions of the neck and cervical."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("No special preparation is needed."),
    _richIndentedBullet("Remove all metal objects (jewelry, hairpins, dentures, hearing aids)."),
    _richIndentedBullet("Ask the patient about pregnancy or the presence of any medical implants."),
    _richIndentedBullet("Arrive a few minutes early for registration."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting 4–6 hours before the scan (no food; water allowed if instructed)."),
    _richIndentedBullet("Ask the patient about any allergies to contrast dye."),
    _richIndentedBullet("Blood test for kidney function (creatinine)."),
    _richIndentedBullet("Remove metal objects (necklace, earrings, dentures, etc.)."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Supine position, head-first, arms by the side, head immobilized in head holder, chin slightly elevated to avoid dental artifacts."),
          _richBullet("Scout: AP and lateral scout."),
          _richBullet("Scan Plane: Transverse."),
          _richBullet("Reference Angle: Angle gantry parallel to hard palate."),
          _richBullet("Patient Instruction: Breathe gently / avoid swallowing. Do not move. Suspend respiration if required (short breath hold)."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Neck",
              imagePath: 'assets/wordimgs/neck.jpg',
              heroTag: 'neck_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'neck_image',
          child: Image.asset(
            'assets/wordimgs/neck.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),

    const SizedBox(height: 12),
    _richBullet("Puffed cheeks:"),
    _richIndentedBullet("Indication: To better visualize oral cavity tumors when mucosal surfaces are touching."),
    _richIndentedBullet("Method: Patient blows air through pursed lips and moves the tongue away from the palate/teeth."),

    const SizedBox(height: 12),
    _richBullet("Phonation:"),
    _richIndentedBullet("Indication： Used when vocal cords or tumors are not clearly visible during quiet breathing."),
    _richIndentedBullet("Method： The patient says a steady 'e' sound for at least 10 seconds during the scan."),
    _richIndentedBullet("Key Results： True and false vocal cords become easier to see (adducted/closed)."),
    _richIndentedBullet("Laryngeal ventricles and piriform sinuses fill with air and become clearly visible."),
    _richIndentedBullet("Helps in better anatomical detail and staging."),

    const SizedBox(height: 12),
    _richBullet("Modified Valsalva maneuver:"),
    _richIndentedBullet("Technique： The patient expires (blows out) against the resistance of pursed lips (not a closed glottis) for at least 10 seconds."),
    _richIndentedBullet("Goal： To distend (open up) the laryngeal vestibule and piriform sinuses with air."),
    _richIndentedBullet("Main Indication： To better visualize the hypopharynx and detect tumors that might be hidden when mucosal surfaces are collapsed during normal breathing."),

    const SizedBox(height: 12),
    _richBullet("Start Location: Mid orbit."),
    _richBullet("End Location: Clavicular heads."),
    _richBullet("Scan Direction: Cranio-caudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 125 mL at 1.5 mL/s. Split bolus—1st injection 50 mL, 2-minute delay; 2nd injection 75 mL."),
    _richIndentedBullet("Scan delay: scans initiated 25 seconds after the start of the second injection."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kV: 120 kV."),
    _richIndentedBullet("MAs: 150–800 mAs (or automatic exposure control)."),
    _richIndentedBullet("Slice Thickness: 2.5 mm."),
    _richIndentedBullet("Slice Interval: 1.25 mm."),
    SizedBox(height: 10,),
     _richBullet("Algorithm: Soft tissue algorithm (standard)."),
    SizedBox(height: 10,),

    const SizedBox(height: 12),
    _richBullet("Window Settings:"),
    _richIndentedBullet("Window Width (WW): 350 ww."),
    _richIndentedBullet("Window Level (WL): 50 wl."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    const _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice Thickness: 2.5 mm."),
    _richIndentedBullet("Slice Interval: 1.25 mm."),
  ],
),
                        _AboutSectionTile(
                          title: "CHEST",
                          children: [
                            _NestedSectionTile(
  title: "ROUTINE CHEST",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Trauma."),
    _richBullet("Lung parenchymal evaluation."),
    _richBullet("Nodule follow-up."),
    _richBullet("Infection."),
    _richBullet("Lung cancer screening."),
    _richBullet("Chronic cough or shortness of breath."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Vascular assessment."),
    _richBullet("Tumor evaluation."),
    _richBullet("Lymphadenopathy."),
    _richBullet("Infection complications."),
    _richBullet("Pre-operative planning."),
    _richBullet("Pleural disease."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("No fasting required."),
    _richIndentedBullet("Patient should wear comfortable clothing or a hospital gown."),
    _richIndentedBullet("Remove metallic objects."),
    _richIndentedBullet("Ask the patient if she is pregnant or may be pregnant."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting (NPO) for 4 to 6 hours before the scan."),
    _richIndentedBullet("Hydration： patient drinks plenty of water the day before and the morning of the scan."),
    _richIndentedBullet("Allergy check."),
    _richIndentedBullet("Creatinine (kidney function) test."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Supine.\nBody: Patient lies on the scanner table with the body centered.\nArms: Both arms are usually raised above the head.\nHead: Placed in a headrest for stability."),
          _richBullet("Scan plane: Axial."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Routine Chest",
              imagePath: 'assets/wordimgs/routinechest.jpg',
              heroTag: 'routinechest_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'routinechest_image',
          child: Image.asset(
            'assets/wordimgs/routinechest.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
              
              _richBullet("Reference angle: Gantry angle is usually 0° (non-tilted)."),
              _richBullet("Scouts: AP and lateral."),
              _richBullet("Patient Instructions: Deep breathing. Patient takes a deep breath through the nose, holds for 2 seconds, then blows out slowly through the mouth."),
              _richBullet("Start location: Just above lung apices."),
              _richBullet("End location: Just below costophrenic angles."),
              _richBullet("Scan Direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 80 mL at 3.0 mL/s. 50 mL saline flush. Scan delay = 35 seconds."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kV: 100–120."),
    _richIndentedBullet("mAs: 50–200 mAs (automatic exposure control recommended)."),
    _richIndentedBullet("Slice Thickness: 2.5 mm."),
    _richIndentedBullet("Slice Interval: 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Lung algorithm (high-resolution), Soft tissue (mediastinal) algorithm."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Settings:"),

    _richBullet("Lung Window:"),
    _richIndentedBullet("Window Level (WL): 700 WL."),
    _richIndentedBullet("Window Width (WW): 1500 WW."),

    const SizedBox(height: 12),
    _richBullet("Mediastinal Window:"),
    _richIndentedBullet("Window Level (WL): 50 WL."),
    _richIndentedBullet("Window Width (WW): 350 WW."),
  ],
),
                          _NestedSectionTile(
  title: "HRCT CHEST",
  children: [
    _SubTitle("Indications:"),
    _richBullet("Asbestos exposure."),
    _richBullet("Inhalation injury."),
    _richBullet("Interstitial disease."),
    _richBullet("Diffuse pulmonary disease."),
    _richBullet("Suspected bronchiectasis."),
    _richBullet("Suspected small airway disease."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("No fasting required."),
    _richBullet("Patient should wear comfortable clothing or a hospital gown."),
    _richBullet("Remove metallic objects."),
    _richBullet("Ask the patient if she is pregnant or may be pregnant."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Supine.\nBody: Patient lies on the scanner table with the body centered.\nArms: Both arms are usually raised above the head.\nHead: Placed in a headrest for stability."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "HRCT Chest",
              imagePath: 'assets/wordimgs/hirctchest.jpg',
              heroTag: 'hrctchest_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'hrctchest_image',
          child: Image.asset(
            'assets/wordimgs/hirctchest.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
_richBullet("Scan plane: Axial."),
              _richBullet("Reference angle: Gantry angle is usually 0° (non-tilted)."),
              _richBullet("Scouts: AP and lateral."),
    const SizedBox(height: 12),
    _richBullet("Group 1: Supine Inspiration"),
    _richBullet("Start location: Just above lung apices."),
    _richBullet("End location: Just below costophrenic angles."),
    _richBullet("Scan direction: Cranio-caudal."),
    _richBullet("Patient Instruction: Patient inhale and hold breath."),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: None."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kV: 140."),
    _richIndentedBullet("mAs: 150."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richBullet("Lung Window:"),
    _richIndentedBullet("Window level: 700 WL."),
    _richIndentedBullet("Window width: 1500 WW."),

    const SizedBox(height: 16),
    _richBullet("Group 2: Supine Expiration"),
    _richBullet("Start location: Just above lung apices."),
    _richBullet("End location: Just below costophrenic angles."),
    _richBullet("Scan direction: Cranio-caudal."),
    _richBullet("Patient Instruction: Patient exhale and hold breath."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richBullet("Lung Window:"),
    _richIndentedBullet("Window level: 700 WL."),
    _richIndentedBullet("Window width: 1500 WW."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kV: 140."),
    _richIndentedBullet("mAs: 220."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 20 mm."),

    const SizedBox(height: 16),
    _richBullet("Group 3: Prone Inspiration"),
    _richBullet("Start location: Carina."),
    _richBullet("End location: Just below costophrenic angles."),
    _richBullet("Scan direction: Cranio-caudal."),
    _richBullet("Patient Instruction: Patient inhale and hold breath."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richBullet("Lung Window:"),
    _richIndentedBullet("Window level: 700 WL."),
    _richIndentedBullet("Window width: 1500 WW."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kV: 140."),
    _richIndentedBullet("mAs: 220."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 20 mm."),
  ],
),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "ABDOMEN & PELVIS",
                          children: [
                          _NestedSectionTile(
  title: "ABDOMEN & PELVIS ROUTINE",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("It's best for seeing calcifications (stones)."),
    _richBullet("Fat, and acute hemorrhage (blood)."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Highlights blood flow."),
    _richBullet("Organ anatomy."),
    _richBullet("Inflammation."),
    _richBullet("Tumor staging."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Metal Removal： Remove any clothing or jewelry with metal (zippers, bras with underwire, belts, piercings)."),
    _richIndentedBullet("Breath-Holding Practice： The technician will ask the patient to hold breath for a few seconds during the scan."),
    _richIndentedBullet("No Special Diet： If the scan is without contrast, fasting is usually not required."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting (NPO)： Nothing by mouth for 4–6 hours before the test (except water)."),
    _richIndentedBullet("Kidney Function Test (Creatinine)： Recent blood test required to ensure kidney safety."),
    _richIndentedBullet("Oral Contrast： Drink liquid contrast 60–90 minutes before the scan to coat stomach and intestines."),
    _richIndentedBullet("IV Access： A nurse places a catheter (IV) in the arm for contrast injection."),
    _richIndentedBullet("Medication Check： If the patient takes Metformin, it may be stopped on the day of the scan and for 48 hours after."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, head-first, abdomen centered within the gantry, both arms elevated above the head."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Abdomen & Pelvis",
              imagePath: 'assets/wordimgs/abdomenpelvisroutine.png',
              heroTag: 'abdomenpelvis_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'abdomenpelvis_image',
          child: Image.asset(
            'assets/wordimgs/abdomenpelvisroutine.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial plane, Coronal plane, Sagittal plane."),
              _richBullet("Reference angle: Zero rotation (no angulation), parallel to the patient’s body."),
              _richBullet("Patient instruction: Hold deep inspiration (take a deep breath and hold it)."),
              _richBullet("Start location: Just above diaphragm."),
              _richBullet("End location: Just below symphysis pubis."),
              _richBullet("Scan direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 125 mL at 3.0 mL/s with 50 mL saline flush."),
    _richIndentedBullet("Scan delay: 60–70 seconds."),
    _richIndentedBullet("Oral contrast: 675 mL barium sulfate suspension (1.5 bottles Readi-Cat 2). Additional 225 mL given just before scanning."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120."),
    _richIndentedBullet("MAS： ≥230."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 400 (soft tissue), 150 (liver), 1500 (lung)."),
    _richIndentedBullet("Window level: 50 (soft tissue), 70 (liver), 700 (lung)."),
  ],
),
                         _NestedSectionTile(
  title: "TRIPHASIC",
  children: [
    _SubTitle("Indications:"),
    _richBullet("Evaluation of suspected hypervascular hepatic tumors, including hepatocellular carcinoma and metastases from carcinoid."),
    _richBullet("Cell carcinoma."),
    _richBullet("Thyroid carcinoma."),
    _richBullet("Renal cell carcinoma."),
    _richBullet("Breast carcinoma."),
    _richBullet("Melanoma."),
    _richBullet("Sarcomas."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Fasting (NPO) Stop eating 4–6 hours before the scan."),
    _richBullet("Clear water is usually allowed. This ensures the gallbladder is visible and prevents nausea from the contrast."),
    _richBullet("Kidney Health & Meds"),
    _richBullet("Blood Test： You must have a recent Creatinine/GFR test to ensure your kidneys can safely filter the contrast dye."),
    _richBullet("Metformin： If you take this for diabetes, you may need to stop it on the day of the scan and for 48 hours after."),
    _richBullet("Allergies Notify staff if allergic to iodine."),
    _richBullet("During the Scan."),
    _richBullet("Breath-holding： You will need to hold your breath for 10–15 seconds on command to get sharp images of the blood vessels."),
    _richBullet("Contrast Heat： You will feel a brief 'flush' or warm sensation when the dye is injected; this is normal."),
    _richBullet("Aftercare."),
    _richBullet("Hydration： Drink plenty of water (2 liters) for the rest of the day to flush the dye out of your system."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine position, head-first or feet first, arms above the head."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Triphasic",
              imagePath: 'assets/wordimgs/triphasic.png',
              heroTag: 'triphasic_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'triphasic_image',
          child: Image.asset(
            'assets/wordimgs/triphasic.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial, sagittal, coronal."),
              _richBullet("Patient instruction: Take a deep breath and hold it (deep inspiratory breath-hold) during image acquisition."),
    const SizedBox(height: 12),
    _richBullet("Group 1: Arterial Scan"),
    _richBullet("Start location: Just above diaphragm."),
    _richBullet("End location: At iliac crest (or through entire liver)."),
    _richBullet("Scan direction: Craniocaudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 125 mL at 4 mL/s; 50 mL saline at 4.0 mL/s."),
    _richIndentedBullet("Scan delay: 15 seconds."),
    _richIndentedBullet("Oral contrast: Volume or water; 450 mL 30 minutes prior, 225 mL 10 minutes prior, 225 mL just before scan."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120."),
    _richIndentedBullet("MAS： 400 (16-Detector protocol) – 500 (64-Detector protocol)."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350 (soft tissue), 150 (liver)."),
    _richIndentedBullet("Window level: 50 (soft tissue), 70 (liver)."),

    const SizedBox(height: 12),
    _richBullet("Group 2: Venous Scan"),
    _richBullet("Start location: Just above diaphragm."),
    _richBullet("End location: At iliac crest (or through entire liver)."),
    _richBullet("Scan direction: Craniocaudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: No additional."),
    _richIndentedBullet("Scan delay: 45 seconds."),
    _richIndentedBullet("Oral contrast: No additional."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120."),
    _richIndentedBullet("MAS： 400 (16-Detector protocol) – 500 (64-Detector protocol)."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350 soft tissue."),
    _richIndentedBullet("Window level: 50 soft tissue."),

    const SizedBox(height: 12),
    _richBullet("Group 3: Delayed Scan"),
    _richBullet("Start location: Just above diaphragm."),
    _richBullet("End location: Symphysis pubis."),
    _richBullet("Scan direction: Craniocaudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: No additional."),
    _richIndentedBullet("Scan delay: 320 seconds."),
    _richIndentedBullet("Oral contrast: No additional."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120."),
    _richIndentedBullet("MAS: 400 (16-Detector protocol) – 500 (64-Detector protocol)."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350 soft tissue."),
    _richIndentedBullet("Window level: 50 soft tissue."),
  ],
),
                         _NestedSectionTile(
  title: "UROGRAPHY",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Suspected renal or ureteric calculi."),
    _richBullet("Acute flank pain."),
    _richBullet("Detection of nephrocalcinosis."),
    _richBullet("Baseline scan before contrast CTU."),
    _richBullet("Patients with contraindication to contrast (renal failure, contrast allergy)."),
    _richBullet("Stones, calcifications, baseline attenuation."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Painless hematuria (very important)."),
    _richBullet("Suspected urothelial tumors (renal pelvis, ureter, bladder)."),
    _richBullet("Renal masses (solid vs cystic characterization)."),
    _richBullet("Congenital anomalies of urinary tract."),
    _richBullet("Ureteric strictures or obstruction."),
    _richBullet("Tumors, anatomy, obstruction, collecting system."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("No fasting needed (unless hospital protocol differs)."),
    _richIndentedBullet("Hydration Encourage patient to drink water to stay hydrated."),
    _richIndentedBullet("Remove metallic objects from waist and abdomen (belts, jewelry, etc.)."),
    _richIndentedBullet("Explain procedure Lying still on table, brief scan time."),
    _richIndentedBullet("Bladder Usually partially filled; patient may be asked to void before scan."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting Usually 4–6 hours before exam."),
    _richIndentedBullet("Hydration Drink water unless contraindicated."),
    _richIndentedBullet("Allergy check Screen for iodinated contrast allergy."),
    _richIndentedBullet("Renal function check： Serum creatinine / eGFR must be within safe limits."),
    _richIndentedBullet("Medications Ask about metformin (may need temporary hold)."),
    _richIndentedBullet("Remove metallic objects."),
    _richIndentedBullet("Explain procedure IV contrast injection, multiple scan phases, lying still."),
    _richIndentedBullet("Bladder： Usually asked to empty before scan."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, arms above head if possible, legs extended, head neutral."),
          _richBullet("Scouts: AP and lateral."),
          _richBullet("Scan plane: Axial primary."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Urography",
              imagePath: 'assets/wordimgs/urography.png',
              heroTag: 'urography_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'urography_image',
          child: Image.asset(
            'assets/wordimgs/urography.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
  _richBullet("Reference angle: Gantry angle 0° (perpendicular to patient long axis)."),
              _richBullet("Patient instructions: Hold deep inspiration / breath-hold / expiration as instructed."),
    const SizedBox(height: 12),
    _richBullet("Group 1: Noncontrast Scan"),
    _richBullet("Start location: 2 cm above kidneys."),
    _richBullet("End location: Just below symphysis pubis."),
    _richBullet("Scan direction: Cranio-caudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: None."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAS： 80."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window width: 350 (soft tissue)."),
    _richIndentedBullet("Window level: 50 (soft tissue)."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("algorithm： Standard."),
    _richIndentedBullet("Slice thickness: 5 mm."),
    _richIndentedBullet("Slice interval: 5 mm."),

    const SizedBox(height: 12),
    _richBullet("Group 2: Excretory Scan"),
    _richBullet("Start location: Just above diaphragm."),
    _richBullet("End location: At iliac crest."),
    _richBullet("Scan direction: Cranio-caudal."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast (split bolus)： 75 mL at 3 mL/s; 20 mL saline at 3 mL/s."),
    _richIndentedBullet("Injection delay： 600 seconds, then 100 mL at 3 mL/s; 20 mL saline at 3 mL/s."),
    _richIndentedBullet("Scan delay： Scan begins 100 seconds after second contrast injection."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KVP: 120."),
    _richIndentedBullet("MAS： 400 (16-Detector protocol) – 500 (64-Detector protocol)."),
    _richIndentedBullet("Slice thickness: 0.625 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window settings:"),
    _richIndentedBullet("Window width: 350 (soft tissue)."),
    _richIndentedBullet("Window level: 50 (soft tissue)."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction (Both groups):"),
    _richIndentedBullet("algorithm： Standard."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 2.5 mm."),
  ],
),
                          _NestedSectionTile(
  title: "BONY PELVIS",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Pelvic fractures (trauma)."),
    _richBullet("Bone lesions."),
    _richBullet("Congenital deformities."),
    _richBullet("Pelvic pain related to bone pathology."),
    _richBullet("Sacroiliac joint abnormalities."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumors."),
    _richBullet("Infection."),
    _richBullet("Soft tissue extension."),

    const SizedBox(height: 12),
    _SubTitle("Patient preparation:"),
    _richBullet("Remove metallic objects."),
    _richBullet("No special preparation for non-contrast study."),
    _richBullet("Fasting 4–6 hours if IV contrast is used."),
    _richBullet("Check renal function if contrast is planned."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, head-first, arms above head, legs extended."),
          _richBullet("Scout AP: view from iliac crest to proximal femur."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Bony Pelvis",
              imagePath: 'assets/wordimgs/bonypelvis.jpg',
              heroTag: 'bonypelvis_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'bonypelvis_image',
          child: Image.asset(
            'assets/wordimgs/bonypelvis.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial plane, multiplanar reconstruction (coronal & sagittal)."),
              _richBullet("Reference angle: Gantry 0° (no tilt)."),
              _richBullet("Patient instruction: Normal breathing, no breath-hold required."),
              _richBullet("Start location: Iliac crest (L4–L5 level)."),
              _richBullet("End location: Lesser trochanter of femur."),
              _richBullet("Scan direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: Optional (for tumors/infection)."),
    _richIndentedBullet("Scan delay (if contrast used) Venous phase 60–70 seconds."),
    _richIndentedBullet("Oral contrast: Not required."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp：120 mAs： 200–300 (automatic exposure preferred)"),
    _richIndentedBullet("Slice thickness: 1–2 mm."),
    _richIndentedBullet("Slice interval: 1–2 mm."),

    const SizedBox(height: 12),
    _richBullet("Algorithm:"),
    _richIndentedBullet("Bone algorithm."),
    _richIndentedBullet("Soft tissue algorithm (optional)."),

    const SizedBox(height: 12),
    _richBullet("Window Setting (Bone window):"),
    _richIndentedBullet("Window width (WW)： 2000–2500."),
    _richIndentedBullet("Window level (WL)： 300–500."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("algorithm： Bone."),
    _richIndentedBullet("Slice thickness: 1 mm."),
    _richIndentedBullet("Slice interval: 1 mm."),

    const SizedBox(height: 12),
    _richBullet("MPRs:"),
    _richIndentedBullet("Axial."),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
    _richIndentedBullet("3D reconstruction (optional)."),
  ],
),
                          ],
                        ),
                        _AboutSectionTile(
                          title: "SPINE",
                          children: [
                         _NestedSectionTile(
  title: "CERVICAL",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Acute trauma & injury."),
    _richBullet("Vertebral fracture."),
    _richBullet("Bone evaluation."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumors."),
    _richBullet("Infection."),
    _richBullet("Evaluate vascular lesions."),
    _richBullet("Myelography."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Clothing： Wear comfortable clothes without metal, as you may need to change into a gown."),
    _richIndentedBullet("Metal Removal： Remove jewelry, piercings, glasses, dentures, and hairpins, as metal can cause image artifacts."),
    _richIndentedBullet("Medication： Continue to take prescribed medications as normal."),
    _richIndentedBullet("Diet/Fasting： No fasting is required for a CT scan without contrast."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting： Avoid food or drink 4–6 hours before the exam."),
    _richIndentedBullet("Medication： Take daily medications as usual with a small amount of water."),
    _richIndentedBullet("Medical History & Allergies： Inform the technician of any allergies to contrast dye kidney or thyroid conditions."),
    _richIndentedBullet("Clothing & Items： Wear comfortable clothing."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, both arms next to the body, shoulders pulled down."),
          _richBullet("Scouts: AP and lateral."),
          _richBullet("Scan plane: Axial."),
          _richBullet("Reference angle: Gantry angle 0°."),
          _richBullet("Patient instructions: Normal breathing."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _SingleImageViewer(
                  title: "Cervical",
                  imagePath: 'assets/wordimgs/cervical1.png',
                  heroTag: 'cervical1_image',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: 'cervical1_image',
              child: Image.asset(
                'assets/wordimgs/cervical1.png',
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => _SingleImageViewer(
                  title: "Cervical",
                  imagePath: 'assets/wordimgs/cervical2.jpg',
                  heroTag: 'cervical2_image',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: 'cervical2_image',
              child: Image.asset(
                'assets/wordimgs/cervical2.jpg',
                height: 110,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    ),
  ],
),
 _richBullet("Start location: Just above skull base."),
              _richBullet("End location: Mid T1."),
              _richBullet("Scan direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 100 mL at 1.5 mL/s."),
    _richIndentedBullet("Scan delay: When injection is complete."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 140."),
    _richIndentedBullet("mAs：125–325."),
    _richIndentedBullet("Slice thickness： 2.5 mm."),
    _richIndentedBullet("Slice interval： 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 4000."),
    _richIndentedBullet("Window level: 400."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _ReconstructionAlgorithmBullet("Algorithm: Bone."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),

    const SizedBox(height: 12),
    _richBullet("Reformation:"),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
                          _NestedSectionTile(
  title: "THORACIC",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Acute trauma & injury."),
    _richBullet("Vertebral fracture."),
    _richBullet("Bone evaluation."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumors."),
    _richBullet("Infection."),
    _richBullet("Evaluate vascular lesions."),
    _richBullet("Myelography."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Clothing： Wear comfortable clothes without metal, as you may need to change into a gown."),
    _richIndentedBullet("Metal Removal： Remove jewelry, piercings, glasses, dentures, and hairpins, as metal can cause image artifacts."),
    _richIndentedBullet("Medication： Continue to take prescribed medications as normal."),
    _richIndentedBullet("Diet/Fasting： No fasting is required for a CT scan without contrast."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting： No food or drink4–6 hours before exam."),
    _richIndentedBullet("Medication： Take daily medications as usual with a small amount of water."),
    _richIndentedBullet("Medical History & Allergies： Inform the technician of any allergies to contrast dye, kidney, or thyroid conditions."),
    _richIndentedBullet("Clothing & Items： Wear comfortable clothing."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Supine, both arms elevated above the head."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Thoracic",
              imagePath: 'assets/wordimgs/thoracic.png',
              heroTag: 'thoracic_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'thoracic_image',
          child: Image.asset(
            'assets/wordimgs/thoracic.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial."),
              _richBullet("Reference angle: Gantry angle: 0°."),
              _richBullet("Patient instructions: Normal breath."),
              _richBullet("Start location: Just above T1."),
              _richBullet("End location: Just below T2."),
              _richBullet("Scan direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 100 mL at 1.5 mL/s."),
    _richIndentedBullet("Scan delay: When injection is complete."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 140."),
    _richIndentedBullet("mAs: 125–325."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 4000."),
    _richIndentedBullet("Window level: 400."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Bone."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),

    const SizedBox(height: 12),
    _richBullet("Reformation: Algorithm: Bone."),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
  _NestedSectionTile(
  title: "LUMBAR",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Acute trauma & injury."),
    _richBullet("Vertebral fracture."),
    _richBullet("Bone evaluation."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Tumors."),
    _richBullet("Infection."),
    _richBullet("Evaluate vascular lesions."),
    _richBullet("Myelography."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Clothing： Wear comfortable clothes without metal, as you may need to change into a gown."),
    _richIndentedBullet("Metal Removal： Remove jewelry, piercings, glasses, dentures, and hairpins, as metal can cause image artifacts."),
    _richIndentedBullet("Medication： Continue to take prescribed medications as normal."),
    _richIndentedBullet("Diet/Fasting： No fasting is required for a CT scan without contrast."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting： No food or drink4–6 hours before exam."),
    _richIndentedBullet("Medication： Take daily medications as usual with a small amount of water."),
    _richIndentedBullet("Medical History & Allergies： Inform the technician of any allergies to contrast dye, kidney, or thyroid conditions."),
    _richIndentedBullet("Clothing & Items： Wear comfortable clothing."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: supine position, both Arm elevated."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Lumbar",
              imagePath: 'assets/wordimgs/lumbar.png',
              heroTag: 'lumbar_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'lumbar_image',
          child: Image.asset(
            'assets/wordimgs/lumbar.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial primary."),
              _richBullet("Reference angle: Gantry: 0°."),
              _richBullet("Patient instructions: Normal breath."),
              _richBullet("Start location: Just above T1."),
              _richBullet("End location: Just below T2."),
              _richBullet("Scan direction: Cranio-caudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: 100 mL at 1.5 mL."),
    _richIndentedBullet("Scan delay: When injection is complete."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 140."),
    _richIndentedBullet("mAs: 125–325."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 4000."),
    _richIndentedBullet("Window level: 400."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Bone."),
    _richIndentedBullet("Slice thickness: 2.5 mm."),
    _richIndentedBullet("Slice interval: 1.25 mm."),

    const SizedBox(height: 12),
    _richBullet("Reformation: Algorithm: Bone. "),
    _richIndentedBullet("Coronal."),
    _richIndentedBullet("Sagittal."),
  ],
),
                          ],
                        ),
                      _AboutSectionTile(
  title: "LIMB JOINTS",
  children: [

    /// =============================
    /// UPPER LIMB
    /// =============================

    _NestedSectionTile(
      title: "UPPER LIMB",
      children: [

        /// SHOULDER
       _NestedSectionTile(
  title: "SHOULDER",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Trauma and Fractures： Evaluation of scapular fractures, proximal humeral fractures, and complex articular fractures."),
    _richBullet("Dislocations and Instability： Assessment of glenohumeral dislocations to check for bone loss."),
    _richBullet("Bone Tumors and Lesions： Characterizing osteolytic lesions, and evaluation of bone tumors."),
    _richBullet("Arthritis and Joint Degeneration： Evaluation of severe joint abnormalities and arthritis."),
    _richBullet("Pre-operative Planning： Detailed 3D mapping of bone structure before surgery."),
    _richBullet("Infection/Bone Abscess： Identifying bone or joint infections."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Vascular Evaluation： Detection of blood clots, vascular tumors, or arterial issues (CT angiography)."),
    _richBullet("Tumors and Infections： Characterizing bone/soft tissue tumors, infections, or abscesses."),
    _richBullet("Trauma and Instability： Assessing complex fractures, shoulder dislocations, or labral/ligament tears."),
    _richBullet("Post-Surgical Planning： Evaluating healing, scar tissue, or complications with implants."),
    _richBullet("CT Arthrography (Intra-articular Contrast)： Specifically for assessing joint capsules, ligaments, and labral tears, particularly when MRI cannot be performed."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting for 4–6 hours before the scan (if required by protocol)."),
    _richIndentedBullet("Check kidney function (creatinine level)."),
    _richIndentedBullet("Ask about history of contrast allergy."),
    _richIndentedBullet("Remove metal objects."),
    _richIndentedBullet("Wear hospital gown."),
    _richIndentedBullet("Ensure good hydration (before and after scan)."),
    _richIndentedBullet("Obtain informed consent (if required)."),

    _richBullet("Without contrast:"),
    _richIndentedBullet("Patient may eat and drink normally."),
    _richIndentedBullet("Remove metal objects (jewelry, braces, coins)."),
    _richIndentedBullet("Wear comfortable clothing or hospital gown."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Supine, affected arm at side. Opposite arm above head."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Shoulder",
              imagePath: 'assets/wordimgs/shoulder.jpg',
              heroTag: 'shoulder_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'shoulder_image',
          child: Image.asset(
            'assets/wordimgs/shoulder.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
  _richBullet("Reference angle: Axial plane parallel to long axis of the body."),
              _richBullet("Patient instructions:"),
              _richBullet("Scan takes 10–15 minutes, requiring the patient to lie still on the table."),
              _richBullet("Wear comfortable clothes and remove jewelry or metal items near the shoulder."),
              _richBullet("If contrast dye is used, fast for 4 hours prior."),
              _richBullet("The patient may need to hold breath briefly and remain in the required arm position."),
              _richBullet("Start location: Just above acromioclavicular joint."),
              _richBullet("End location: Just below scapular tip."),
              _richBullet("Scan Direction: Caudocranial."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV Contrast：80–100 mL, injection rate 2–3 mL/s using power injector."),
    _richIndentedBullet("Scan Delay：30–40 sec."),
    _richIndentedBullet("Oral Contrast：None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 100–120."),
    _richIndentedBullet("mAs: 150–250."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 2000."),
    _richIndentedBullet("Window level: 500."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Standard."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),

    const SizedBox(height: 12),
    _richBullet("MPRs: Bone Algorithm"),
    _richBullet("Scan Plane:"),
    _richIndentedBullet("Oblique-axial (Fig. A)."),
    _richIndentedBullet("Oblique-sagittal (Fig. B)."),
    _richIndentedBullet("Oblique-coronal (Fig. C)."),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/shoulder2.png'),
    Text("FIGURE 2206 A. Oblique-axial MPR can be programmed from the scout image and should be perpendicular to the glenoid fossa (arrow). B. Oblique-sagittal MPR can be programmed from an axial image and should be parallel to the surface of the glenoid fossa. C. Oblique-coronal MPR can be programmed from an oblique-sagittal MPR image and should be along the body of the scapula")
  ],
),
        /// ELBOW
      _NestedSectionTile(
  title: "ELBOW",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Bony structures, trauma, and complex fractures when X-rays are insufficient."),
    _richBullet("Assessing fractures (distal humerus, radial head, olecranon), dislocations, and loose bodies."),
    _richBullet("Elbow Trauma Evaluation of complex fractures."),
    _richBullet("Loose Bodies & Joint Pathology."),
    _richBullet("Chronic Pain & Arthritis Assessment of osteoarthritis."),
    _richBullet("Pre-operative Evaluation Detailed anatomical imaging to plan for surgery."),
    _richBullet("Infection/Tumor Evaluation Detection of bony abnormalities."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Intra-articular soft tissue structures, tumors, infections, and vascular complications."),
    _richBullet("It is commonly used when MRI is contraindicated."),
    _richBullet("CT Arthrography (Intra-articular Contrast) Used for assessing loose bodies, cartilage defects, and ligamentous injuries (e.g., LCL complex or MCL tears) causing chronic instability."),
    _richBullet("Soft Tissue Masses/Tumors Contrast enhances vascularized tumors or soft tissue infections."),
    _richBullet("Infectious/Inflammatory Processes."),
    _richBullet("Vascular Injury Assessment."),
    _richBullet("Post-operative Evaluation."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("No Fasting Required： You can eat, drink, and take your regular medications as normal before the examination."),
    _richIndentedBullet("Remove Metallic Objects： Remove all jewelry, watches, and metal accessories from the arm and wrist area before the scan."),
    _richIndentedBullet("Clothing： It is recommended to wear loose, comfortable clothing. You may be asked to change into a hospital gown."),
    _richIndentedBullet("Pregnancy Check： If you are pregnant or suspect you might be, you should inform your doctor before the examination."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Renal Function Assessment Measure creatinine levels and eGFR."),
    _richIndentedBullet("Fasting Avoid food for 4–6 hours before the appointment."),
    _richIndentedBullet("Medication Management (Metformin) Patients taking metformin should inform their doctor; may need to discontinue for 48 hours post-scan."),
    _richIndentedBullet("Allergy Screening Report previous adverse reactions to iodine or contrast dye; pre-medication may be required."),
    _richIndentedBullet("Metal Removal Remove all metal objects, jewelry, watches, and hairpins from scanned area."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient Position: Prone, affected arm overhead and extended; arm oblique."),
          _richBullet("Alternative: Supine, arm at side."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Elbow",
              imagePath: 'assets/wordimgs/elbow1.jpg',
              heroTag: 'elbow1_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'elbow1_image',
          child: Image.asset(
            'assets/wordimgs/elbow1.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
  _richBullet("Scout: AP and lateral."),
              _richBullet("Scan plane: Helical."),
              _richBullet("Patient instructions: Wear comfortable clothing, remove all metal jewelry/zippers near arm. Remain still during scan."),
              _richBullet("Start location: Just above elbow joint."),
              _richBullet("End location: Just below radial tuberosity."),
              _richBullet("Scan Direction: Caudocranial (distal-to-proximal)."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV Contrast Iodine-based dye via vein; enhances tissue visualization."),
    _richIndentedBullet("Scan Delay 45–60 seconds (venous phase)."),
    _richIndentedBullet("Oral Contrast None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 120."),
    _richIndentedBullet("mAs: 80–150."),
    _richIndentedBullet("Slice thickness/interval： 1.25 mm / 0.625 mm."),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 2000."),
    _richIndentedBullet("Window level: 500."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Standard."),
    _richIndentedBullet("Slice thickness/interval： 1.25 mm / 0.625 mm."),
    _richIndentedBullet("Window setting： 350 WW / 50 WL."),

    const SizedBox(height: 12),
    _richBullet("MPRs:Algorithm Bone."),
    _richIndentedBullet("Slice thickness: 2 mm."),
    _richIndentedBullet("Slice interval: 2 mm."),

    const SizedBox(height: 12),
    _richBullet("Scan Planes:"),
    _richIndentedBullet("Axial (Fig. 22-8A)."),
    _richIndentedBullet("Oblique-coronal (Fig. 22-8B)."),
    _richIndentedBullet("Oblique-sagittal (Fig. 22-8C)."),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/elbow2.png'),
    Text("FIGURE 22-8 A. Axial MPR can be programmed from the scout, and should be parallel to the radial head. B. Oblique-coronal MPR can be programmed from an axial image at the level of the humeral epicondyles (arrows) and the olecranon (double arrow). C. Oblique-sagittal MPR can be programmed from an axial image and be perpendicular to the plane of the oblique-coronal MPR.")
  ],
),
        /// WRIST
     _NestedSectionTile(
  title: "WRIST",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Complex distal, radial, and ulnar fractures."),
    _richBullet("Scaphoid Fractures."),
    _richBullet("Carpal instability."),
    _richBullet("Foreign bodies."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Bone mass."),
    _richBullet("Follow-up after surgery."),
    _richBullet("Osteoarthritis."),
    _richBullet("Suspected infection (abscess, osteomyelitis, tenosynovitis)."),
    _richBullet("Ligamentous injury and inflammation."),
    _richBullet("Image guidance and CT arthrogram."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Remove any metallic objects from wrist (jewelry, etc.)."),
    _richIndentedBullet("Ask women about pregnancy."),
    _richIndentedBullet("Insulate patient for comfort and immobilization."),
    _richIndentedBullet("Explanation of Procedure for Patient and Consent."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting: Usually 4–6 hours before exam."),
    _richIndentedBullet("Allergy check."),
    _richIndentedBullet("Check serum Creatinine."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Prone, affected arm overhead and extended, arm oblique."),
          _richBullet("Alternative: Supine, arm at side."),
          _richBullet("Scouts: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Wrist",
              imagePath: 'assets/wordimgs/wrist1.jpg',
              heroTag: 'wrist1_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'wrist1_image',
          child: Image.asset(
            'assets/wordimgs/wrist1.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial."),
              _richBullet("Reference angle: Derived from 30°–60° range for scapholunate (SL) angles in neutral position."),
              _richBullet("Start location: Just proximal to distal radioulnar joint."),
              _richBullet("End location: At proximal metacarpals."),
              _richBullet("Scan direction: Craniocaudal."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: Non-ionic iodinated contrast, 50–70 mL."),
    _richIndentedBullet("Scan delay: Venous phase, 60–70 sec."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("kVp： 140."),
    _richIndentedBullet("mAs: 300."),
    _richIndentedBullet("Slice thickness: 0.625 mm."),
    _richIndentedBullet("Slice interval: 0.3 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Bone plus."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Width： 2000 (bone)."),
    _richIndentedBullet("Window level: 500 (bone window)."),
    _richIndentedBullet("Window width: 350–450 (soft tissue)."),
    _richIndentedBullet("Window level: 40–60 (soft tissue window)."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Aalgorithm： Bone standard."),
    _richIndentedBullet("Slice thickness: 0.6 mm."),
    _richIndentedBullet("Slice interval: 0.3 mm."),
    _richIndentedBullet("3D."),
    _richIndentedBullet("Noise reduction."),

    const SizedBox(height: 12),
    _richBullet("MPRs:bone plus algorithm."),
    _richIndentedBullet("Slice thickness: 2 mm."),
    _richIndentedBullet("Slice interval: 2 mm."),

    const SizedBox(height: 12),
    _richBullet("Planes:"),
    _richIndentedBullet("Axial (Fig. 22-7A)."),
    _richIndentedBullet("Coronal (Fig. 22-7B)."),
    _richIndentedBullet("Sagittal (Fig. 22-7C)."),
    _richIndentedBullet("Oblique-sagittal (Fig. 22-7D)."),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/wrist2.png'),
    Text("FIGURE 227 A. Axial MPR can be programmed from the scout image and should be perpendicular to the radius. B. Coronal MPR can be programmed from an axial image and should be centered at the distal radioulnar joint through the radial tuberosity. C. Sagittal MPR can be programmed from an axial image and should be perpendicular to the plane used in the coronal MPR. D. Oblique-sagittal MPR can be programmed from a coronal MRP image and should follow the long axis of the scaphoid (arrow). ")
  ],
),
      ],
    ),

    /// =============================
    /// LOWER LIMB
    /// =============================

    _NestedSectionTile(
      title: "LOWER LIMB",
      children: [

        /// HIP
       _NestedSectionTile(
  title: "HIP",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("Fractures."),
    _richBullet("Surgery Planning."),
    _richBullet("Hardware Check."),
    _richBullet("Bone Growth."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Infection."),
    _richBullet("Tumors."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Diet： No fasting needed. Eat and drink normally."),
    _richIndentedBullet("Clothing： Wear loose clothes; remove all metal (zippers, belts, jewelry) from the waist down."),
    _richIndentedBullet("Records： Bring any previous X-rays or reports."),

    _richBullet("With IV contrast:"),
    _richIndentedBullet("Fasting： 2–4 hours before the scan (Water is okay)."),
    _richIndentedBullet("Lab Work： You must have a recent Creatinine (Kidney function) test."),
    _richIndentedBullet("Allergies： Inform the staff if you are allergic to Iodine or shellfish."),
    _richIndentedBullet("Medication： If you take Metformin, stop it on the day of the scan and for 48 hours after."),
    _richIndentedBullet("Aftercare： Drink plenty of water to flush the dye out of your body."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Patient supine, leg flat on table (no cushion or wedge under knees)."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Hip",
              imagePath: 'assets/wordimgs/hip.jpg',
              heroTag: 'hip_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'hip_image',
          child: Image.asset(
            'assets/wordimgs/hip.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
  _richBullet("Scout: AP and lateral."),
              _richBullet("Scan type: Helical."),
              _richBullet("Reference angle:"),
              _richBullet("Reference for Coronal： Long axis of the femoral neck."),
              _richBullet("Reference for Sagittal： Perpendicular to the coronal plane."),
              _richBullet("Gantry Rotation Time： 0.8s (for both 16 and 64-detector protocols)."),
              _richBullet("Axial MPR (Image A)： from the AP scout and should generally be parallel to the hip joint."),
              _richBullet("Start location: Just above sacroiliac joints."),
              _richBullet("End location: Approximately 4 cm below lesser trochanters (include entire fracture if present)."),
              _richBullet("Scan Direction: Cranio-caudal."),
              _richBullet("Patient Instructions:"),
              _richBullet("Position： Supine (lying flat on the back)."),
              _richBullet("Legs： Must be flat on the table."),
              _richBullet("Prohibition： No cushions or wedges allowed under the knees."),
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: Non-ionic iodinated IV contrast, 50–70 mL."),
    _richIndentedBullet("Scan delay: Venous phase, 60–70 sec."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("Tube voltage (kVp)： 120 kVp."),
    _richIndentedBullet("Tube current (mAs)： 250–100 mAs."),
    _richIndentedBullet("Slice thickness/interval： 1.25 mm / 0.625 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting:"),
    _richIndentedBullet("Window width: 2000 (bone)."),
    _richIndentedBullet("Window level: 500 (bone)."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Standard."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),

    const SizedBox(height: 12),
    _richBullet("MPRs:"),
    _richIndentedBullet("Slice Thickness: 2 mm."),
    _richIndentedBullet("Slice Interval: 2 mm."),
    _richIndentedBullet("Algorithm： Bone."),

    const SizedBox(height: 12),
    _richBullet("Planes:"),
    _richIndentedBullet("Axial： Parallel to the hip joint."),
    _richIndentedBullet("Coronal： Follows the long axis of the femoral neck."),
    _richIndentedBullet("Sagittal： Perpendicular to the coronal plane."),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/hip2.png'),
    Text("A. Axial MPR can be programmed from an AP scout. B. Coronal MPR can be programmed from an axial image and should follow the long axis of the femoral neck. C. Sagittal MPR can be programmed from an axial image and should be perpendicular to the coronal MPR plane."),
  ],
),
        /// KNEE
      _NestedSectionTile(
  title: "KNEE",
  children: [
    _SubTitle("Indications with contrast:"),
    _richBullet("Suspected tumors or masses."),
    _richBullet("Infection (osteomyelitis, septic arthritis)."),
    _richBullet("Inflammatory conditions."),
    _richBullet("Post-operative complications."),
    _richBullet("Vascular abnormalities around the knee."),
    _richBullet("Evaluation of synovial disease."),
    _richBullet("When detailed soft-tissue assessment is needed."),

    const SizedBox(height: 12),
    _SubTitle("Indications without contrast:"),
    _richBullet("Evaluation of fractures and trauma."),
    _richBullet("Assessment of bone anatomy."),
    _richBullet("Detection of bone lesions or deformities."),
    _richBullet("Pre-operative planning."),
    _richBullet("Follow-up of healing fracture."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Patient may eat and drink normally."),
    _richIndentedBullet("Remove metal objects (jewelry, braces, coins)."),
    _richIndentedBullet("Wear comfortable clothing or hospital gown."),
    _richIndentedBullet("Ask the patient about pregnancy and any recent surgery."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Fasting for 4–6 hours before the scan (if required by protocol)."),
    _richIndentedBullet("Check kidney function (creatinine level)."),
    _richIndentedBullet("Ask about history of contrast allergy."),
    _richIndentedBullet("Remove metal objects."),
    _richIndentedBullet("Wear hospital gown."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
    Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Patient supine, legs flat on table and tape feet together."),
          _richBullet("Scout: AP and lateral."),
          _richBullet("Scan plane: Helical."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Knee",
              imagePath: 'assets/wordimgs/knee.png',
              heroTag: 'knee_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'knee_image',
          child: Image.asset(
            'assets/wordimgs/knee.png',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Reference angle: Axial images are obtained perpendicular to the long axis of the tibia."),
              _richBullet("Patient Instructions:"),
              _richBullet("Instruct patient to remain still during scanning."),
              _richBullet("Remove all metal objects."),
              _richBullet("Report any contrast allergy (if applicable)."),
              _richBullet("Start location: Just above patella."),
              _richBullet("End location: Just below fibular head."),
              _richBullet("Scan Direction: Scan from proximal to distal; from distal femur to proximal tibia; superior to inferior direction."),
           
    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: Non-ionic iodinated IV contrast, 50–70 mL."),
    _richIndentedBullet("Scan delay: Venous phase, 60–70 sec."),
    _richIndentedBullet("Oral contrast: Not required for CT Knee."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV: 120 kVp (typical)."),
    _richIndentedBullet("MAS： 100–150 mAs (adjust per patient size)."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    const SizedBox(height: 10),
    _richBullet("Algorithm: Standard."),
    const SizedBox(height: 10),

    const SizedBox(height: 12),
    _richBullet("Window Setting："),
    _richIndentedBullet("Bone window： Width 2000, Level 500."),
    _richIndentedBullet("Soft tissue window： Width 350, Level 50."),

    const SizedBox(height: 12),
    _richBullet("Reconstruction:"),
    _richIndentedBullet("Algorithm： Standard."),
    _richIndentedBullet("Slice thickness: 1.25 mm."),
    _richIndentedBullet("Slice interval: 0.625 mm."),

    const SizedBox(height: 12),
    _richBullet("MPRs:"),
    _richIndentedBullet("Algorithm： Bone."),
    _richIndentedBullet("Slice thickness: 2 mm."),
    _richIndentedBullet("Slice interval: 2 mm."),

    const SizedBox(height: 12),
    _richBullet("Planes:"),
    _richIndentedBullet("Axial"),
    _richIndentedBullet("Coronal"),
    _richIndentedBullet("Sagittal"),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/knee2.jpg'),
    Text("A. Axial MPR can be programmed from an AP scout and should be parallel to the tibial plateau. B. Coronal MPR can be programmed from an axial image and should be parallel to the femoral condyles. C.Sagittal MPR can be programmed from an axial image and should be perpendicular to the coronal MPR."),
  ],
),
        /// ANKLE
       _NestedSectionTile(
  title: "ANKLE",
  children: [
    _SubTitle("Indications without contrast:"),
    _richBullet("To assess the presence and extent of fractures in the ankle joint."),
    _richBullet("To evaluate the nature of soft tissue lesions, especially if they are adjacent to bone or vascular structures."),
    _richBullet("To diagnose and assess the severity of joint swelling."),
    _richBullet("To identify and evaluate the presence of swelling or hematoma in the ankle joint."),

    const SizedBox(height: 12),
    _SubTitle("Indications with contrast:"),
    _richBullet("Post-operative evaluation."),
    _richBullet("Ankle Soft tissue mass."),
    _richBullet("X-ray findings suggest joint effusion or soft tissue swelling."),

    const SizedBox(height: 12),
    _SubTitle("Patient Preparation:"),
    _richBullet("Without contrast:"),
    _richIndentedBullet("Not claustrophobic (sedation may be given)."),
    _richIndentedBullet("Metal artefacts removed from the region of interest."),
    _richIndentedBullet("No respiratory distress when lying supine."),

    _richBullet("With contrast:"),
    _richIndentedBullet("Not Fasting： 2–4 hours before the scan (Water is okay)."),
    _richIndentedBullet("Lab Work： You must have a recent Creatinine (Kidney function) test."),
    _richIndentedBullet("Allergies： Inform the staff if you are allergic to Iodine or shellfish."),
    _richIndentedBullet("Medication： If you take Metformin, stop it on the day of the scan and for 48 hours after."),
    _richIndentedBullet("Aftercare： Drink plenty of water to flush the dye out of your body."),

    const SizedBox(height: 12),
    _SubTitle("Technique:"),
   Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richBullet("Patient position: Patient supine, legs flat on table. Use foot holder or tape feet together."),
          _richBullet("Scout: AP and lateral."),
        ],
      ),
    ),
    const SizedBox(width: 8),
    GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: "Ankle",
              imagePath: 'assets/wordimgs/ankle.jpg',
              heroTag: 'ankle_image',
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: 'ankle_image',
          child: Image.asset(
            'assets/wordimgs/ankle.jpg',
            height: 110,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ),
  ],
),
 _richBullet("Scan plane: Axial."),
              _richBullet("Reference angle: Parallel to tibial plafond."),
              _richBullet("Patient instruction: Stay still, no breathing instruction needed."),
              _richBullet("Scan direction: Caudocranial."),
              _richBullet("Start location: Just above tibial plafond (just above ankle joint)."),
              _richBullet("End location: Through calcaneus."),
    const SizedBox(height: 12),
    _richBullet("Algorithm: Bone plus."),

    const SizedBox(height: 12),
    _richBullet("Contrast:"),
    _richIndentedBullet("IV contrast: Non-ionic iodinated IV contrast is used, 50–70 mL."),
    _richIndentedBullet("Scan delay: Venous phase, 60–70 sec."),
    _richIndentedBullet("Oral contrast: None."),

    const SizedBox(height: 12),
    _richBullet("Technical Parameters:"),
    _richIndentedBullet("KV： 140."),
    _richIndentedBullet("MAS： 200."),

    const SizedBox(height: 12),
    _richBullet("Window setting:"),
    _richIndentedBullet("Window level: 2000 ww."),
    _richIndentedBullet("Window width: 500 wl (bone)."),

    const SizedBox(height: 12),
    _richBullet("MPRs: Bone algorithm:"),
    _richIndentedBullet("Slice thickness: 2 mm."),
    _richIndentedBullet("Slice interval: 2 mm."),

    const SizedBox(height: 12),
    _richBullet("Planes:"),
    _richIndentedBullet("Axial (Fig. 22-11A)."),
    _richIndentedBullet("Coronal (Fig. 22-11B)."),
    _richIndentedBullet("Sagittal (Fig. 22-11C)."),

    const SizedBox(height: 8),
    const _ExamImage(imagePath: 'assets/wordimgs/ankle2.png'),
    Text("Figure 22-10 A. Axial MPR can be programmed from an AP scout and shoud be parallel to the tibial plateau. B-Coronal MPR can be programmed from an axial image and shoude be parallel to the femoral condyles. C-Sagittal MPR can be programmed from an axial image and shoud be perpendicular to the coronal. "),
  ],
),
      ],
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
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        childrenPadding: const EdgeInsets.only(left: 12, right: 0, bottom: 12, top: 4),
        iconColor: Colors.redAccent,
        collapsedIconColor: Colors.redAccent,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: children.isEmpty
            ? [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Content coming soon...",
                      style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ]
            : children,
      ),
    );
  }
}

class _NestedSectionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _NestedSectionTile({
    required this.title,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        childrenPadding: const EdgeInsets.only(left: 12, right: 0, bottom: 8, top: 0),
        iconColor: Colors.redAccent,
        collapsedIconColor: Colors.redAccent,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        children: children.isEmpty
            ? [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Content coming soon...",
                      style: TextStyle(color: Colors.white54, fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              ]
            : children,
      ),
    );
  }
}

class _DoubleNestedSectionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _DoubleNestedSectionTile({
    required this.title,
    this.children = const [],
  });

  @override
  Widget build(BuildContext context) {
    final titleRow = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // align with first line
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6), // align dot with text
            child: Icon(Icons.circle, color: Colors.redAccent, size: 8),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (children.isEmpty) {
      return titleRow;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleRow,
        Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ],
    );
  }
}

/// Splits a bullet text into an optional bold `label` (ending with `:`) and the remaining `description`.
/// Returns a record `(hasLabel, label, description)`.
///
/// Special case: lines that are *just* section headers like
/// `Contrast:`, `Technical Parameters:`, `Window setting:`, `Reconstruction:`
/// are treated as having **no bold label** so the whole line stays normal weight.
(bool hasLabel, String label, String description) _splitLabelParts(String text) {
  final splitIndex = text.indexOf(':');
  if (splitIndex == -1) {
    return (false, '', text);
  }

  final rawLabel = text.substring(0, splitIndex + 1);
  final rawDescription = text.substring(splitIndex + 1);

  // If this is just a header-like line (no description text),
  // keep everything non‑bold for these specific section titles.
  const nonBoldHeaders = <String>{
    'Contrast:',
    'Technical Parameters:',
    'Window setting:',
    'Reconstruction:',
  };

  if (rawDescription.trim().isEmpty &&
      nonBoldHeaders.contains(rawLabel.trim())) {
    return (false, '', text);
  }

  // Labels that should never be bolded, even when followed by content.
  const nonBoldLabels = <String>{
    'IV contrast:',
    'Scan delay:',
    'Oral contrast:',
    'KVP:',
    'KV:',
    'Kvp:',
    'kV:',
    'mAs:',
    'MAs:',
    'Slice thickness:',
    'Slice Thickness:',
    'Slice interval:',
    'Slice Interval:',
    'Window width:',
    'Window Width:',
    'Window level:',
    'Window Level:',
  };

  if (nonBoldLabels.contains(rawLabel.trim())) {
    return (false, '', text);
  }

  return (true, rawLabel, rawDescription);
}

class BulletItem extends StatelessWidget {
  final String text;

  const BulletItem(this.text);

  @override
  Widget build(BuildContext context) {
    final (hasLabel, label, description) = _splitLabelParts(text);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, color: Colors.redAccent, size: 8),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  if (hasLabel)
                    TextSpan(
                      text: label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
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
    final (hasLabel, label, description) = _splitLabelParts(text);

    return Container(
      margin: const EdgeInsets.only(left: 24, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, color: Colors.redAccent, size: 6),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: hasLabel
                    ? [
                        TextSpan(
                          text: label,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        TextSpan(
                          text: description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ]
                    : [
                        TextSpan(
                          text: text,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class _ExamImage extends StatelessWidget {
  final String imagePath;
  final String? title;

  const _ExamImage({
    required this.imagePath,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final tag = imagePath; // unique hero tag

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _SingleImageViewer(
              title: title ?? "Image",
              imagePath: imagePath,
              heroTag: tag,
            ),
          ),
        );
      },
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
            child: Hero(
              tag: tag,
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
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
              color: Colors.red,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
      );
}
Widget _richBullet(String text) {
  final colonIndex = text.indexOf(':');
  final hasLabel = colonIndex != -1;
  final label = hasLabel ? text.substring(0, colonIndex + 1) : '';
  final description = hasLabel ? text.substring(colonIndex + 1) : text;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!(hasLabel && label.trim().startsWith('Group'))) ...[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 6), // 🔥 fine-tuned
                child: Icon(Icons.circle, color: Colors.redAccent, size: 8),
              ),
            ),
            const SizedBox(width: 10),
          ] else
            const SizedBox(width: 0),

          Expanded(
            child: hasLabel
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: label,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        TextSpan(
                          text: description,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
          ),
        ],
      ),
    ),
  );
}

Widget _richIndentedBullet(String text) {
  final (hasLabel, label, description) = _splitLabelParts(text);

  return Padding(
    padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4),
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!(hasLabel && label.trim() == 'Algorithm:')) ...[
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 5), // 🔥 fine-tuned
                child: Icon(Icons.circle, color: Colors.redAccent, size: 6),
              ),
            ),
            const SizedBox(width: 8),
          ] else
            const SizedBox(width: 0),

          Expanded(
            child: hasLabel
                ? RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: label,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        TextSpan(
                          text: description,
                          style: const TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
          ),
        ],
      ),
    ),
  );
}
/// Simple indented bullet used for `Algorithm: ...` lines under "Reconstruction".
/// It shows a red dot and non‑bold white text for the whole line.
class _ReconstructionAlgorithmBullet extends StatelessWidget {
  final String text;

  const _ReconstructionAlgorithmBullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, top: 4, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Icon(Icons.circle, color: Colors.redAccent, size: 6),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
class _SingleImageViewer extends StatefulWidget {
  final String title;
  final String imagePath;
  final String heroTag;

  const _SingleImageViewer({
    required this.title,
    required this.imagePath,
    required this.heroTag,
  });

  @override
  State<_SingleImageViewer> createState() => _SingleImageViewerState();
}

class _SingleImageViewerState extends State<_SingleImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: AppScreenBackground.decoration,
        child: SafeArea(
          child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1.0,
                maxScale: 8.0,
                boundaryMargin: const EdgeInsets.all(100),
                clipBehavior: Clip.none,
                child: Hero(
                  tag: widget.heroTag,
                  child: Image.asset(
                    widget.imagePath,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.75,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
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
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
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