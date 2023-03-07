import 'package:blog_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: width * 0.9,
        child: TextFormField(
          decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Icon(Icons.search, color: lightColor),
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.only(top: 10, left: 5),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                borderSide: BorderSide.none,
              ),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black38,
                    width: 1,
                  )),
              hintText: "Search",
              hintStyle: const TextStyle(
                  color: lightColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 17)),
        ),
      ),
    );
  }
}
