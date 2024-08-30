
import 'package:flutter/material.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
      elevation: 7.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0,top:12,bottom: 12,right:14 ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://via.placeholder.com/160', // Placeholder image
                width: 84.0, // Adjust the width as needed
                height: 84.0, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12.0), // Space between image and text
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Purus suspendisse adipiscing quam.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 4.0),
                  Text(
                    'At leo tellus ornareornareornareornareornare ornare adipiscing pharetra nisi ornare.',
                    maxLines: 2, // Limiting the text to 2 lines
                    overflow: TextOverflow.ellipsis, // Ellipsis if overflow
                  ),
                  SizedBox(height: 2.0),
                  Row(
                    children: [
                      Icon(Icons.calendar_today,
                          size: 16.0, color: Colors.grey),
                      SizedBox(width: 4.0),
                      Text(
                        'Mon, 21 Dec 2020 14:57 GMT',
                        style: TextStyle(fontSize: 11.0,color: Color.fromARGB(255, 169, 167, 167)),
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
