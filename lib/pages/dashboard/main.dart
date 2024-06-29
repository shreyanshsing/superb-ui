import 'package:flutter/material.dart';
import 'package:video_streaming_ui/shared/Widgets/bottom_nav.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Dashboard'),
      ),
      bottomNavigationBar: BottomNav(
        currentIndex: 0,
      ),
    );
  }
}
