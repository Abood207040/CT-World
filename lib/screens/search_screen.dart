import 'package:flutter/material.dart';
import 'package:ct_world/widgets/app_screen_background.dart';

class SearchScreen extends StatefulWidget {
  final bool showBackButton;
  const SearchScreen({super.key, this.showBackButton = true});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();

  // Screens with display name and route
  final List<Map<String, String>> allScreens = [
    {'name': 'About CT', 'route': '/definition'},
    {'name': 'About Us', 'route': '/usage'},
    {'name': 'CT Anatomy', 'route': '/risks'},
    {'name': 'CT Examination', 'route': '/protocol'},
    {'name': 'References', 'route': '/cases'},
 
  ];

  List<Map<String, String>> searchResults = [];

  void _onSearch(String query) {
    if (query.isEmpty) {
      setState(() => searchResults = []); // don't show results if empty
    } else {
      setState(() {
        searchResults = allScreens
            .where((screen) =>
                (screen['name'] ?? '')
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(decoration: AppScreenBackground.decoration),
        leading: widget.showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        title: const Text(
          "Search",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppScreenBackground.decoration,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _controller,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Search screens (e.g., About CT, Protocol...)',
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                filled: true,
                fillColor: Colors.redAccent.withOpacity(0.3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(color: Colors.white70),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),

            // 🔽 Only show results if user typed something
            if (searchResults.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final screen = searchResults[index];
                    final name = screen['name'] ?? 'Unknown';
                    final route = screen['route'] ?? '/';
                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(context, route),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.redAccent.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.redAccent.withOpacity(0.4),
                          ),
                        ),
                        child: Text(
                          name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
          ),
        ),
      ),
    );
  }
}