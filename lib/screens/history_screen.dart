import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:see_gpa_generator/bloc/history/history_bloc.dart';
import 'package:see_gpa_generator/shared/constant.dart';
import 'package:see_gpa_generator/widgets/app_drawer.dart';
import 'package:see_gpa_generator/widgets/history/expanded_box.dart';

class HistoryScreen extends StatefulWidget {
  static const String route = 'history';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          final newState = (state as OurHistoryState).history;
          return newState.isEmpty
              ? Center(child: Text('No history yet'))
              : ListView.builder(
                  itemCount: newState.take(10).length,
                  itemBuilder: (context, index) {
                    final history = newState[index];
                    return Column(
                      children: [
                        Card(
                          margin: EdgeInsets.all(10.0),
                          color: kTileColor,
                          child: ListTile(
                            title:
                                Text('Grade: ${history.result.result.grade}'),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Gradepoint: ${history.result.result.gradePoint.toStringAsFixed(2)}'),
                                Text(DateFormat('yyyy / MM / dd\n')
                                    .add_jm()
                                    .format(history.dateTime)),
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
                  });
        },
      ),
    );
  }
}
