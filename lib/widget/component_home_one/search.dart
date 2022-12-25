import 'package:flutter/material.dart';
import 'package:kostin/constants/colors.dart';

class Searchs extends StatelessWidget {
  const Searchs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Stack(
        children: [
          TextField(
            cursorColor: kPrimary,
            decoration: InputDecoration(
              fillColor: const Color(0xfff6f8ff),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 20,
              ),
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: kPrimary,
                size: 30,
              ),
              hintText: "cari kost terdekat",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey.withOpacity(0.7),
              ),
            ),
          ),

          //INI SINTAKS MIC//
          Positioned(
            bottom: 6,
            right: 12,
            child: IconButton(
              onPressed: (() {}),
              icon: const Icon(
                Icons.mic_outlined,
                color: kPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
