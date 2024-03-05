import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( // Center the profile picture in the AppBar
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/Profile_Small.png'), // Make sure this image is in your assets directory
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Handle info action
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildDailyProgress(),
          _buildFavoriteActivities(),
          _buildRewardsAndClasses(),
          _buildHabitStreakSelector(),
          // _buildHabitTracking(), // The method to build the habit tracking can be added later
          // _buildHistoricalProgress(), // The method to build the historical progress can be added later
        ],
      ),
    );
  }

 Widget _buildDailyProgress() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      children: <Widget>[
        Text(
          "Today",
          style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24.0),
        ),        
        SizedBox(height: 12), // Adjust the space as needed
        CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 13.0,
          animation: true,
          percent: 0.75,
          center: Text(
            "75%",
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.blue,
        ),
        SizedBox(height: 15), // Reduced space to bring the elements closer
      ],
    ),
  );
}

Widget _buildFavoriteActivities() {
  // Implementing design as per the provided screenshot
  return Wrap(
    spacing: 20,
    runSpacing: 20, // Adjust runSpacing to manage the vertical spacing
    alignment: WrapAlignment.spaceEvenly,
    children: <Widget>[
      _buildActivityIcon(Icons.directions_bike, '4.15 miles'),
      _buildActivityIcon(Icons.stairs, '6 floors'),
      _buildActivityIcon(Icons.directions_walk, '8,153 steps'),
      _buildActivityIcon(Icons.local_fire_department, '416 cals'),
      // ... Add other favorite activities as needed
    ],
  );
}
}

Widget _buildActivityIcon(IconData icon, String value) {
  return Column(
    children: [
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.blue,
        child: Icon(icon, size: 30, color: Colors.white),
      ),
      const SizedBox(height: 8),
      Text(value),
    ],
  );
}

 Widget _buildRewardsAndClasses() {
  return Card(
    margin: EdgeInsets.all(16.0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Progress',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),          
          Text('Your Points: 23,920',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          SizedBox(height: 14),
          _buildRewardProgress('Progress 1', 0.7, Colors.green),
          _buildRewardProgress('Progress 2', 0.5, Colors.blue),
          _buildRewardProgress('Progress 3', 0.9, Colors.orange),
          // Add more rewards/classes as needed
        ],
      ),
    ),
  );
}

Widget _buildRewardProgress(String rewardName, double progress, Color color) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(rewardName, style: TextStyle(fontWeight: FontWeight.w500)),
        SizedBox(height: 4),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: color.withOpacity(0.3),
          valueColor: AlwaysStoppedAnimation<Color>(color),
          minHeight: 8,
        ),
      ],
    ),
  );
}

  Widget _buildHabitStreakSelector() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: 'This Week'),
            Tab(text: 'Current Goals'),
            Tab(text: 'Work Goals'),
          ],
        ),
         Container(
            height: 300.0, // Adjust the height as necessary
            child: TabBarView(
              children: <Widget>[
                _buildBarChart('Week'), // Bar chart for weekly streaks
                _buildBarChart('Month'), // Bar chart for monthly streaks
                _buildBarChart('Year'), // Bar chart for yearly streaks
              ],
            ),
          ),
        ],
      ),
    );
  }

 Widget _buildBarChart(String period) {
    List<BarChartGroupData> barGroups = _generateBarGroups(period); // Implement this function based on your data

    return BarChart(
      BarChartData(
        barGroups: barGroups,
        titlesData: FlTitlesData(show: true), // Setup your axis titles here
        borderData: FlBorderData(show: true), // Hide or show the chart border
        gridData: FlGridData(show: true), // Hide or show the gri
        groupsSpace: barGroups.length * 10, // Adjust the space between bars

      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups(String period) {
    // This method should generate your BarChartGroupData list based on the period
    // For demonstration, let's just create a single group of bars
    return List.generate(5, (index) {
      return BarChartGroupData(

        x: 10,
        showingTooltipIndicators: [0],
        barRods: [
          BarChartRodData(toY: (index + 1) * 3.0, color: Colors.blue),
          BarChartRodData(toY: (index + 1) * 5.0, color: Colors.red)
        ],
      );
    });
  }
