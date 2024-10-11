import 'package:finance_manager/graphic/graphic_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraphicCard extends StatelessWidget {
  const GraphicCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();

    return Column(
      children: [
        const SizedBox(height: 13),
        Container(
          margin: const EdgeInsets.all(17),
          child: AspectRatio(
            aspectRatio: 10 / 6,
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return data.bottomTitle[value.toInt()] != null
                            ? SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                    data.bottomTitle[value.toInt()].toString(),
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.grey[400])),
                              )
                            : const SizedBox();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    color: Colors.yellow,
                    barWidth: 1.5,
                    belowBarData: BarAreaData(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.yellow.withOpacity(0.3),
                          Colors.transparent
                        ],
                      ),
                      show: true,
                    ),
                    dotData: const FlDotData(show: false),
                    spots: data.spots,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
