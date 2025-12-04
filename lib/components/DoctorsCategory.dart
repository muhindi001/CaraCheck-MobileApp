import 'package:flutter/material.dart';

class DoctorsCategory extends StatelessWidget {
  const DoctorsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        CategoryItem(
          title: "Ophthalmologist",
          subtitle: "Eyes doctor",
          imagePath: "lib/assets/eye.png",
          bgColor: Color(0xFFFDEBD0),
        ),
        CategoryItem(
          title: "Dentist",
          subtitle: "Teeth Doctor",
          imagePath: "lib/assets/dentist.png",
          bgColor: Color(0xFFFFD6E0),
        ),
      ],
        ),
        SizedBox(height: 15),
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        CategoryItem(
          title: "Ophthalmologist",
          subtitle: "Eyes doctor",
          imagePath: "lib/assets/eye.png",
          bgColor: Color(0xFFFDEBD0),
        ),
        CategoryItem(
          title: "Dentist",
          subtitle: "Teeth Doctor",
          imagePath: "lib/assets/dentist.png",
          bgColor: Color(0xFFFFD6E0),
        ),
      ],
        ),
      ],
  
    );
  }
}

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
      height: 130,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image.asset(imagePath, height: 40, width: 40,),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
