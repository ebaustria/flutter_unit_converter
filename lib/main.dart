import 'package:flutter/material.dart';
import 'package:flutter_unit_converter/screens/length_screen.dart';
import 'package:flutter_unit_converter/screens/mass_screen.dart';
import 'package:flutter_unit_converter/screens/shoe_size_screen.dart';
import 'package:flutter_unit_converter/screens/temperature_screen.dart';
import 'package:flutter_unit_converter/screens/volume_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatefulWidget {
  UnitConverterApp({Key? key}) : super(key: key);

  final List<Widget> tabs = [
    TemperatureScreen(title: 'Temperature',),
    LengthScreen(title: 'Length & Distance'),
    MassScreen(title: 'Mass'),
    VolumeScreen(title: 'Volume'),
    ShoeSizeScreen(title: 'Shoe Size'),
  ];

  @override
  _UnitConverterAppState createState() => _UnitConverterAppState();
}

class _UnitConverterAppState extends State<UnitConverterApp> {
  int selectedIndex = 0;
  var colors = [
    Colors.deepOrange,
    Colors.purple,
    Colors.green,
    Colors.indigo,
    Colors.pink,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: colors[selectedIndex]),
      home: DefaultTabController(
        length: 5,
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              setState(() {
                selectedIndex = tabController.index;
              });
            }
          });
          return Scaffold(
            appBar: AppBar(
              title: Text('Unit Converter'),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(MdiIcons.thermometer)),
                  Tab(icon: Icon(MdiIcons.ruler)),
                  Tab(icon: Icon(MdiIcons.scale)),
                  Tab(icon: Icon(MdiIcons.cupWater)),
                  Tab(icon: Icon(MdiIcons.shoePrint)),
                ],
              ),
            ),
            body: TabBarView(
              children: widget.tabs,
            ),
          );
        }),
      ),
    );
  }
}
