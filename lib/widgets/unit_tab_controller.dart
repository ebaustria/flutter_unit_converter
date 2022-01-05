import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UnitTabController extends StatelessWidget {
  UnitTabController({
    Key? key,
    required this.tabs,
    required this.onTabChanged
  }) : super(key: key);

  final List<Widget> tabs;
  final Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            onTabChanged(tabController.index);
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
            children: tabs,
          ),
        );
      }),
    );
  }
}