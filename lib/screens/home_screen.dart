import 'package:flutter/material.dart';
import '../widgets/nav_box.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

 final List<Map<String, dynamic>> sections = [
  {
    'title': 'Definition',
    'route': '/definition',
    'image': 'assets/defination.png',
    'color': const Color(0xFFE53935), // Red
  },
  {
    'title': 'Usage',
    'route': '/usage',
    'image': 'assets/usage.png',
    'color': const Color(0xFF3949AB), // Indigo Blue
  },
  {
    'title': 'Risks',
    'route': '/risks',
    'image': 'assets/risks.png',
    'color': const Color(0xFFFBC02D), // Amber Yellow
  },
  {
    'title': 'Protocol',
    'route': '/protocol',
    'image': 'assets/protocol.png',
    'color': const Color(0xFF1E88E5), // Blue
  },
  {
    'title': 'Cases',
    'route': '/cases',
    'image': 'assets/cases.png',
    'color': const Color(0xFF26C6DA), // Cyan / Teal
  },
  {
    'title': 'Protection',
    'route': '/protection',
    'image': 'assets/protechtion.png',
    'color': const Color(0xFFD81B60), // Pink
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _homeBody(context),
          const SearchScreen(showBackButton: false),
          const ProfileScreen(showBackButton: false),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.white70,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: "Profile"),
        ],
      ),
    );
  }

  Widget _homeBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔝 AppBar
              AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: const Text(
                  'CT WORLD',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      backgroundImage: const AssetImage('assets/logo.jpg'),
                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // 🔍 Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => setState(() => _currentIndex = 1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.redAccent.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.white70),
                        SizedBox(width: 10),
                        Text(
                          "Search topics...",
                          style: TextStyle(color: Colors.white54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // 🧭 Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Explore Topics",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 🧱 Grid Navigation
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: sections.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, i) {
                    final item = sections[i];
                    return NavBox(
                      title: item['title'],
                      route: item['route'],
                      imagePath: item['image'],
                      backgroundColor: item['color'],
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
