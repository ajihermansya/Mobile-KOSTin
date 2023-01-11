//ListoneView

import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kostin/models/models_home/menu_model.dart';
import 'package:kostin/provider/cart_provider.dart';

import 'package:open_whatsapp/open_whatsapp.dart';
import 'package:provider/provider.dart';

class ListoneView extends StatefulWidget {
  const ListoneView({super.key});
  @override
  State<ListoneView> createState() => _ListoneViewState();
}

class _ListoneViewState extends State<ListoneView> {
  final String urlMenu =
      "https://script.google.com/macros/s/AKfycbyxFRDYsmVNz2PR2Ejpk4Iq7DDxkQMUyCPkiTH_utO3PLmnpTjp_iHxiGoO8X9COYuW/exec";

  Future<List<MenuModel>> getAllData() async {
    List<MenuModel> listMenu = [];
    var response = await http.get(Uri.parse(urlMenu));
    List data = json.decode(response.body);

    data.forEach((element) {
      listMenu.add(MenuModel.fromJson(element));
    });

    return listMenu;
  }

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
  Widget build(BuildContext context) {
    //TextEditingController namaController = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openDialog();
          //initWidget();
        },
        backgroundColor: Color(0xff58A5C6),
        child: Badge(
          badgeContent: Consumer<CartProvider>(
            builder: (
              context,
              value,
              _,
            ) {
              return Text(
                (value.total > 0) ? value.total.toString() : "",
                style: GoogleFonts.montserrat(color: Colors.white),
              );
            },
          ),
          child: Icon(Icons.shopping_bag),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: getAllData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            MenuModel menu = snapshot.data![index];
                            return Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Container(
                                        width: 150,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(menu.image),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            menu.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            menu.description,
                                            textAlign: TextAlign.left,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Rp. " + menu.price.toString(),
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      Provider.of<CartProvider>(
                                                              context,
                                                              listen: false)
                                                          .addRemove(menu.name,
                                                              menu.id, false);
                                                    },
                                                    icon: Icon(
                                                      Icons.remove_circle,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 0,
                                                  ),
                                                  Consumer<CartProvider>(
                                                    builder:
                                                        (context, value, _) {
                                                      var id = value.cart
                                                          .indexWhere(
                                                              (element) =>
                                                                  element
                                                                      .menuId ==
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .id);
                                                      return Text(
                                                        (id == -1)
                                                            ? "0"
                                                            : value.cart[id]
                                                                .quantity
                                                                .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          fontSize: 11,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  SizedBox(
                                                    width: 0,
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      Provider.of<CartProvider>(
                                                              context,
                                                              listen: false)
                                                          .addRemove(menu.name,
                                                              menu.id, true);
                                                    },
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: Text("Tidak Ada Data !"),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void openDialog() {
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: Column(
              children: [
                Text(
                  "Identitas",
                  style: GoogleFonts.montserrat(),
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
                          hintText: "Perkawinan",
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
                            "NIK : " +
                            NIKController.text +
                            "TTL : " +
                            TTLController.text +
                            "Alamat : " +
                            AlamatController.text +
                            "Provinsi : " +
                            ProvinsiController.text +
                            "Kabupaten : " +
                            KabupatenController.text +
                            "Kelurahan : " +
                            KelurahanController.text +
                            "RT / RW : " +
                            RTRWController.text +
                            "Jenis Kelamin : " +
                            GenderController.text +
                            "Status Perkawinan : " +
                            PerkawinanController.text +
                            "Pekerjaan : " +
                            PekerjaanController.text +
                            "Pesanan : " +
                            "\n" +
                            strPesanan;

                        FlutterOpenWhatsapp.sendSingleMessage(
                            "6283847978702", pesanan);
                        // print(pesanan);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 50),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                (new Color(0xff58A5C6)),
                                new Color(0xff217DA5)
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight),
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
        });
  }
}
