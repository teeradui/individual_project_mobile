import 'package:flutter/material.dart';

class VideoGrid extends StatelessWidget {
  final int columns;

  const VideoGrid({super.key, required this.columns});

  @override
  Widget build(BuildContext context) {
    const img = [
              "assets/1.jpg",
              "assets/2.jpg",
              "assets/3.jpg",
              "assets/4.jpg",
              "assets/5.jpg",
              "assets/6.jpg",
            ];

    return GridView.builder(

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      padding: const EdgeInsets.all(12),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 9 / 16,
      ),

      itemCount: img.length,

      itemBuilder: (context, index) {

        return Stack(
          children: [

            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  img[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const Positioned(
              bottom: 6,
              left: 6,
              child: Row(
                children: [

                  Icon(Icons.play_arrow,
                      size: 16,
                      color: Colors.white),

                  SizedBox(width: 2),

                  Text(
                    "218",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}