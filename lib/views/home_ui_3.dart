import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUi3 extends StatelessWidget {
  HomeUi3({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'ไม่สามารถโทรไปยังหมายเลข $phoneNumber ได้';
    }
  }

  final List<Map<String, String>> carriers = [
    {'name': 'AIS', 'phone': '1175', 'logo': 'assets/images/ais.png'},
    {'name': 'DTAC', 'phone': '1678', 'logo': 'assets/images/dtac.png'},
    {'name': 'TrueMove H', 'phone': '1242', 'logo': 'assets/images/true.png'},
    {'name': 'TOT Mobile', 'phone': '1100', 'logo': 'assets/images/tot.png'},
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
                'สายด่วนค่ายมือถือ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/images/phone.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: carriers.length,
            itemBuilder: (context, index) {
              final carrier = carriers[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: Image.asset(
                    carrier['logo']!,
                    width: 80,
                    height: 80,
                  ),
                  title: Text(
                    carrier['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(carrier['phone']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    color: Colors.blueAccent,
                    onPressed: () => _makePhoneCall(carrier['phone']!),
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
