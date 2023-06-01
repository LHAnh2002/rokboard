import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:rokboard/Page/chart/troops/widget/troop_widget.dart';

class TroopsPage extends StatefulWidget {
  final email, id, name;
  const TroopsPage({Key? key, this.email, this.id, this.name})
      : super(key: key);
  @override
  _TroopsPageState createState() => _TroopsPageState();
}

class _TroopsPageState extends State<TroopsPage> {
  late List<charts.Series<DataPoint, String>> _seriesList;

  @override
  void initState() {
    super.initState();
    _seriesList = <charts.Series<DataPoint, String>>[];
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
        data.add(DataPoint(doc['date'], doc['deads']));
      });
      List<DataPoint> data1 = [];
      snapshot.docs.forEach((doc) {
        data1.add(DataPoint(doc['date'], doc['killT4']));
      });
      List<DataPoint> data2 = [];
      snapshot.docs.forEach((doc) {
        data2.add(DataPoint(doc['date'], doc['killT5']));
      });

      // Update the chart data
      setState(() {
        _seriesList = [
          charts.Series<DataPoint, String>(
            id: 'Kill T4',
            fillColorFn: (DataPoint data, _) =>
                charts.MaterialPalette.pink.shadeDefault,
            colorFn: (DataPoint data, _) =>
                charts.MaterialPalette.pink.shadeDefault,
            domainFn: (DataPoint data, _) =>
                data.date.toDate().day.toString() +
                '/' +
                data.date.toDate().month.toString(),
            measureFn: (DataPoint data, _) => data.sales,
            labelAccessorFn: (DataPoint data, _) => data.sales.toString(),
            data: data1,
          ),
          charts.Series<DataPoint, String>(
            id: 'Kill T5',
            fillColorFn: (DataPoint data, _) =>
                charts.MaterialPalette.blue.shadeDefault,
            colorFn: (DataPoint data, _) =>
                charts.MaterialPalette.blue.shadeDefault,
            domainFn: (DataPoint data, _) =>
                data.date.toDate().day.toString() +
                '/' +
                data.date.toDate().month.toString(),
            measureFn: (DataPoint data, _) => data.sales,
            labelAccessorFn: (DataPoint data, _) => data.sales.toString(),
            data: data2,
          ),
          charts.Series<DataPoint, String>(
            id: 'Death',
            fillColorFn: (DataPoint model, _) =>
                charts.MaterialPalette.red.shadeDefault,
            domainFn: (DataPoint data, _) =>
                data.date.toDate().day.toString() +
                '/' +
                data.date.toDate().month.toString(),
            colorFn: (DataPoint model, _) =>
                charts.MaterialPalette.red.shadeDefault,
            measureFn: (DataPoint data, _) => data.sales,
            labelAccessorFn: (DataPoint data, _) => data.sales.toString(),
            data: data,
          ),
        ];
      });
    });
  }

  void _onSelectionChanged(charts.SelectionModel model) {
    final selectedDatum = model.selectedDatum;
    // do something with selectedDatum
  }

  final formatter = new NumberFormat("#,###.#");
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
          : ListView(
              children: [
                Container(
                  height: 900.h,
                  child: Padding(
                      padding: EdgeInsets.all(8),
                      child: charts.BarChart(
                        _seriesList,
                        animate: false,
                        vertical: false,
                        primaryMeasureAxis: new charts.NumericAxisSpec(
                          tickProviderSpec:
                              new charts.BasicNumericTickProviderSpec(
                            desiredTickCount: 5,
                          ),
                        ),
                        barGroupingType: charts.BarGroupingType.grouped,
                        behaviors: [
                          new charts.SeriesLegend(
                            position: charts.BehaviorPosition.top,
                            horizontalFirst: false,
                            cellPadding:
                                new EdgeInsets.only(right: 4.0, bottom: 4.0),
                            showMeasures: true,
                          ),
                        ],
                        selectionModels: [
                          charts.SelectionModelConfig(
                            type: charts.SelectionModelType.info,
                            changedListener: (charts.SelectionModel model) {
                              if (model.hasDatumSelection) {
                                new charts.BarLabelDecorator<String>();
                                // print(label);
                              }
                            },
                          )
                        ],
                        domainAxis: new charts.OrdinalAxisSpec(),
                      )),
                ),
              ],
            ),
    );
  }
}

class DataPoint {
  final Timestamp date;
  final int sales;

  DataPoint(this.date, this.sales);
}
