import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final textController = TextEditingController();

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
              CupertinoSearchTextField(
                placeholder: 'Search for some food...',
                autofocus: true,
                controller: textController,
                padding: const EdgeInsets.symmetric(vertical: 15),
                prefixInsets: const EdgeInsets.all(15),
                suffixInsets: const EdgeInsets.all(15),
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
