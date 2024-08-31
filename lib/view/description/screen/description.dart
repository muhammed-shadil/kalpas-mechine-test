import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [Icon(Icons.arrow_back_ios), Text("back")],
              ),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(
                          "assets/min.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                        right: 15,
                        top: 15,
                        child: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 34,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "lorem my aname is muhamemd shadil im fully of ofss talented good boy10",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16.0, color: Colors.grey),
                      Text(
                        'Mon, 21 Dec 2020 14:57 GMT',
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Color.fromARGB(255, 169, 167, 167)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "ooking to become an expert in Android App Development? Whether you're a student or a professional aiming to advance your career in mobile app development, our course, Android App Development with Kotlin, available exclusively on GeeksforGeeks, is the perfect fit for you. Gain hands-on experience with Kotlin, the modern language preferred by Android developers worldwide. This course will guide you through the essentials of Android app development, from the basics to advanced techniques, using practical projects and real-world scenarios. Ideal for beginners and those looking to enhance their existing skills, this course will equip you with the expertise needed to build high-quality, robust Android applications. Ready to master Android development? Enroll now and elevate your career to new heights!")
                ],
              ),
            ),
          ),
        ));
  }
}
