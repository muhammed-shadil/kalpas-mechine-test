import 'package:flutter/material.dart';
import 'package:kalbas_mechine_test/utils/resources/constands.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    super.key,
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.image,
  });
  final String title;
  final String description;
  final String publishedAt;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, top: 12, bottom: 12, right: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image, // Placeholder image
                width: 84.0, // Adjust the width as needed
                height: 84.0, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
            Constants.width12, // Space between image and text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Ellipsis if overflow
                  ),
                  Constants.height2,
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16.0, color: Constants.grey),
                      Constants.width4,
                      Text(
                        publishedAt,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 11.0, color: Constants.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
