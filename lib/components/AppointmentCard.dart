import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green[900],
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          alignment: Alignment.centerRight,
          image: AssetImage("lib/assets/image02.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "Dr. Joseph Ally",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 3),

          const Text(
            "Ophthalmologist",
            style: TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 15),

          Row(
            children: const [
              Icon(Icons.calendar_today, size: 18, color: Colors.white),
              SizedBox(width: 8),
              Text("September 8   |   12:30",
                  style: TextStyle(color: Colors.white)),
            ],
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white),
                onPressed: () {},
                child: const Text(
                  "Re-Schedule",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white)),
                child: const Text(
                  "View Profile",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
