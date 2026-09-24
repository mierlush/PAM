import 'package:flutter/material.dart';
import 'courses_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Albastru + Card Progres Suprapus
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFF3D5CFF),
                  padding: const EdgeInsets.fromLTRB(24, 48, 24, 85),
                  child: Column(
                    children: [
                      // Status Bar Time Placeholder
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('9:41', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                          Row(
                            children: [
                              Icon(Icons.signal_cellular_alt, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Icon(Icons.wifi, color: Colors.white, size: 14),
                              SizedBox(width: 4),
                              Icon(Icons.battery_full, color: Colors.white, size: 14),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Top Profile Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hi, Kristin',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Let's start learning",
                                style: TextStyle(color: Colors.white70, fontSize: 13),
                              ),
                            ],
                          ),
                          ClipOval(
                            child: Image.asset(
                              'assets/avatar.png',
                              width: 52,
                              height: 52,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Card Floating 'Learned today'
                Positioned(
                  left: 24,
                  right: 24,
                  bottom: -40,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0A000000),
                          blurRadius: 15,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Learned today',
                                  style: TextStyle(color: Color(0xFF858597), fontSize: 11, fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  text: const TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '46min ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '/ 60min',
                                        style: TextStyle(color: Color(0xFF858597), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const CoursesScreen()),
                                );
                              },
                              child: const Text(
                                'My courses',
                                style: TextStyle(color: Color(0xFF3D5CFF), fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const LinearProgressIndicator(
                            value: 46 / 60,
                            minHeight: 6,
                            backgroundColor: Color(0xFFF0F2F5),
                            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF5C00)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 60),

            // Corpul paginii
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Orizontal
                  SizedBox(
                    height: 135,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        // Card Banner 1
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const CoursesScreen()),
                            );
                          },
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                              color: const Color(0xFFCEECFE),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 0,
                                    bottom: 0,
                                    top: 0,
                                    child: Image.asset(
                                      'assets/banner_girl_clean.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'What do youwant to learn tod',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Color(0xFF1F1F39),
                                            height: 1.2,
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFFF5C00),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                                          child: const Text(
                                            'Get Started',
                                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Card Banner 2
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE5F7F3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'assets/banner_check.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Section Title: Learning Plan
                  const Text(
                    'Learning Plan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F1F39)),
                  ),
                  const SizedBox(height: 14),

                  _buildPlanItem('Packaging Design', 40, 48),
                  _buildPlanItem('Product Design', 6, 24),

                  const SizedBox(height: 20),

                  // Card Meetup
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE4FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Meetup',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2C1363),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Off-line exchange of learning experie...',
                                style: TextStyle(fontSize: 11, color: Color(0xFF6B6280)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/meetup_illustration.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildPlanItem(String title, int current, int total) {
    double progress = current / total;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 2.5,
              backgroundColor: const Color(0xFFF0F2F5),
              valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF1F1F39)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1F1F39)),
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$current',
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 13),
                ),
                TextSpan(
                  text: '/$total',
                  style: const TextStyle(color: Color(0xFFB8B8D2), fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
