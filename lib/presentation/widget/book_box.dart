import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:image_network/image_network.dart';
import '../../domain/entity/book.dart';

class BookBox extends StatelessWidget {
  const BookBox({
    required this.book,
    required this.onPressed,
    this.isRegistered = false,
    Key? key,
  }) : super(key: key);
  final Book book;
  final Future<void> Function() onPressed;
  final bool isRegistered;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 5),
                child: ImageNetwork(
                  image: book.smallImageUrl ?? '',
                  height: 60,
                  width: 50,
                  fitAndroidIos: BoxFit.contain,
                  onLoading: SkeletonAnimation(
                    child: Container(
                      color: const Color.fromARGB(70, 125, 125, 125),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 9,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      book.title ?? '',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      book.author ?? '',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 184, 180, 180),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  await onPressed();
                },
                child: Icon(
                  isRegistered ? Icons.check_box : Icons.add_box,
                  color: isRegistered ? Colors.brown[200] : Colors.brown,
                  size: 25,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        const Divider(
          color: Colors.black12,
          thickness: 3,
          height: 10,
          indent: 10,
        ),
      ],
    );
  }
}
