import 'package:atsign_ecare/config/color_constants.dart';
import 'package:atsign_ecare/utils/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AiAnalysisResultScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const AiAnalysisResultScreen({Key key, @required this.data})
      : super(key: key);
  @override
  _AiAnalysisResultScreenState createState() => _AiAnalysisResultScreenState();
}

class _AiAnalysisResultScreenState extends State<AiAnalysisResultScreen> {
  List<Map<String, dynamic>> rawData = [];
  @override
  void initState() {
    super.initState();
    widget.data.forEach((key, value) {
      rawData.add({
        "name": key,
        "value": double.parse(value) * 100,
      });
    });
  }

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    void _showError(String error) async {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error),
      ));
    }

    return Scaffold(
      backgroundColor: ColorConstants.secondaryDarkAppColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Scan Results",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: WillPopScope(
          onWillPop: () async => false,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 30.toHeight),
                SizedBox(
                  height: 500.toHeight,
                  child: PieChart(
                    PieChartData(
                        pieTouchData:
                            PieTouchData(touchCallback: (pieTouchResponse) {
                          setState(() {
                            final desiredTouch = pieTouchResponse.touchInput
                                    is! PointerExitEvent &&
                                pieTouchResponse.touchInput is! PointerUpEvent;
                            if (desiredTouch &&
                                pieTouchResponse.touchedSection != null) {
                              touchedIndex = pieTouchResponse
                                  .touchedSection.touchedSectionIndex;
                            } else {
                              touchedIndex = -1;
                            }
                          });
                        }),
                        borderData: FlBorderData(
                          show: false,
                        ),
                        sectionsSpace: 0,
                        centerSpaceRadius: 40,
                        sections: showingSections()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15,
                  ),
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    columnWidths: {1: FractionColumnWidth(0.8)},
                    children: [
                      for (int i = 0; i <= 11; i++)
                        getTableRow(
                          color: colors[i],
                          text:
                              "${rawData[i]["name"]} - ${rawData[i]["value"].toStringAsFixed(1)}%",
                          isSquare: false,
                          size: touchedIndex == i ? 18 : 16,
                          textColor:
                              touchedIndex == i ? Colors.black : Colors.grey,
                        )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 4,
                // ),
                const SizedBox(
                  width: 28,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(12, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 12.0;
      final radius = isTouched ? 130.0 : 120.0;

      return PieChartSectionData(
        color: colors[i],
        value: rawData[i]["value"],
        title: '${rawData[i]["value"].toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
      );
    });
  }
}

TableRow getTableRow({
  Color color,
  String text,
  bool isSquare,
  double size,
  Color textColor,
}) {
  return TableRow(children: [
    Center(
      child: Container(
        margin: EdgeInsets.all(10),
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
          color: color,
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
      ),
    ),
  ]);
}

List<Color> colors = [
  Color(0xff729812),
  Color(0xffCB2CFC),
  Color(0xff42C420),
  Color(0xffC89C75),
  Color(0xffCE044A),
  Color(0xff4C61F4),
  Color(0xffB05718),
  Color(0xffF6CA1C),
  Color(0xffE67057),
  Color(0xff634249),
  Color(0xff02F3FF),
  Color(0xffDE5B00),
];
