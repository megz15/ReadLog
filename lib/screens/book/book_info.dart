import 'package:flutter/material.dart';

class BookInfo extends StatelessWidget {
  const BookInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https://3.bp.blogspot.com/_s6fUau_2za0/R5YpH8PboMI/AAAAAAAAAJU/pZse-0EZTJg/s0/356px-Foundation%27s_edge_cover.jpg",
              height: 300,
            ),
            const Column(
              children: [
                Text("Foundation's Edge"),
                Text("Isaac Asimov"),
                Text("1982"),
                Text("Science Fiction"),
                Text("4.5"),
              ],
            ),
          ],
        ),
        const Text('Lorem Ipsum dolor sit amet book info popipopipo')
      ],
    );
  }
}