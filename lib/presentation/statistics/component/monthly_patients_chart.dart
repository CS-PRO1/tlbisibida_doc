import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tlbisibida_doc/constants/constants.dart';

class MonthlyDataPoint {
  final String month;
  final double patients;

  MonthlyDataPoint({required this.month, required this.patients});
}

class MonthlyPatientsChart extends StatefulWidget {
  const MonthlyPatientsChart({
    super.key,
    required this.data,
    Color? gradientColor1,
    Color? gradientColor2,
    Color? gradientColor3,
    Color? gradientColor4,
    Color? indicatorStrokeColor,
  })  : gradientColor1 = gradientColor1 ?? cyan200,
        gradientColor2 = gradientColor2 ?? cyan300,
        gradientColor3 = gradientColor3 ?? cyan400,
        gradientColor4 = gradientColor4 ?? cyan500,
        indicatorStrokeColor = indicatorStrokeColor ?? cyan400;

  final List<MonthlyDataPoint> data;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color gradientColor3;
  final Color gradientColor4;
  final Color indicatorStrokeColor;

  @override
  State<MonthlyPatientsChart> createState() => _MonthlyPatientsChartState();
}

class _MonthlyPatientsChartState extends State<MonthlyPatientsChart> {
  List<int> showingTooltipOnSpots = [];

  List<FlSpot> _spots = [];
  List<String> _monthLabels = [];

  @override
  void initState() {
    super.initState();
    _processData(widget.data);
    showingTooltipOnSpots = [0, 2, 4]; // Set default tooltips
  }

  @override
  void didUpdateWidget(covariant MonthlyPatientsChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _processData(widget.data);
      showingTooltipOnSpots = [];
    }
  }

  void _processData(List<MonthlyDataPoint> data) {
    _spots = [];
    _monthLabels = [];
    for (int i = 0; i < data.length; i++) {
      _spots.add(FlSpot(i.toDouble(), data[i].patients));
      _monthLabels.add(data[i].month);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final int index = value.toInt();
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      color: cyan300,
      fontSize: 16 * chartWidth / 500,
    );
    String text = '';
    if (index >= 0 && index < _monthLabels.length) {
      text = _monthLabels[index];
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: _spots,
        isCurved: true,
        barWidth: 4,
        shadow: const Shadow(
          blurRadius: 8,
        ),
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(
            colors: [
              widget.gradientColor1,
              widget.gradientColor2,
              widget.gradientColor3,
              widget.gradientColor4,
            ],
          ),
        ),
        dotData: const FlDotData(show: true),
        gradient: LinearGradient(
          colors: [
            widget.gradientColor1,
            widget.gradientColor2,
            widget.gradientColor3,
            widget.gradientColor4,
          ],
          stops: const [0.1, 0.4, 0.7, 0.9],
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 1,
        ),
        child: LayoutBuilder(builder: (context, constraints) {
          return LineChart(
            LineChartData(
              showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                return ShowingTooltipIndicators([
                  LineBarSpot(
                    tooltipsOnBar,
                    lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index],
                  ),
                ]);
              }).toList(),
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return;
                  }
                  if (event is FlTapUpEvent) {
                    final spotIndex = response.lineBarSpots!.first.spotIndex;
                    setState(() {
                      if (showingTooltipOnSpots.contains(spotIndex)) {
                        showingTooltipOnSpots.remove(spotIndex);
                      } else {
                        showingTooltipOnSpots.add(spotIndex);
                      }
                    });
                  }
                },
                mouseCursorResolver:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return SystemMouseCursors.basic;
                  }
                  return SystemMouseCursors.click;
                },
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      const FlLine(
                        color: cyan50op,
                      ),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 5,
                          color: lerpGradient(
                            barData.gradient!.colors,
                            barData.gradient!.stops!,
                            percent / 100,
                          ),
                          strokeWidth: 2,
                          strokeColor: widget.indicatorStrokeColor,
                        ),
                      ),
                    );
                  }).toList();
                },
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) => cyan500,
                  tooltipRoundedRadius: 20,
                  tooltipBorder: const BorderSide(
                    color: cyan50op,
                    width: 6,
                  ),
                  getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                    return lineBarsSpot.map((lineBarSpot) {
                      return LineTooltipItem(
                        lineBarSpot.y.toInt().toString(),
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList();
                  },
                ),
              ),
              lineBarsData: lineBarsData,
              minY: 0,
              maxY: maxval(_spots),
              baselineY: 0,
              backgroundColor: const Color.fromARGB(62, 211, 241, 238),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'عدد المرضى',
                    style: TextStyle(
                        color: cyan500,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  axisNameSize: 24,
                  sideTitles: SideTitles(
                    showTitles: false,
                    reservedSize: 0,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return bottomTitleWidgets(
                        value,
                        meta,
                        constraints.maxWidth,
                      );
                    },
                    reservedSize: 30,
                  ),
                ),
                // rightTitles: const AxisTitles(
                //   sideTitles: SideTitles(
                //     showTitles: false,
                //   ),
                // ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: cyan100,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

Color lerpGradient(List<Color> colors, List<double> stops, double t) {
  if (colors.isEmpty) {
    throw ArgumentError('"colors" is empty.');
  } else if (colors.length == 1) {
    return colors[0];
  }

  if (stops.length != colors.length) {
    stops = [];
    colors.asMap().forEach((index, color) {
      final percent = 1.0 / (colors.length - 1);
      stops.add(percent * index);
    });
  }

  for (var s = 0; s < stops.length - 1; s++) {
    final leftStop = stops[s];
    final rightStop = stops[s + 1];
    final leftColor = colors[s];
    final rightColor = colors[s + 1];
    if (t <= leftStop) {
      return leftColor;
    } else if (t < rightStop) {
      final sectionT = (t - leftStop) / (rightStop - leftStop);
      return Color.lerp(leftColor, rightColor, sectionT)!;
    }
  }
  return colors.last;
}

maxval(List<FlSpot> data) {
  double max = 0;
  for (var element in data) {
    element.y > max ? max = element.y : max = max;
  }

  for (var i = 0; i < 100; i++) {
    if (max % 100 != 0) {
      max--;
    }
  }
  print(max);
  (max / 100) % 2 == 0 ? max += 200 : max += 100;
  print(max);
  return max;
}
