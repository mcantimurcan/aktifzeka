import "package:flutter/material.dart";
import 'package:aktifzeka/components/blog_details.dart';
import 'package:aktifzeka/models/data_model.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});
  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final data = dataList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LocaleKeys.explore_page_title.tr()",
          style: TextStyle(
            color: Colors.grey.shade800,
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                )),
          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Divider(
              thickness: 1,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Text(
              "LocaleKeys.explore_page_post.tr()",
              style: const TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListView.separated(
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
          )
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
