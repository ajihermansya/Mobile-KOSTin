import 'package:flutter/material.dart';
import 'package:kostin/constants/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          TextField(
            cursorColor: kPrimary,
            decoration: InputDecoration(
              fillColor: Colors.white,
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
              hintText: "Seacrh here ...",
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
