// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:data_table_2/data_table_2.dart';
import 'package:fe/model/acdemic.score.model.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

List<AcademicScoreModel> listAcademicScoreModel = [
  AcademicScoreModel(
      name: 'Lập trình cơ bản', namHoc: '2020-2021', kyHoc: '1', diem: 8.5),
  AcademicScoreModel(
      name: 'Lập trình hướng đối tượng',
      namHoc: '2020-2021',
      kyHoc: '1',
      diem: 4.5),
  AcademicScoreModel(
      name: 'Tiếng anh 1', namHoc: '2020-2021', kyHoc: '1', diem: 7.5),
  AcademicScoreModel(
      name: 'Toán rời rạc', namHoc: '2020-2021', kyHoc: '1', diem: 5.5),
  AcademicScoreModel(
      name: 'Phát luật đại cương', namHoc: '2020-2021', kyHoc: '1', diem: 1.5),
  AcademicScoreModel(
      name: 'Cấu truc dữ liệu và giải thuật',
      namHoc: '2020-2021',
      kyHoc: '1',
      diem: 3),
];

class AcademicScorePage extends StatefulWidget {
  const AcademicScorePage({super.key});

  @override
  State<AcademicScorePage> createState() => _AcademicScorePageState();
}

class _AcademicScorePageState extends State<AcademicScorePage> {
  var tabIndex = 0;

  List<Widget> listTab = [TongQuan(), Tabchitiet()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            ),
          ),
          title: const Center(
            child: Text(
              "Điểm Học Tập",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
          ),
          actions: const [SizedBox(width: 44)],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Color(0xFF5adce4), Color(0xFF014dae)]),
            ),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
            child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Builder(builder: (context) {
                  return Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          setState(() {
                            tabIndex = index;
                          });
                        },
                        controller: DefaultTabController.of(context),
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                        dividerHeight: 0,
                        indicatorColor: Color(0xFF014dae),
                        tabs: [
                          Tab(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Tổng quan')],
                          )),
                          Tab(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text('Chi tiết')],
                          )),
                        ],
                      ),
                      Expanded(
                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            const BoxDecoration(color: Color(0xFFe7f5ff)),
                        child: listTab[tabIndex],
                      ))
                    ],
                  );
                }))));
  }
}

class TongQuan extends StatefulWidget {
  const TongQuan({super.key});

  @override
  State<TongQuan> createState() => _TongQuanState();
}

class _TongQuanState extends State<TongQuan> {
  double diemTB = 0;
  double value1 = 0;
  double value2 = 0;
  double value3 = 0;
  double value4 = 0;

  void getData() {
    double totalScore = 0;
    for (var element in listAcademicScoreModel) {
      totalScore += element.diem;
      if (element.diem < 4) {
        value1 += 1;
      } else if (element.diem < 6) {
        value2 += 1;
      } else if (element.diem < 8) {
        value3 += 1;
      } else {
        value4 += 1;
      }
    }
    diemTB = totalScore / listAcademicScoreModel.length;
    dataMap = {
      "0-4": value1,
      "4-6": value2,
      "6-8": value2,
      "8-10": value4,
    };
  }

  Map<String, double> dataMap = {};
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text("Điểm trung bình hệ 10:  ${diemTB.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16)),
          Text(
              "Điểm trung bình hệ 4:    ${(diemTB / 10 * 4).toStringAsFixed(2)}",
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 45),
          PieChart(
            dataMap: dataMap,
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 40,
            chartRadius: MediaQuery.of(context).size.width / 3.2,
            colorList: colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              // legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: true,
              // showChartValuesOutside: true,
              decimalPlaces: 1,
            ),
          )
        ],
      ),
    );
  }
}

class Tabchitiet extends StatelessWidget {
  const Tabchitiet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          border: TableBorder.all(
              width: 2, color: const Color.fromARGB(255, 199, 199, 199)),
          columns: [
            DataColumn2(
              label: Text('Môn học'),
              size: ColumnSize.L,
            ),
            DataColumn2(
              label: Center(child: Text('Năm học')),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Center(child: Text('Kỳ học')),
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Center(child: Text('Điểm hệ 10')),
              // numeric: true,
              size: ColumnSize.S,
            ),
            DataColumn2(
              label: Center(child: Text('Điểm hệ 4')),
              // numeric: true,
              size: ColumnSize.S,
            ),
          ],
          rows: listAcademicScoreModel
              .map((element) => DataRow(cells: [
                    DataCell(Text(element.name)),
                    DataCell(Center(child: Text(element.namHoc))),
                    DataCell(Center(child: Text(element.kyHoc))),
                    DataCell(Center(child: Text("${element.diem}"))),
                    DataCell(Center(child: Text("${element.diem / 10 * 4}"))),
                  ]))
              .toList()),
    );
  }
}
