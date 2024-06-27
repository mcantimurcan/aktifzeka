import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:aktifzeka/components/blog_details_page.dart';
import 'package:aktifzeka/models/data_model.dart';
import 'package:aktifzeka/widgets/blog_widget.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  var url = Uri.parse("https://aktifzeka.com/blog/");
  List<DataModel> blogs = [];

  Future getData() async {
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);

    /* title => element.children[1].children[1].text */
    /* date => element.children[1].children[0].children[1].text */
    /* postLink => element.children[1].children[1].children[0].attributes['href'] */
    /* imageLink => element.children[0].children[1].children[0].attributes['src'] */

    var elements = document
        .getElementsByClassName("w-grid-list")[0]
        .getElementsByClassName("w-grid-item-h");

    for (var element in elements) {
      var imgSrc = element.children[0].children[1].children[0].attributes['src']
          .toString();
      var base64String = imgSrc.split(',')[1];
      Uint8List bytes = base64Decode(base64String);

      DataModel newValue = DataModel(
        title: element.children[1].children[1].text,
        imageLink: imgSrc,
        date: element.children[1].children[0].children[1].text,
        link: element.children[1].children[1].children[0].attributes['href']!,
      );

      setState(() {
        blogs.add(newValue);
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              )),
        ),
        title: const Text(
          "Blog Oku",
          style: TextStyle(
            color: Colors.blue,
            fontFamily: "GoogleSans",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.blue,
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10.0,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final post = blogs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BlogWidget(data: post),
                );
              },
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  color: Color.fromARGB(255, 153, 153, 153),
                ),
              ),
              itemCount: blogs.length,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
