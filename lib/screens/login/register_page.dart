import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constant/constants.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();

  /*signUserUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        AuthService().createPersonWithRegisterPage(
          nameController.text,
          emailController.text,
          passwordController.text,
        );
        Navigator.pop(context);
      } else if (passwordController.text != confirmPasswordController.text) {
        showErrorMessage("Şifreler birbiriyle uyuşmuyor.");
      }
    } on FirebaseAuthException catch (e) {
      showErrorMessage(e.code);
    }
  }*/

  void showErrorMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF4E6C50),
          title: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.purple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "YKS Cepte",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Kayıt Sayfası",
                    style: TextStyle(
                      fontFamily: "Source Sans Pro",
                      fontSize: 15.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB38ED3),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                    width: 200.0,
                    child: Divider(
                      color: Colors.grey.shade200,
                      thickness: 1,
                    ),
                  ),
                  buildTextField(
                      Icons.person, nameController, "İsim Soyisim", false, TextInputType.name),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(Icons.email, emailController, "E-mail", false, TextInputType.emailAddress),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(Icons.lock, passwordController, "Şifre", true, TextInputType.name),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildTextField(Icons.lock, confirmPasswordController,
                      "Şifreyi Onayla", true, TextInputType.name),
                  const SizedBox(
                    height: 20.0,
                  ),
                  buildButton(() => null),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "veya",
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Colors.grey.shade200,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          height: 50.0,
                          child: Image.asset("assets/images/google.png"),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Zaten hesabınız var mı? ",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          "Giriş Yapın",
                          style: TextStyle(
                            color: lilia,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Padding buildButton(Function() onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Container(
          width: 150.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              color: lilia, borderRadius: BorderRadius.circular(6.0)),
          child: const Center(
            child: Text(
              "Kaydol",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTextField(
      IconData icon, final controller, String hintText, bool obscureText, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        keyboardType: type,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.grey[500]),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Theme.of(context).colorScheme.primary,
          filled: true,
        ),
      ),
    );
  }
}
