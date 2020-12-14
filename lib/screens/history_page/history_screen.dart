import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:see_gpa_generator/database/history_dao.dart';
import 'package:see_gpa_generator/models/history_model.dart';
import 'package:see_gpa_generator/screens/history_page/expanded_box.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/app_drawer.dart';

class HistoryScreen extends StatefulWidget {
  static const String route = 'history';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final HistoryDao _historyDao = HistoryDao();

  List<HistoryModel> _history = [];

  @override
  void initState() {
    _loadHistory();
    super.initState();
  }

  _loadHistory() async {
    await _historyDao.getAllData().then((history) {
      setState(() {
        _history = history;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
      body: _history.isEmpty
          ? Center(child: Text('No history yet'))
          : ListView.builder(
              itemCount: _history.length,
              itemBuilder: (context, index) {
                final history = _history[index];

                return Column(
                  children: [
                    Card(
                      margin: history.isExpanded
                          ? EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0)
                          : kEdgeInset10,
                      color: kTileColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: history.isExpanded
                            ? BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0),
                              )
                            : BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          '${history.name}',
                          style: kHistoryTitleStyle,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Grade: ${history.result.grade}'),
                                kWidthBox10,
                                Text(
                                    'Gradepoint: ${history.result.gradePoint.toStringAsFixed(2)}'),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              DateFormat('yyyy / MM / dd ')
                                  .add_jm()
                                  .format(history.dateTime),
                              style: kDateTimeStyle,
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              history.isExpanded = !history.isExpanded;
                            });
                          },
                          icon: Icon(history.isExpanded
                              ? Icons.expand_less
                              : Icons.expand_more),
                        ),
                      ),
                    ),
                    if (history.isExpanded) ExpandedBox(history: history)
                  ],
                );
              },
            ),
    );
  }
}
