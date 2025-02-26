import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUi2 extends StatelessWidget {
  HomeUi2({super.key});

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'ไม่สามารถโทรไปยังหมายเลข $phoneNumber ได้';
    }
  }

  final List<Map<String, String>> emergency = [
    {
      'name': 'เหตุด่วนเหตุร้าย',
      'phone': '191',
      'logo': 'assets/images/a.png',
    },
    {
      'name': 'แจ้งไฟไหม้สัตว์เข้าบ้าง',
      'phone': '199',
      'logo': 'assets/images/h.png',
    },
    {
      'name': 'สายด่วนรถหาย',
      'phone': '1992',
      'logo': 'assets/images/a.png',
    },
    {
      'name': 'อุบัติเหตุทางน้ำ',
      'phone': '1196',
      'logo': 'assets/images/f.png',
    },
    {
      'name': 'แจ้งคนหาย',
      'phone': '1300',
      'logo': 'assets/images/c.png',
    },
    {
      'name': 'ศูนย์ความปลอดภัยคมนาคม',
      'phone': '1356',
      'logo': 'assets/images/g.png',
    },
    {
      'name': 'หน่วยแพทย์กู้ชีพ',
      'phone': '1554',
      'logo': 'assets/images/e.png',
    },
    {
      'name': 'ศูนย์เอราวัณ',
      'phone': '1646',
      'logo': 'assets/images/d.png',
    },
    {
      'name': 'เจ็บป่วยฉุกเฉิน',
      'phone': '1669',
      'logo': 'assets/images/i.jpg',
    },
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
                'สายด่วนอุบัติเหตุ-เหตุฉุกเฉิน',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/images/accident.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: emergency.length,
            itemBuilder: (context, index) {
              final item = emergency[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                child: ListTile(
                  leading: Image.asset(
                    item['logo']!,
                    width: 80,
                    height: 80,
                  ),
                  title: Text(
                    item['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(item['phone']!),
                  trailing: IconButton(
                    icon: const Icon(Icons.phone),
                    color: Colors.blueAccent,
                    onPressed: () => _makePhoneCall(item['phone']!),
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
