import 'package:flutter/material.dart';

class AboutUi extends StatelessWidget {
  const AboutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'เกี่ยวกับเรา',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.asset(
                  'assets/images/saulogo.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              // ข้อมูลเกี่ยวกับมหาวิทยาลัย
              const Text(
                'มหาวิทยาลัยเอเชียอาคเนย์',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              Center(
                child: Image.asset(
                  'assets/images/profile.jpg',
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                'ชื่อ-สกุลนักศึกษา: ศิรศักดิ์ แสงทองดี',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'รหัสนักศึกษา: 6652410001',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              const Text(
                'สาขาวิชา: เทคโนโลยีดิจิตอลและนวัตกรรม',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'คณะ: คณะวิทยาศาสตร์และเทคโนโลยี',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
