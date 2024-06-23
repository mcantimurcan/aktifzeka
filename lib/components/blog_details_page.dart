import 'package:flutter/material.dart';
import 'package:aktifzeka/models/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

class BlogDetailsPage extends StatefulWidget {
  final DataModel data;
  const BlogDetailsPage({Key? key, required this.data}) : super(key: key);

  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  var blogData;

  Future getData () async {
    var url = Uri.parse(widget.data.link);
    var res = await http.get(url);
    final body = res.body;
    final document = parser.parse(body);
    var response = document.getElementsByClassName("w-grid-list")[0].getElementsByClassName("w-grid-item-h").forEach((element) => print(element.text.toString()));
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
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              widget.data.title,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Quicksand"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: MemoryImage(
                      widget.data.imageLink,
                    ),
                    fit: BoxFit.fitHeight,
                  ),
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26)
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "widget.data.context",
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 17,
                    fontFamily: "Quicksand"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}