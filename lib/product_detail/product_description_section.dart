import 'package:flutter/material.dart';

class ProductDescriptionSection extends StatelessWidget {
  final List<String> images;
  final String description;

  const ProductDescriptionSection(
      {super.key, required this.images, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: <Color>[
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.red
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: const Center(
                child: Text("細部說明"),
              ),
            ),
            const Expanded(
                child: Divider(
              thickness: 1,
              indent: 10,
            )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(description),
        for (var imageUrl in images)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          )
      ],
    );
  }
}
