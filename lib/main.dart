import 'package:count_down_custom_painter/widgets/circular_countdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController circularProgressAnimationController;

  @override
  void initState() {
    circularProgressAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    circularProgressAnimationController.reverse(
        from: circularProgressAnimationController.value == 0
            ? 1
            : circularProgressAnimationController.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircularCountdownWidget(
          animationController: circularProgressAnimationController,
        ),
      ),
    );
  }
}
