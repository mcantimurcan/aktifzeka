import 'package:flutter/material.dart';
import 'package:aktifzeka/components/blog_details.dart';
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
  var blogData;
  var url = Uri.parse("https://aktifzeka.com/blog/");

  Future getData () async {
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document.getElementsByClassName("w-grid-list")[0].getElementsByClassName("w-grid-item-h").forEach((element) => print(element.text.toString()));
  }

  final data = dataList;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 1,
              color: Colors.blue.shade500,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              "Bloglar",
              style: const TextStyle(
                fontFamily: "GoogleSans",
                fontWeight: FontWeight.normal,
                fontSize: 17
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          Text(blogData.toString()),
          /* ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: BlogModelWidget(post),
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(),
            ),
            itemCount: data.length,
          )*/
        ],
      ),
    );
  }

  Widget BlogModelWidget(DataModel data) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BlogDetailsPage(data: data)));
      },
      child: Container(
        child: Row(
          children: [
            Container(
              width: 160,
              height: 75,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  data.imageName,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: const TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${data.author} ${data.date}",
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}