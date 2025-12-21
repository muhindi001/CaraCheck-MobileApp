// import 'package:carecheck/Pages/Settings.dart';
import 'package:carecheck/Pages/Card_Page.dart';
import 'package:carecheck/Pages/Bill_Page.dart';
import 'package:carecheck/components/All_Doctor.dart';
import 'package:carecheck/components/AppointmentCard.dart';
import 'package:carecheck/components/DoctorsCategory.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  bool _paymentCompleted = false;
  String _lastPaidAmount = '';

  Widget _buildBody() {
    if (_selectedIndex == 0) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_paymentCompleted)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(color: Colors.green[50], borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.green)),
                  child: Text('Payment successful: $_lastPaidAmount', style: TextStyle(color: Colors.green[900], fontWeight: FontWeight.w600)),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("lib/assets/image01.png"),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "Josephat Abdulkdil",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 50,
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search doctor...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.mic_none),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // UPCOMING APPOINTMENT
              Text(
                "Upcoming Appointment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),
              AppointmentCard(),

              const SizedBox(height: 25),

              // FIND DOCTOR SECTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Find Doctor",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to see all doctors
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllDoctor(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.green[400],
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const DoctorsCategory(),
              const SizedBox(height: 30),

              // FIND NEARBY HOSPITAL
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby Hospital",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.green[400],
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "lib/assets/hospital.png",
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                
              ),
            ],
          ),
        ),
      );
    }

    if (_selectedIndex == 1) return CardPage(onPayment: (amount) {
      setState(() {
        _paymentCompleted = true;
        _lastPaidAmount = amount;
        _selectedIndex = 0; // return to home after payment (optional)
      });
    });
    if (_selectedIndex == 2) return BillPage();
    return Center(
      child: Text(
        'Profile Page',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String appBarTitle;
    switch (_selectedIndex) {
      case 1:
        appBarTitle = 'Card';
        break;
      case 2:
        appBarTitle = 'Bill';
        break;
      case 3:
        appBarTitle = 'Profile';
        break;
      default:
        appBarTitle = 'CareCheck';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white, size: 30),
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ],
        backgroundColor: Colors.green[400],
      ),
      drawer: _selectedIndex == 0
          ? Drawer(
              child: Container(
                color: Colors.grey[300],
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Center(
                        child: Text(
                          "CareCheck",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home", style: TextStyle(fontSize: 20)),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text("Settings", style: TextStyle(fontSize: 20)),
                      onTap: () {
                        setState(() {
                          _selectedIndex = 3;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            )
          : null,
      backgroundColor: Colors.grey[200],
      body: _buildBody(),
      // BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[400],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Card"),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Bill"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "Profile",),
        ],
      ),
    );
  }
}

