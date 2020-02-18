import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_grate_app/model/customer_model.dart';
import 'package:flutter_grate_app/sqflite/model/Login.dart';
import 'package:flutter_grate_app/widgets/customer_list_shimmer.dart';
import 'package:flutter_grate_app/widgets/list_row_item.dart';
import 'package:http/http.dart' as http;

import '../utils.dart';

class SearchResultFragment extends StatefulWidget {
  final String _searchText;
  final Login login;
  final ValueChanged<Customer> gotoDetails;

  SearchResultFragment(this._searchText, this.login, this.gotoDetails);

  @override
  _SearchResultFragmentState createState() => _SearchResultFragmentState();
}

class _SearchResultFragmentState extends State<SearchResultFragment> {
  bool _isSearching = true;
  List<Customer> _list;

  StreamController<List<Customer>> _controller =
      StreamController<List<Customer>>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isSearching
            ? "Searching"
            : "${_list.length} ${_list.length > 1 ? "results" : "result"} found", style: Theme.of(context).textTheme.title.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: _controller.stream,
        initialData: _list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                Customer customer = _list[index];
                return InkWell(
                  onTap: () {
                    widget.gotoDetails(_list[index]);
                    Navigator.of(context).pop();
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListRowItem(
                                  icon: Icons.person,
                                  text: customer.Name,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ListRowItem(
                                  icon: Icons.phone,
                                  text: customer.ContactNum,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ListRowItem(
                                  icon: Icons.email,
                                  text: customer.Email,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ListRowItem(
                                  icon: Icons.pin_drop,
                                  text: customer.Address,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ShimmerDashboardFragment(),
            );
          }
        },
      ),
    );
  }

  Future getData() async {
    try {
      Map<String, String> headers = {
        'Authorization': widget.login.accessToken,
        'searchkey': '${widget._searchText}'
      };

      var result = await http.post(BASE_URL + API_SEARCH, headers: headers);
      if (result.statusCode == 200) {
        var map = json.decode(result.body)['CustomerCustomModel'];
        _list = [];
        map.forEach((_item) {
          _list.add(Customer.fromMap(Map<String, dynamic>.from(_item)));
        });
        setState(() {
          _isSearching = false;
        });
        _controller.sink.add(_list);
      } else {
        setState(() {
          _isSearching = false;
        });
        showMessage(context, "Network error!", json.decode(result.body),
            Colors.redAccent, Icons.warning);
        _controller.sink.add([]);
      }
    } catch (error) {
      setState(() {
        _isSearching = false;
      });
      _controller.sink.add([]);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}
