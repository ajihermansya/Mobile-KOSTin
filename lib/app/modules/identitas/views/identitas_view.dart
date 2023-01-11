import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kostin/provider/cart_provider.dart';
import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:provider/provider.dart';

import '../controllers/identitas_controller.dart';
//IdentitasView

class IdentitasView extends StatefulWidget {
  const IdentitasView({Key? key}) : super(key: key);
  @override
  _IdentitasViewState createState() => _IdentitasViewState();
}

class _IdentitasViewState extends State<IdentitasView> {
  final TextEditingController fullnameController = new TextEditingController();
  final TextEditingController emailregController = new TextEditingController();
  final TextEditingController NIKController = new TextEditingController();
  final TextEditingController TTLController = new TextEditingController();
  final TextEditingController AlamatController = new TextEditingController();
  final TextEditingController ProvinsiController = new TextEditingController();
  final TextEditingController KabupatenController = new TextEditingController();
  final TextEditingController KelurahanController = new TextEditingController();
  final TextEditingController RTRWController = new TextEditingController();
  final TextEditingController GenderController = new TextEditingController();
  final TextEditingController PerkawinanController =
      new TextEditingController();
  final TextEditingController PekerjaanController = new TextEditingController();

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Identitas Diri',
          textAlign: TextAlign.center,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: new Color(0xff217DA5),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff58A5C6), Color(0xff217DA5)])),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          //Menangani kejadian saat menu home diklik
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: NIKController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.credit_card_rounded,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "NIK",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: TTLController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Tempat Tanggal Lahir",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: AlamatController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Alamat",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: ProvinsiController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Provinsi",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: KabupatenController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.location_city_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Kabupaten",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: KelurahanController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.maps_home_work_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Kelurahan",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: RTRWController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.pending_actions_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "RT/Rw",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: GenderController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.female_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Jenis Kelamin",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: PerkawinanController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.book_online_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Status Perkawinan",
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
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                  controller: PekerjaanController,
                  cursorColor: Color(0xff58A5C6),
                  decoration: InputDecoration(
                    focusColor: Color(0xff58A5C6),
                    icon: Icon(
                      Icons.date_range_outlined,
                      color: Color(0xff58A5C6),
                    ),
                    hintText: "Status Pekerjaan",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          Consumer<CartProvider>(
            builder: (context, value, _) {
              String strPesanan = "";
              value.cart.forEach((element) {
                strPesanan = strPesanan +
                    "\n" +
                    element.name +
                    "(" +
                    element.quantity.toString() +
                    ")";
              });
              return GestureDetector(
                onTap: () async {
                  String pesanan = "Nama Lengkap : " +
                      fullnameController.text +
                      "Email : " +
                      emailregController.text +
                      "Pesanan : " +
                      "\n" +
                      strPesanan;
                  // FlutterOpenWhatsapp.sendSingleMessage(
                  //     "6283847978702", pesanan);
                  print(pesanan);
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      (new Color(0xff58A5C6)),
                      new Color(0xff217DA5)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: Color(0xffEEEEEE)),
                    ],
                  ),
                  child: Text(
                    "Booking Kost",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
