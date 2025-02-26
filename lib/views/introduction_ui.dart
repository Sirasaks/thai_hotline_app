import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:thai_hotline_app/views/home_ui.dart';

class IntroductionUi extends StatefulWidget {
  const IntroductionUi({super.key});

  @override
  State<IntroductionUi> createState() => _IntroductionUiState();
}

class _IntroductionUiState extends State<IntroductionUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: _buildTitle(
              "เมื่อต้องเดินทางทั้งในเมือง ออกต่างจังหวัด\nจะใกล้หรือไกลเพียงใด\nสอบถามข้อมูลการเดินทาง การจราจร\nทางด่วน ทางหลัก ทางรอง\nเส้นทางเลี่ยงการจราจรติดขัด\nข้อมูลรถทัวร์ รถไฟ ขสมก. BTS MRT\nชักช้าอยู่ใย โทรเลย!!!",
            ),
            bodyWidget: _buildBody(),
            image: _buildImage('assets/images/atm.jpg'),
          ),
          PageViewModel(
            titleWidget: _buildTitle(
              "อุบัติเหตุ ป่วยฉุกเฉิน ไฟใหม้\nรถหาย สัตว์ร้ายเข้าบ้าน\nทุกอย่างเกิดขึ้นได้ตลอดเวลา\nจะดีกว่าไหม\nเมื่อพบเจออุบัติเหตุ เหตุด่วน เหตุดร้าย\nสามารถโทรแจ้งได้ทันท่วงที\nไม่ต้องรอ โทรเลย!!!",
            ),
            bodyWidget: _buildBody(),
            image: _buildImage('assets/images/accident.jpg'),
          ),
          PageViewModel(
            titleWidget: _buildTitle(
              "เมื่อเงินคือสิ่งสำคัญสำหรับการดำเนินชีวิต\nกิน เที่ยว ซื้อสินค้า\nการเดินทาง การรักษาพยาบาล\nหรือโดนเหตุมิจฉาชีพ\nแก๊งคอลเซ็นเตอร์หลอกลวง\nสามารถติดต่อธนาคารโดยตรง\nได้เลย โทรเลย!!!",
            ),
            bodyWidget: _buildBody(),
            image: _buildImage('assets/images/drive.jpg'),
          ),
          PageViewModel(
            titleWidget: _buildTitle(
              "น้ำไม่ไหล\nไฟฟ้าดับ\nโทรไม่ติด\nอินเตอร์เน็ตมีปัญหา\nเข้า Social Media ไม่ได้\nรอไม่ได้ โทรเลย!!!",
            ),
            bodyWidget: _buildBody(),
            image: _buildImage('assets/images/phone.jpg'),
          ),
        ],
        globalBackgroundColor: Colors.white,  // กำหนดพื้นหลังเป็นสีขาว
        showSkipButton: true,
        skip: Text('ข้าม'),
        showNextButton: true,
        next: Icon(Icons.arrow_forward_ios),
        showDoneButton: true,
        done: Text('หน้าหลัก'),
        onDone: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeUi()),
          );
        },
        scrollPhysics: ClampingScrollPhysics(),
      ),
    );
  }

  Widget _buildTitle(String text) {
    List<TextSpan> spans =
        text.split("\n").map((line) {
          List<TextSpan> lineSpans = [];
          line.split(' ').forEach((word) {
            if (word == 'โทรเลย!!!') {
              lineSpans.add(
                TextSpan(
                  text: '$word ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            } else {
              lineSpans.add(
                TextSpan(
                  text: '$word ',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              );
            }
          });

          return TextSpan(children: lineSpans);
        }).toList();

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: spans),
    );
  }

  Widget _buildBody() {
    return Text(
      "สายด่วนที่สำคัญที่สุดสำหรับทุกสถานการณ์",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImage(String imagePath) {
    return Image.asset(
      imagePath,
      width: MediaQuery.of(context).size.width * 0.5,
    );
  }
}
