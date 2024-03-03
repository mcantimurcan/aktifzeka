import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:aktifzeka/components/text_box.dart';
import '../../constant/constants.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /* final user = FirebaseAuth.instance.currentUser!;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final userCollection = FirebaseFirestore.instance.collection('Person'); */
  dynamic _pickImage;
  var profileImage;
  final ImagePicker _pickerImage = ImagePicker();
  String profileImageLink = "";
  String username = "";
  String description = "";
  int posts = 0;

  @override
  void initState() {
    super.initState();
    /*firebaseDocument();*/
  }

  handleTakePhoto(ImageSource source, {required BuildContext context}) async {
    () => Navigator.pop(context);
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("dosyaya geldim: $profileImage");
        if (profileImage != null) {}
      });
      print('aaa');
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: $_pickImage");
      });
    }
  }

  handleChooseFromGallery(ImageSource source,
      {required BuildContext context}) async {
    Navigator.pop(context);
    try {
      final pickedFile = await _pickerImage.pickImage(source: source);
      setState(() {
        profileImage = pickedFile!;
        print("dosyaya geldim: $profileImage");
        if (profileImage != null) {}
      });
      print('aaa');
    } catch (e) {
      setState(() {
        _pickImage = e;
        print("Image Error: $_pickImage");
      });
    }
  }

  void imagePicker() async {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Bir fotoğraf seçin."),
            children: [
              SimpleDialogOption(
                onPressed: () =>
                    handleTakePhoto(ImageSource.camera, context: context),
                child: const Text("Kamera ile çek"),
              ),
              SimpleDialogOption(
                onPressed: () => handleChooseFromGallery(ImageSource.gallery,
                    context: context),
                child: const Text("Galeriden seç"),
              ),
              SimpleDialogOption(
                child: const Text("İptal"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    });
  }

  Future<void> popUp() {
    return showCupertinoDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Çıkış yapmak istediğinizden emin misiniz?"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                "Evet",
                style: TextStyle(color: lilia),
              ),
            ),
            const SizedBox(width: 15),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Hayır",
                style: TextStyle(
                  color: lilia,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /* signUserOut() async {
    Navigator.pop(context);
    await FirebaseAuth.instance.signOut();
  }

  void firebaseDocument() async {
    var document = await db.collection('Person').doc(user.uid).get();
    Map<String, dynamic>? value = document.data();
    if (this.mounted) {
      setState(() {
        String a = value!['name'];
        username = a;
      });
    }
  } */

  profileReplace() {
    if (profileImageLink == "") {
      return const AssetImage("assets/images/profile_anonym.webp");
    } else {
      return NetworkImage(profileImage);
    }
  }

  Future<void> editField(String field, String title, String name) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(title),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(
              hintText: "Yeni $name",
              hintStyle:
                  TextStyle(color: Theme.of(context).colorScheme.tertiary)),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Vazgeç'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: const Text('Kaydet'),
          )
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      /*await userCollection.doc(user.uid).update({field: newValue});*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Profilim",
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontFamily: "Raleway",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: popUp,
              icon: Icon(
                Icons.logout,
                color: Colors.grey.shade600,
              ),
            ),
          )
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey.shade600,
          ),
        ),
      ),
      body:
          Container(), /*StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Person")
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: profileReplace(),
                          ),
                          InkWell(
                            onTap: () => imagePicker(),
                            child: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: lilia,
                              child: const Icon(
                                Icons.edit,
                                size: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        child: Text(
                          username,
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Text(
                          "user.email!",
                          style: TextStyle(
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        "Kullanıcı Bilgileri",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      MyTextBox(
                        text: userData['name'],
                        sectionName: "İsim Soyisim",
                        onPressed: () =>
                            editField('name', 'İsmi Düzenle', 'isim'),
                      ),
                      MyTextBox(
                        text: userData['description'],
                        sectionName: "Hakkımda",
                        onPressed: () => editField(
                            'description', 'Açıklamayı Düzenle', 'açıklama'),
                      )
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error} hatası'),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: lilia,
            ),
          );
        },
      ),*/
    );
  }

  Padding buildButton(final Function()? onTap, String buttonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 5.0,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 250.0,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: lilia, borderRadius: BorderRadius.circular(12.0)),
          child: Center(
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
