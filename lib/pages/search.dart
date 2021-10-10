import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CupertinoSearchTextField(
                placeholder: 'Search for some food...',
                autofocus: true,
                padding: EdgeInsets.symmetric(vertical: 15),
                prefixInsets: EdgeInsets.all(15),
                suffixInsets: EdgeInsets.all(15),
              ),
              Scrollbar(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
