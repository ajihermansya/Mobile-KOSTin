import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kostin/app/routes/app_pages.dart';
//import 'package:progress_dialog/progress_dialog.dart';
import 'package:sp_util/sp_util.dart';
import '../controllers/loginpage_controller.dart';

//LoginpageView

class LoginpageView extends StatefulWidget {
  const LoginpageView({Key? key}) : super(key: key);
  @override
  _LoginpageViewState createState() => _LoginpageViewState();
}

class _LoginpageViewState extends State<LoginpageView> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
            color: new Color(0xff217DA5),
            gradient: LinearGradient(
              colors: [(new Color(0xff58A5C6)), new Color(0xff217DA5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 170,
                  width: 170,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, top: 5),
                alignment: Alignment.bottomRight,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                cursorColor: Color(0xff58A5C6),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff58A5C6),
                  ),
                  hintText: "Enter Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        //password

        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffEEEEEE),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: Column(
            children: [
              TextFormField(
                obscureText: true,
                controller: passwordController,
                cursorColor: Color(0xff58A5C6),
                decoration: InputDecoration(
                  focusColor: Color(0xff58A5C6),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xff58A5C6),
                  ),
                  hintText: "Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Write Click Listener Code Here
            },
            child: Text("Forget Password?"),
          ),
        ),
        GestureDetector(
          onTap: () {
            // Write Click Listener Code Here.
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(new Color(0xff58A5C6)), new Color(0xff217DA5)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: MaterialButton(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                minWidth: MediaQuery.of(context).size.width,
                onPressed: () {
                  this._dologin();
                },
                child: Text(
                  "login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't Have Any Account?  "),
              GestureDetector(
                child: Text(
                  "Register Now",
                  style: TextStyle(color: Color(0xff217DA5)),
                ),
                onTap: () {
                  Get.toNamed(Routes.SIGN_UP_SCREEN);
                },
              )
            ],
          ),
        )
      ],
    )));
  }

  Future _dologin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              title: "Opss...",
              desc: "Terjadi Kesalahan, user dan password tidak benar!")
          .show();
      return;
    }
    // ProgressDialog progressDialog = ProgressDialog(context);
    // progressDialog.style(message: "loading..");
    // progressDialog.show();
    final response = await http
        .post(Uri.parse('http://localhost/kostin/public/api/login'), body: {
      'email': emailController.text,
      'password': passwordController.text
    }, headers: {
      'Accept': 'application/json'
    });
    // progressDialog.hide();
    if (response.statusCode == 200) {
      // SpUtil.putBool("isLogin", true);
      // SpUtil.putString("email", emailController.text);
      Get.offAndToNamed(Routes.HOME_INTI);
    } else {
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              title: "ERROR",
              desc: "Cek kembali email dan pasword anda!")
          .show();
    }
  }

  // void onPressedButtonLogin(){
  //   String username = emailController.text;
  //   String password = passwordController.text;
  //   if (username == "bisa" && password = "12345678") {
  //     Get.offAndToNamed(Routes.HOME);
  //   }else{
  //     AwesomeDialog(context: Get.context!,
  //     dialogType: DialogType.error,
  //     title:"opss...",
  //     desc: "Terjadi Kesalahan, user dan password tidak benar",
  //     btnOkOnPress: () {},
  //     ).show();
  //   }
  // }
}
