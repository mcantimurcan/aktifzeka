import 'package:aktifzeka/components/blog_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:aktifzeka/models/data_model.dart';

class BlogWidget extends StatefulWidget {
  const BlogWidget({
    super.key,
    required this.data,
  });

  final DataModel data;

  @override
  State<BlogWidget> createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return BlogDetailsPage(
                data: widget.data,
              );
            },
          ),
        );
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.network(
              widget.data.imageLink,
            ),
            Text(widget.data.date),
            ListTile(
              title: Text(widget.data.title),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            )
          ],
        ),
      ),
    );
  }
}
