import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar Status Time Placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('9:41', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13)),
                  Row(
                    children: [
                      Icon(Icons.signal_cellular_alt, color: Colors.black, size: 14),
                      SizedBox(width: 4),
                      Icon(Icons.wifi, color: Colors.black, size: 14),
                      SizedBox(width: 4),
                      Icon(Icons.battery_full, color: Colors.black, size: 14),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Header cu titlu si Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20, color: Color(0xFF1F1F39)),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Course',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1F1F39)),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Image.asset(
                      'assets/avatar.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find Cousre',
                  hintStyle: const TextStyle(color: Color(0xFFB8B8D2), fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Color(0xFFB8B8D2)),
                  suffixIcon: const Icon(Icons.tune, color: Color(0xFFB8B8D2)),
                  filled: true,
                  fillColor: const Color(0xFFF2F3F7),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Sub-Bannere (Language & Painting)
              Row(
                children: [
                  Expanded(
                    child: _buildCategoryCard(
                      'Languege',
                      const Color(0xFFCEECFE),
                      'assets/cat_language.png',
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: _buildCategoryCard(
                      'Painting',
                      const Color(0xFFEDE4FF),
                      'assets/cat_painting.png',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Section Title: Choice your course
              const Text(
                'Choice your course',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F1F39)),
              ),
              const SizedBox(height: 14),

              // Filter Chips
              Row(
                children: [
                  _buildTabChip('All', true),
                  const SizedBox(width: 12),
                  _buildTabChip('Poular', false),
                  const SizedBox(width: 12),
                  _buildTabChip('New', false),
                ],
              ),
              const SizedBox(height: 18),

              // Lista Cursuri
              Expanded(
                child: ListView(
                  children: [
                    _buildCourseCard(
                      'Product Design v1.0',
                      'Robertson Connie',
                      '\$190',
                      '16 hours',
                      'assets/course_product_design.png',
                    ),
                    _buildCourseCard(
                      'Java Development',
                      'Nguyen Shane',
                      '\$190',
                      '16 hours',
                      'assets/course_java.png',
                    ),
                    _buildCourseCard(
                      'Visual Design',
                      'Bert Pullman',
                      '\$250',
                      '14 hours',
                      'assets/course_visual_design.png',
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

  Widget _buildCategoryCard(String title, Color bg, String imagePath) {
    return Container(
      height: 95,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF3D5CFF) : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF858597),
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }

  Widget _buildCourseCard(String title, String author, String price, String duration, String imagePath) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x05000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image Box
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 68,
              height: 68,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F1F39)),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person, size: 12, color: Color(0xFFB8B8D2)),
                    const SizedBox(width: 4),
                    Text(
                      author,
                      style: const TextStyle(color: Color(0xFFB8B8D2), fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Color(0xFF3D5CFF),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFEBF0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        duration,
                        style: const TextStyle(
                          color: Color(0xFFFF5C00),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
