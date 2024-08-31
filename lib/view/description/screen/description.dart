import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/utils/resources/constands.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen(
      {super.key,
      required this.title,
      required this.content,
      required this.publishedAt,
      required this.image});
  final String title;
  final String content;
  final String publishedAt;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 100,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Row(
                children: [Icon(Icons.arrow_back_ios), Text("back")],
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      right: 15,
                      top: 15,
                      child: Icon(
                        Icons.favorite,
                        color: Constants.red,
                        size: 34,
                      ),
                    )
                  ],
                ),
                Constants.height20,
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Constants.height5,
                Row(
                  children: [
                    const Icon(Icons.calendar_today,
                        size: 16.0, color: Constants.grey),
                    Text(
                      publishedAt,
                      style: const TextStyle(
                          fontSize: 11.0, color: Constants.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(content)
              ],
            ),
          ),
        ));
  }
}
