import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final bool showBackButton;
  const SearchScreen({super.key, this.showBackButton = true});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> allSections = const [
    {'title': 'Definition', 'route': '/definition'},
    {'title': 'Usage', 'route': '/usage'},
    {'title': 'Risks', 'route': '/risks'},
    {'title': 'Protocol', 'route': '/protocol'},
    {'title': 'Cases', 'route': '/cases'},
    {'title': 'Protection', 'route': '/protection'},
  ];

  List<Map<String, String>> filteredSections = [];
  bool _isSearching = false;

  void _onSearch(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      filteredSections = allSections
          .where((section) =>
              section['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search Bar
            TextField(
              controller: _controller,
              onChanged: _onSearch,
              decoration: InputDecoration(
                hintText: 'Search topics (e.g. Risks, Usage...)',
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

            // 🔽 Search results (only visible when typing)
            if (_isSearching)
              Expanded(
                child: filteredSections.isEmpty
                    ? const Center(
                        child: Text(
                          "No results found",
                          style: TextStyle(color: Colors.white70, fontSize: 18),
                        ),
                      )
                    : ListView.builder(
                        itemCount: filteredSections.length,
                        itemBuilder: (context, index) {
                          final section = filteredSections[index];
                          return GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, section['route']!),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    section['title']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
