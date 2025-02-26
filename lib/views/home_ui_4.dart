import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeUi4 extends StatelessWidget {
  HomeUi4({super.key});

  // ฟังก์ชันโทรออก
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'ไม่สามารถโทรไปยังหมายเลข $phoneNumber ได้';
    }
  }

  // ข้อมูลหน่วยงาน/บริการเกี่ยวกับการเดินทาง
  final List<Map<String, String>> travel = [
    {
      'name': 'รถไฟฟ้า BTS',
      'phone': '0 2617 6000',
      'logo': 'assets/images/3.png',
    },
    {
      'name': 'รถไฟฟ้า MRT',
      'phone': '0 2624 5200',
      'logo': 'assets/images/4.png',
    },
    {
      'name': 'กรมทางหลวงชนบท',
      'phone': '1146',
      'logo': 'assets/images/F1.png',
    },
    {
      'name': 'ตำรวจท่องเที่ยว',
      'phone': '1155',
      'logo': 'assets/images/F2.png',
    },
    {
      'name': 'ตำรวจทางหลวง',
      'phone': '1193',
      'logo': 'assets/images/F3.png',
    },
    {
      'name': 'ข้อมูลจราจร',
      'phone': '1197',
      'logo': 'assets/images/F4.png',
    },
    {
      'name': 'ขสมก.',
      'phone': '1348',
      'logo': 'assets/images/F5.png',
    },
    {
      'name': 'บขส.',
      'phone': '1490',
      'logo': 'assets/images/F6.png',
    },
    {
      'name': 'เส้นทางบนทางด่วน',
      'phone': '1543',
      'logo': 'assets/images/F7.png',
    },
    {
      'name': 'กรมทางหลวง',
      'phone': '1586',
      'logo': 'assets/images/F8.png',
    },
    {
      'name': 'การรถไฟแห่งประเทศไทย',
      'phone': '1690',
      'logo': 'assets/images/F10.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ส่วนหัว
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'สายด่วนการเดินทาง',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          
          // รูปภาพ
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/images/drive.jpg',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          
          // รายการหน่วยงาน/บริการ
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: travel.length,
            itemBuilder: (context, index) {
              final item = travel[index];
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
