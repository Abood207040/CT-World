import 'package:flutter/material.dart';
import '../widgets/app_screen_background.dart';
import '../widgets/fade_in_page.dart';

class RisksScreen extends StatelessWidget {
  const RisksScreen({super.key});

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
                _header(
                  context,
                  "CT Anatomy",
                  'assets/icons/header_ct_anatomy.png',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(12, 14, 12, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _RegionTile(
                          title: "Head",
                          iconPath: 'assets/icons/head.png',
                          subRegions: [
                            _SubRegion(
                              title: "Brain",
                              imagePaths: [
                                'assets/brain/brain1.png',
                                'assets/brain/brain2.png',
                                'assets/brain/brain3.png',
                                'assets/brain/brain4.png',
                                'assets/brain/brain5.png',
                                'assets/brain/brain6.png',
                                'assets/brain/brain7.png',
                                'assets/brain/brain8.png',
                                'assets/brain/brain9.png',
                                'assets/brain/brain10.png',
                                'assets/brain/brain11.png',
                              ],
                            ),
                            _SubRegion(
                              title: "Facial bone",
                              imagePaths: [
                                'assets/facialbone/facialbone1.jpg',
                                'assets/facialbone/facialbone2.jpg',
                                'assets/facialbone/facialbone3.jpg',
                                'assets/facialbone/facialbone4.jpg',
                                'assets/facialbone/facialbone5.jpg',
                                'assets/facialbone/facialbone6.jpg',
                                'assets/facialbone/facialbone7.jpg',
                                'assets/facialbone/facialbone8.jpg',
                                'assets/facialbone/facialbone9.jpg',
                                'assets/facialbone/facialbone10.jpg',
                                'assets/facialbone/facialbone11.jpg',
                                'assets/facialbone/facialbone12.jpg',
                                'assets/facialbone/facialbone13.jpg',
                                'assets/facialbone/facialbone14.jpg',
                                'assets/facialbone/facialbone15.jpg',
                                'assets/facialbone/facialbone16.jpg',
                              ],
                            ),
                            _SubRegion(
                              title: "Paranasal",
                              imagePaths: [
                                'assets/paranasalsinuses/paranasalsinuses1.jpg',
                                'assets/paranasalsinuses/paranasalsinuses2.jpg',
                                'assets/paranasalsinuses/paranasalsinuses3.jpg',
                                'assets/paranasalsinuses/paranasalsinuses4.jpg',
                                'assets/paranasalsinuses/paranasalsinuses5.jpg',
                                'assets/paranasalsinuses/paranasalsinuses6.jpg',
                                'assets/paranasalsinuses/paranasalsinuses7.jpg',
                                'assets/paranasalsinuses/paranasalsinuses8.jpg',
                              ],
                            ),
                          ],
                        ),
                        _RegionTile(
                          title: "Neck",
                          iconPath: 'assets/icons/neck.png',
                          showSubHeadings: false,
                          subRegions: [
                            _SubRegion(
                              title: "Neck",
                              imagePaths: [
                                'assets/neck/neck1.png',
                                'assets/neck/neck2.png',
                                'assets/neck/neck3.png',
                                'assets/neck/neck4.png',
                                'assets/neck/neck5.png',
                                'assets/neck/neck6.png',
                                'assets/neck/neck7.png',
                                'assets/neck/neck8.png',
                                'assets/neck/neck9.png',
                                'assets/neck/neck10.png',
                              ],
                            ),
                          ],
                        ),
                        _RegionTile(
                          title: "Thorax",
                          iconPath: 'assets/icons/thorax.png',
                          showSubHeadings: false,
                          subRegions: [
                            _SubRegion(
                              title: "Thorax",
                              imagePaths: [
                                'assets/thorax/thorax1.png',
                                'assets/thorax/thorax2.png',
                                'assets/thorax/thorax3.png',
                                'assets/thorax/thorax4.png',
                                'assets/thorax/thorax5.png',
                                'assets/thorax/thorax6.png',
                                'assets/thorax/thorax7.png',
                                'assets/thorax/thorax8.png',
                                'assets/thorax/thorax9.png',
                                'assets/thorax/thorax10.png',
                                'assets/thorax/thorax11.png',
                                'assets/thorax/thorax12.png',
                                'assets/thorax/thorax13.png',
                                'assets/thorax/thorax14.png',
                                'assets/thorax/thorax15.png',
                                'assets/thorax/thorax16.png',
                                'assets/thorax/thorax17.png',
                              ],
                            ),
                          ],
                        ),
                        _RegionTile(
                          title: "Abdomen",
                          iconPath: 'assets/icons/abdomen.png',
                          showSubHeadings: false,
                          subRegions: [
                            _SubRegion(
                              title: "Abdomen",
                              imagePaths: [
                                'assets/abdomen/abdomen1.png',
                                'assets/abdomen/abdomen2.png',
                                'assets/abdomen/abdomen3.png',
                                'assets/abdomen/abdomen4.png',
                                'assets/abdomen/abdomen5.png',
                                'assets/abdomen/abdomen6.png',
                                'assets/abdomen/abdomen7.png',
                                'assets/abdomen/abdomen8.png',
                                'assets/abdomen/abdomen9.png',
                                'assets/abdomen/abdomen10.png',
                                'assets/abdomen/abdomen11.png',
                                'assets/abdomen/abdomen12.png',
                              ],
                            ),
                          ],
                        ),
                        _RegionTile(
                          title: "Pelvis",
                          iconPath: 'assets/icons/pelvis.png',
                          subRegions: [
                            _SubRegion(
                              title: "Male pelvis",
                              imagePaths: [
                                'assets/malepelvis/malepelvis1.png',
                                'assets/malepelvis/malepelvis2.png',
                                'assets/malepelvis/malepelvis3.png',
                                'assets/malepelvis/malepelvis4.png',
                                'assets/malepelvis/malepelvis5.png',
                                'assets/malepelvis/malepelvis6.png',
                                'assets/malepelvis/malepelvis7.png',
                                'assets/malepelvis/malepelvis8.png',
                                'assets/malepelvis/malepelvis9.png',
                                'assets/malepelvis/malepelvis10.png',
                                'assets/malepelvis/malepelvis11.png',
                                'assets/malepelvis/malepelvis12.png',
                              ],
                            ),
                            _SubRegion(
                              title: "Female pelvis",
                              imagePaths: [
                                'assets/femalepelvis/malepelvis1.png',
                                'assets/femalepelvis/malepelvis2.png',
                                'assets/femalepelvis/malepelvis3.png',
                                'assets/femalepelvis/malepelvis4.png',
                                'assets/femalepelvis/malepelvis5.png',
                                'assets/femalepelvis/malepelvis6.png',
                                'assets/femalepelvis/malepelvis7.png',
                                'assets/femalepelvis/malepelvis8.png',
                                'assets/femalepelvis/malepelvis9.png',
                              ],
                            ),
                          ],
                        ),
                         _RegionTile(
                          title: "Spine",
                          iconPath: 'assets/icons/spine.png',
                          showSubHeadings: false,
                          subRegions: [
                            _SubRegion(
                              title: "Spine",
                              imagePaths: [
                                'assets/spine/spine1.jpeg',
                                'assets/spine/spine2.jpeg',
                                'assets/spine/spine3.jpeg',
                                'assets/spine/spine4.jpeg',
                                'assets/spine/spine5.jpeg',
                                'assets/spine/spine6.jpeg',
                                'assets/spine/spine7.jpeg',
                              
                              ],
                            ),
                          ],
                        ),
                        _RegionTile(
                          title: "Limb joints",
                          iconPath: 'assets/icons/limb_joints.png',
                          subRegions: [
                            _SubRegion(
                              title: "Upper limb",
                              children: [
                                _SubRegion(
                                  title: "Shoulder",
                                  imagePaths: [
                                    'assets/shoulder/shoulder1.jpg',
                                    'assets/shoulder/shoulder2.jpg',
                                    'assets/shoulder/shoulder3.jpg',
                                    'assets/shoulder/shoulder4.jpg',
                                    'assets/shoulder/shoulder5.jpg',
                                  ],
                                ),
                                _SubRegion(
                                  title: "Elbow",
                                  imagePaths: [
                                    'assets/elbow/elbow1.jpg',
                                    'assets/elbow/elbow2.jpg',
                                    'assets/elbow/elbow3.jpg',
                                    'assets/elbow/elbow4.jpg',
                                    'assets/elbow/elbow5.jpg',
                                    'assets/elbow/elbow6.jpg',
                                    'assets/elbow/elbow7.jpg',
                                    'assets/elbow/elbow8.jpg',
                                    'assets/elbow/elbow9.jpg',
                                  ],
                                ),
                                _SubRegion(
                                  title: "Wrist",
                                  imagePaths: [
                                    'assets/wrist/wrist1.jpg',
                                    'assets/wrist/wrist2.jpg',
                                    'assets/wrist/wrist3.jpg',
                                    'assets/wrist/wrist4.jpg',
                                    'assets/wrist/wrist5.jpg',
                                  ],
                                ),
                              ],
                            ),
                            _SubRegion(
                              title: "Lower limb",
                              children: [
                                _SubRegion(
                                  title: "Hip",
                                  imagePaths: [
                                    'assets/hip/hip1.jpg',
                                    'assets/hip/hip2.jpg',
                                    'assets/hip/hip3.jpg',
                                    'assets/hip/hip4.jpg',
                                    'assets/hip/hip5.jpg',
                                    'assets/hip/hip6.jpg',
                                  ],
                                ),
                                _SubRegion(
                                  title: "Knee",
                                  imagePaths: [
                                    'assets/knee/knee1.jpg',
                                    'assets/knee/knee2.jpg',
                                    'assets/knee/knee3.jpg',
                                    'assets/knee/knee4.jpg',
                                    'assets/knee/knee5.jpg',
                                    'assets/knee/knee6.jpg',
                                    'assets/knee/knee7.jpg',
                                    'assets/knee/knee8.jpg',
                                    'assets/knee/knee9.jpg',
                                  ],
                                ),
                                _SubRegion(
                                  title: "Ankle",
                                  imagePaths: [
                                    'assets/ankle/ankle1.jpg',
                                    'assets/ankle/ankle2.jpg',
                                    'assets/ankle/ankle3.jpg',
                                    'assets/ankle/ankle4.jpg',
                                  ],
                                ),
                              ],
                            ),
                          ],
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

  Widget _header(BuildContext context, String title, String headerImagePath) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF4D4D), Color(0xFFFF7A18)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(26),
          bottomRight: Radius.circular(26),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.14),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Explore regions and anatomical structures",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.14),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              headerImagePath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

class _RegionTile extends StatelessWidget {
  final String title;
  final List<_SubRegion> subRegions;
  final bool showSubHeadings;
  final String iconPath;

  const _RegionTile({
    required this.title,
    required this.subRegions,
    required this.iconPath,
    this.showSubHeadings = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.045),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.07)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          iconColor: Colors.redAccent,
          collapsedIconColor: Colors.redAccent,
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              iconPath,
              width: 42,
              height: 42,
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          children: showSubHeadings
              ? subRegions.map((sub) => _SubRegionTile(subRegion: sub)).toList()
              : [
                  if (subRegions.isNotEmpty)
                    _ImageCarousel(
                      title: subRegions.first.title,
                      imagePaths: subRegions.first.imagePaths,
                    ),
                ],
        ),
      ),
    );
  }
}

class _SubRegion {
  final String title;
  final List<String> imagePaths;
  final List<_SubRegion>? children;

  const _SubRegion({
    required this.title,
    this.imagePaths = const [],
    this.children,
  });
}

class _SubRegionTile extends StatelessWidget {
  final _SubRegion subRegion;

  const _SubRegionTile({required this.subRegion, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 12),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white70,
          title: Text(
            subRegion.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          children: [
            if (subRegion.children != null && subRegion.children!.isNotEmpty)
              ...subRegion.children!
                  .map((child) => _SubRegionTile(subRegion: child))
            else
              _ImageCarousel(
                title: subRegion.title,
                imagePaths: subRegion.imagePaths,
              ),
          ],
        ),
      ),
    );
  }
}

class _ImageCarousel extends StatefulWidget {
  final String title;
  final List<String> imagePaths;

  const _ImageCarousel({
    required this.title,
    required this.imagePaths,
    super.key,
  });

  @override
  State<_ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<_ImageCarousel> {
  late final PageController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openFullScreen(int initialIndex) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FullScreenGallery(
          title: widget.title,
          imagePaths: widget.imagePaths,
          initialIndex: initialIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.imagePaths;
    if (images.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 10),
            child: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        Container(
          height: 315,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF111111),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.white.withOpacity(0.08)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.34),
                blurRadius: 14,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                PageView.builder(
                  controller: _controller,
                  itemCount: images.length,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final path = images[index];
                    return GestureDetector(
                      onTap: () => _openFullScreen(index),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Hero(
                          tag: 'image_${widget.title}_$index',
                          child: Image.asset(
                            path,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      '${_current + 1}/${images.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (images.length > 1) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Tap image to zoom",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.55),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  final isActive = index == _current;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: isActive ? 18 : 7,
                    height: 7,
                    decoration: BoxDecoration(
                      color: isActive
                          ? Colors.redAccent
                          : Colors.white.withOpacity(0.28),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _FullScreenGallery extends StatefulWidget {
  final String title;
  final List<String> imagePaths;
  final int initialIndex;

  const _FullScreenGallery({
    required this.title,
    required this.imagePaths,
    required this.initialIndex,
  });

  @override
  State<_FullScreenGallery> createState() => _FullScreenGalleryState();
}

class _FullScreenGalleryState extends State<_FullScreenGallery> {
  late final PageController _pageController;
  late int _currentIndex;

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
                      child: Hero(
                        tag: 'image_${widget.title}_$index',
                        child: Image.asset(
                          path,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          fit: BoxFit.contain,
                        ),
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

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text, {super.key});

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