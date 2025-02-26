import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_ui_2.dart';
import 'home_ui_3.dart';
import 'home_ui_4.dart';
import 'about_ui.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [HomePage(), HomeUi2(), HomeUi3(), HomeUi4()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 211, 211, 211),
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUi()),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 112, 191, 255),
        selectedItemColor: const Color.fromARGB(255, 80, 80, 80),
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'อุบัติเหตุ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sim_card),
            label: 'ค่ายมือถือ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions),
            label: 'การเดินทาง',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'ไม่สามารถโทรไปยังหมายเลข $phoneNumber ได้';
    }
  }

  final List<Map<String, String>> banks = [
    {'name': 'กสิกรไทย', 'phone': '02 888 8888', 'logo': 'assets/images/kbank.png'},
    {'name': 'กรุงไทย', 'phone': '02 111 1111', 'logo': 'assets/images/ktb.png'},
    {'name': 'ออมสิน', 'phone': '1115', 'logo': 'assets/images/gsb.png'},
    {'name': 'ทีเอมบี', 'phone': '1428', 'logo': 'assets/images/ttb.png'},
    {'name': 'ธนาคารอาคารสงเคราะห์', 'phone': '02 645 9000', 'logo': 'assets/images/ghb.png'},
    {'name': 'ไทยพาณิชย์', 'phone': '02 777 7777', 'logo': 'assets/images/scb.png'},
    {'name': 'เกียรตินาคินภัทร', 'phone': '02 165 5555', 'logo': 'assets/images/kk.png'},
    {'name': 'ธนาคารไทยเครดิต', 'phone': '02 697 5454', 'logo': 'assets/images/tcrb.png'},
    {'name': 'UOB', 'phone': '02 285 1555', 'logo': 'assets/images/uob.png'},
    {'name': 'TISCO', 'phone': '02 633 6000', 'logo': 'assets/images/tisco.png'},
    {'name': 'ธนาคารอิสลามแห่งประเทศไทย', 'phone': '02 204 2766', 'logo': 'assets/images/ibank.png'},
    {'name': 'CIMB Thai', 'phone': '02 626 7777', 'logo': 'assets/images/cimb.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "สายด่วนธนาคาร",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/images/atm.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: banks.length,
            itemBuilder: (context, index) {
              final bank = banks[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: Image.asset(
                    bank['logo']!,
                    width: 80,
                    height: 80,
                  ),
                  title: Text(
                    bank['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(bank['phone']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    color: Colors.blueAccent,
                    onPressed: () => _makePhoneCall(bank['phone']!),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
