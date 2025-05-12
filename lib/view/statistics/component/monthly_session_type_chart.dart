import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
// Assuming constants.dart contains your color definitions
import 'package:tlbisibida_doc/constants/constants.dart';

// Data model for a single monthly data point
class MonthlyDataPoint {
  final String month;
  final double patients;

  MonthlyDataPoint({required this.month, required this.patients});

  // Added equality check for didUpdateWidget
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MonthlyDataPoint &&
          runtimeType == other.runtimeType &&
          month == other.month &&
          patients == other.patients;

  @override
  int get hashCode => month.hashCode ^ patients.hashCode;
}

// Widget to display the monthly patients chart
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
    // Initialize tooltips on the first, middle, and last spots if data exists
    if (_spots.isNotEmpty) {
      showingTooltipOnSpots = [0];
      if (_spots.length > 1) {
        showingTooltipOnSpots.add((_spots.length / 2).floor());
        if (_spots.length > 2) {
          showingTooltipOnSpots.add(_spots.length - 1);
        }
      }
    } else {
      showingTooltipOnSpots = []; // No data, no tooltips
    }
  }

  @override
  void didUpdateWidget(covariant MonthlyPatientsChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if the data itself has changed
    if (oldWidget.data != widget.data) {
      _processData(widget.data);
      // Reset tooltips when data changes
      showingTooltipOnSpots = [];
      if (_spots.isNotEmpty) {
        showingTooltipOnSpots = [0];
        if (_spots.length > 1) {
          showingTooltipOnSpots.add((_spots.length / 2).floor());
          if (_spots.length > 2) {
            showingTooltipOnSpots.add(_spots.length - 1);
          }
        }
      }
    }
  }

  // Processes the input data to create FlSpot and month labels
  void _processData(List<MonthlyDataPoint> data) {
    _spots = [];
    _monthLabels = [];
    for (int i = 0; i < data.length; i++) {
      _spots.add(FlSpot(i.toDouble(), data[i].patients));
      _monthLabels.add(data[i].month);
    }
    // Request a new frame to ensure the chart updates after data processing
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  // Widget builder for the bottom titles (month labels)
  Widget bottomTitleWidgets(double value, TitleMeta meta, double chartWidth) {
    final int index = value.toInt();
    // Adjust font size based on chart width for responsiveness
    final style = TextStyle(
      fontWeight: FontWeight.bold,
      color: cyan300,
      fontSize: 16 * chartWidth / 500, // Scale font size
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
    // Define the line chart bar data using the processed spots
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

    // Determine which bar to show tooltips on (in this case, the only one)
    final tooltipsOnBar = lineBarsData[0];

    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 1,
        ),
        // Use LayoutBuilder to get the chart width for responsive titles
        child: LayoutBuilder(builder: (context, constraints) {
          return LineChart(
            LineChartData(
              // Configure showing tooltip indicators
              showingTooltipIndicators: showingTooltipOnSpots.map((index) {
                return ShowingTooltipIndicators([
                  LineBarSpot(
                    tooltipsOnBar,
                    lineBarsData.indexOf(tooltipsOnBar),
                    tooltipsOnBar.spots[index],
                  ),
                ]);
              }).toList(),
              // Configure line touch behavior
              lineTouchData: LineTouchData(
                enabled: true,
                handleBuiltInTouches: false,
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return;
                  }
                  // Toggle tooltip visibility on tap
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
                // Set mouse cursor on hover
                mouseCursorResolver:
                    (FlTouchEvent event, LineTouchResponse? response) {
                  if (response == null || response.lineBarSpots == null) {
                    return SystemMouseCursors.basic;
                  }
                  return SystemMouseCursors.click;
                },
                // Customize the indicator shown when a spot is touched
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                  return spotIndexes.map((index) {
                    return TouchedSpotIndicatorData(
                      const FlLine(
                        color: cyan50op, // Indicator line color
                      ),
                      FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) =>
                            FlDotCirclePainter(
                          radius: 5,
                          color: lerpGradient(
                            // Use lerpGradient for dot color
                            barData.gradient!.colors,
                            barData.gradient!.stops!,
                            percent / 100,
                          ),
                          strokeWidth: 2,
                          strokeColor: widget
                              .indicatorStrokeColor, // Indicator stroke color
                        ),
                      ),
                    );
                  }).toList();
                },
                // Configure the tooltip appearance and content
                touchTooltipData: LineTouchTooltipData(
                  getTooltipColor: (touchedSpot) =>
                      cyan500, // Tooltip background color
                  tooltipRoundedRadius: 20,
                  tooltipBorder: const BorderSide(
                    color: cyan50op, // Tooltip border color
                    width: 6,
                  ),
                  getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                    return lineBarsSpot.map((lineBarSpot) {
                      return LineTooltipItem(
                        lineBarSpot.y
                            .toInt()
                            .toString(), // Display patient count as integer
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
              // Use the calculated max value for maxY
              maxY: maxval(_spots),
              baselineY: 0,
              backgroundColor: const Color.fromARGB(
                  62, 211, 241, 238), // Chart background color
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  axisNameWidget: Text(
                    'عدد المرضى', // Left axis name
                    style: TextStyle(
                        color: cyan500,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  axisNameSize: 24,
                  sideTitles: SideTitles(
                    showTitles: false, // Hide left side titles
                    reservedSize: 0,
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true, // Show bottom titles (months)
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      // Use the bottomTitleWidgets function to get month labels
                      return bottomTitleWidgets(
                        value,
                        meta,
                        constraints
                            .maxWidth, // Pass chart width for responsiveness
                      );
                    },
                    reservedSize: 30,
                  ),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide right side titles
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false, // Hide top titles
                  ),
                ),
              ),
              gridData: const FlGridData(show: false), // Hide grid lines
              borderData: FlBorderData(
                show: true,
                border: Border.all(
                  color: cyan100, // Border color
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// Helper function to interpolate colors in a gradient
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

// Helper function to calculate a suitable maximum Y value for the chart
// Note: The logic here seems specific to your requirements for rounding and adding.
maxval(List<FlSpot> data) {
  double max = 0;
  for (var element in data) {
    if (element.y > max) {
      max = element.y;
    }
  }

  // Round down to the nearest hundred
  max = (max / 100).floor() * 100.0;

  // Add 100 or 200 based on the rounded value
  if ((max / 100) % 2 == 0) {
    max += 200;
  } else {
    max += 100;
  }

  // Ensure a minimum maxY if data is empty or all values are 0
  if (max < 100 && data.isNotEmpty) {
    max = 100;
  } else if (data.isEmpty) {
    max = 10; // Default max for empty data
  }

  return max;
}
