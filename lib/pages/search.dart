import 'package:eat_meat/components/date_picker.dart';
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
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Text(
              'Search Screen',
              style: TextStyle(fontSize: 40),
            ),
            DatePicker(),
          ],
        ),
      ),
    );
  }
}
