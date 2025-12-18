// import 'package:carecheck/components/Calender.dart';
import 'package:carecheck/Pages/Message.dart';
import 'package:flutter/material.dart';

class DoctorDetailPage extends StatefulWidget {
  const DoctorDetailPage({super.key});

  @override
  State<DoctorDetailPage> createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  int selectedIndex = -1;
  int selectedMonthIndex = 0;
  int selectedDayIndex = -1;

  int daysInMonth(int month) {
    DateTime now = DateTime(DateTime.now().year, month + 1, 0);
    return now.day;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> times = [
      "09:00 AM",
      "10:30 AM",
      "12:00 PM",
      "01:30 PM",
      "03:00 PM",
      "04:30 PM",
      "06:00 PM",
    ];
    final List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: const Text(
          "Doctor Detail",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.grey[200],

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ▬▬▬ TOP DOCTOR HEADER ▬▬▬
              Stack(
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 20,
                    left: 15,
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Colors.yellow, size: 30),
                        SizedBox(width: 5),
                        Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 15,
                    bottom: 0,
                    child: Image.asset("lib/assets/image02.png", height: 240),
                  ),

                  Positioned(
                    top: 70,
                    left: 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dr. Josephat Ally",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "RN | BSc | PhD | MD\nOphthalmologist",
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 260,
                          child: Text(
                            "Ok, dr. josephat have take career and \nhave more professional "
                            "on eyes disorders, have 5Yrs Experience",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ▬▬▬ INFO CHIPS ▬▬▬
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    infoChip(Icons.workspace_premium, "5 Years\nExperience"),
                    infoChip(Icons.people, "100+\nPatients"),
                    infoChip(Icons.star, "224k+\nFollowers"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ▬▬▬ VIDEO CALL REQUEST ▬▬▬
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Request a video call Appointment",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ▬▬▬ DATE SELECTOR ▬▬▬
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ▬▬▬ Month Selector ▬▬▬
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Select Date",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          Row(
                            children: [
                              // Prev month
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedMonthIndex > 0) {
                                      selectedMonthIndex--;
                                      selectedDayIndex = -1; // reset selected day
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.green,
                                ),
                              ),

                              Text(
                                months[selectedMonthIndex],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),

                              // Next month
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (selectedMonthIndex < 11) {
                                      selectedMonthIndex++;
                                      selectedDayIndex =
                                          -1; // reset selected day
                                    }
                                  });
                                },
                                child: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),

                      // ▬▬▬ Horizontal scroll date list ▬▬▬
                      SizedBox(
                        height: 90,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: daysInMonth(selectedMonthIndex + 1),
                          separatorBuilder:
                              (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final dayNumber = (index + 1).toString().padLeft(
                              2,
                              "0",
                            );
                            final List<String> days = [
                              "Mon",
                              "Tue",
                              "Wed",
                              "Thu",
                              "Fri",
                              "Sat",
                              "Sun",
                            ];
                            final weekday = days[index % 7];
                            final bool isSelected = selectedDayIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDayIndex = index;
                                });
                              },
                              child: Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? Colors.green[800]
                                          : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 10,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dayNumber,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      weekday,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black87,
                                      ),
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
              ),

              const SizedBox(height: 20),

              // ▬▬▬ TIME SELECTOR ▬▬▬
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Available time",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 15),

                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: times.length,
                          separatorBuilder:
                              (_, __) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            final bool isSelected = selectedIndex == index;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? Colors.green[800]
                                          : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  times[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isSelected
                                            ? Colors.white
                                            : Colors.black,
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

              const SizedBox(height: 25),

              // ▬▬▬ FINAL BUTTON ▬▬▬
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // ▬▬▬ LEFT ICON BUTTON ▬▬▬
                    SizedBox(
                      height: 55,
                      width: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green[800],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Message icon
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Message()),
                          );
                        },
                        child: Center(
                          child: const Icon(
                            Icons.message_outlined,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 8),

                    // ▬▬▬ RIGHT MAIN BUTTON ▬▬▬
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Reschedule button action
                          },
                          child: const Text(
                            "Reschedule Appointment",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // ▬▬▬ SMALL WIDGETS ▬▬▬

  Widget infoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 172, 217, 240),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black87),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget dateBox(String day, String weekday) {
    return Container(
      width: 55,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Column(
        children: [
          Text(
            day,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            weekday,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget timeChip(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        time,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
