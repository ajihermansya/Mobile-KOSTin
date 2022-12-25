import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kostin/app/routes/app_pages.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../controllers/sign_up_screen_controller.dart';
//SignUpScreenView

class SignUpScreenView extends StatefulWidget {
  const SignUpScreenView({Key? key}) : super(key: key);
  @override
  _SignUpScreenViewState createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<SignUpScreenView> {
  final TextEditingController fullnameController = new TextEditingController();
  final TextEditingController emailregController = new TextEditingController();
  final TextEditingController passwordregController =
      new TextEditingController();
  final TextEditingController passwordsController = new TextEditingController();

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
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
                margin: EdgeInsets.only(top: 40),
                child: Image.asset(
                  "assets/logo/logo.png",
                  height: 180,
                  width: 180,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.bottomRight,
                child: Text(
                  "Register",
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
                controller: fullnameController,
                cursorColor: Color(0xff58A5C6),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0xff58A5C6),
                  ),
                  hintText: "Full Name",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
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
                controller: emailregController,
                cursorColor: Color(0xff58A5C6),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xff58A5C6),
                  ),
                  hintText: "Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        Container(
          //CONFIRM PASSWORD
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
                controller: passwordregController,
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
                controller: passwordsController,
                obscureText: true,
                cursorColor: Color(0xff58A5C6),
                decoration: InputDecoration(
                  focusColor: Color(0xff58A5C6),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xff58A5C6),
                  ),
                  hintText: "Confirmation Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            this._signup();
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
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: Text(
              "REGISTER",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Have Already Member?  "),
              GestureDetector(
                child: Text(
                  "Login Now",
                  style: TextStyle(color: Color(0xff58A5C6)),
                ),
                onTap: () {
                  // Write Tap Code Here.
                  Get.toNamed(Routes.LOGINPAGE);
                },
              )
            ],
          ),
        )
      ],
    )));
  }

  Future _signup() async {
    if (fullnameController.text.isEmpty ||
        emailregController.text.isEmpty ||
        passwordregController.text.isEmpty ||
        passwordsController.text.isEmpty) {
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              title: "Opss...",
              desc: "Terjadi Kesalahan, masukkan data dengan benar!")
          .show();
      return;
    }
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.style(message: "loading..");
    progressDialog.show();
    final response = await http
        .post(Uri.parse('http://localhost/kostin/public/api/register'), body: {
      'name': fullnameController.text,
      'email': emailregController.text,
      'password': passwordregController.text,
      'password_confirmation': passwordsController.text
    }, headers: {
      'Accept': 'application/json'
    });
    progressDialog.hide();

    if (response.statusCode == 422) {
      Get.offAndToNamed(Routes.LOGINPAGE);
    } else {
      AwesomeDialog(
              context: Get.context!,
              dialogType: DialogType.error,
              title: "ERROR",
              desc: "Cek kembali email dan pasword anda!")
          .show();
    }
  }
}
