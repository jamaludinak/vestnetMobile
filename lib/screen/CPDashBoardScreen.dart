import 'package:VESTNET3/fragment/CPProfileFregment.dart';
import 'package:VESTNET3/screen/CPPortofolioScreen.dart';
import 'package:flutter/material.dart';
import '../fragment/CPHomeFragment.dart';
import '../fragment/CPNotificationFragment.dart';
import '../screen/CPSearchScreen.dart';
import '../utils/CPColors.dart';

class CPDashBoardScreen extends StatefulWidget {
  @override
  CPDashBoardScreenState createState() => CPDashBoardScreenState();
}

class CPDashBoardScreenState extends State<CPDashBoardScreen> {

  int currentIndex = 0;
  List<Widget> tabs = [
    CPHomeFragment(),
    CPSearchScreen(),
    CPNotificationFragment(),
    CPPortofolioScreen(),
    CPProfileFragment(), // Fragment Profil
    // Tambahkan fragment baru di sini jika diperlukan
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: tabs, index: currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: CPPrimaryColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true, // Tampilkan label yang dipilih
        showUnselectedLabels: true, // Tampilkan label yang tidak dipilih
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Pencarian',
            activeIcon: Icon(Icons.search_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notifikasi',
            activeIcon: Icon(Icons.notifications_sharp),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined), // Ikon dompet
            label: 'Portofolio',
            activeIcon: Icon(Icons.account_balance_wallet), // Ikon dompet aktif
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
