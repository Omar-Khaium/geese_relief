import 'package:flutter/material.dart';

class SearchResultFragment extends StatefulWidget {
  @override
  _SearchResultFragmentState createState() => _SearchResultFragmentState();
}

class _SearchResultFragmentState extends State<SearchResultFragment> {

  bool _isSearching = true;
  List<String> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
    );
  }
}
