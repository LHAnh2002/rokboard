import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';

class PowPage extends StatefulWidget {
  final email, id, name;
  const PowPage({Key? key, this.email, this.id, this.name}) : super(key: key);
  @override
  _PowPageState createState() => _PowPageState();
}

class _PowPageState extends State<PowPage> {
  late List<charts.Series<DataPoint, DateTime>> _seriesList;

  @override
  void initState() {
    super.initState();
    _seriesList = <charts.Series<DataPoint, DateTime>>[];
    // Listen to data changes in Firestore
    FirebaseFirestore.instance
        .collection("user")
        .doc(widget.email)
        .collection("sever")
        .doc(widget.id)
        .collection("ngayquet")
        .orderBy("date")
        .get()
        .then((snapshot) {
      List<DataPoint> data = [];
      snapshot.docs.forEach((doc) {
        data.add(DataPoint(
          (doc['date'] as Timestamp).toDate(),
          doc['Pow'],
        ));
      });

      // Update the chart data
      setState(() {
        _seriesList = [
          charts.Series<DataPoint, DateTime>(
            id: 'Pow',
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
            domainFn: (DataPoint data, _) => data.date,
            measureFn: (DataPoint data, _) => (data.pow / 1000000),
            data: data,
            labelAccessorFn: (DataPoint data, _) => data.pow.toString(),
          ),
        ];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 244, 116, 116),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.name}',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                'Troop Chart',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              )
            ],
          )),
      body: _seriesList == null
          ? Center(child: CircularProgressIndicator())
          : PageView(
              children: [
                Container(
                  width: 1000.w,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: charts.TimeSeriesChart(
                      _seriesList,
                      animate: false,
                      behaviors: [
                        new charts.SeriesLegend(
                          position: charts.BehaviorPosition.top,
                          horizontalFirst: false,
                          cellPadding:
                              new EdgeInsets.only(right: 4.0, bottom: 4.0),
                          showMeasures: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class DataPoint {
  final DateTime date;
  final int pow;

  DataPoint(this.date, this.pow);
}
