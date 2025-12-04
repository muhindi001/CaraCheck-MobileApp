import 'package:flutter/material.dart';

class AllDoctor extends StatelessWidget {
  const AllDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Doctors",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------------- FIRST ROW (2 items) ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                  title: "Ophthalmologist",
                  subtitle: "Eyes doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFDEBD0),
                ),
                CategoryItem(
                  title: "Dentist",
                  subtitle: "Teeth doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFFD6E0),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                  title: "Ophthalmologist",
                  subtitle: "Eyes doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFDEBD0),
                ),
                CategoryItem(
                  title: "Dentist",
                  subtitle: "Teeth doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFFD6E0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                  title: "Ophthalmologist",
                  subtitle: "Eyes doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFDEBD0),
                ),
                CategoryItem(
                  title: "Dentist",
                  subtitle: "Teeth doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFFD6E0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                  title: "Ophthalmologist",
                  subtitle: "Eyes doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFDEBD0),
                ),
                CategoryItem(
                  title: "Dentist",
                  subtitle: "Teeth doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFFD6E0),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryItem(
                  title: "Ophthalmologist",
                  subtitle: "Eyes doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFDEBD0),
                ),
                CategoryItem(
                  title: "Dentist",
                  subtitle: "Teeth doctor",
                  imagePath: "lib/assets/eye.png",
                  bgColor: Color(0xFFFFD6E0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// -------------------------------------------------------------------
//                        CATEGORY ITEM WIDGET
// -------------------------------------------------------------------

class CategoryItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color bgColor;

  const CategoryItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 150,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath, width: 45, height: 45),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
