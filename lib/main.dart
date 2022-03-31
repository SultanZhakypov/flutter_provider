import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderModel(),
      child: Builder(builder: (context) {
        return MaterialApp(
          theme: context.watch<ProviderModel>().defaultTheme,
          title: 'Material App',
          home: const ColorScreen(),
        );
      }),
    );
  }
}

class ColorScreen extends StatelessWidget {
  const ColorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProviderModel>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Switch(
            value: vm.isSelected,
            onChanged: (value) {
              print(value);
              vm.isSelected = value;
              vm.selected();
              vm.isSelected
                  ? vm.themes(vm.darkTheme)
                  : vm.themes(vm.lightTheme);
            },
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              NewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vmw = context.watch<ProviderModel>();

    return GridView(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: [
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.green : vmw.color1,
        ),
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.purple : vmw.color2,
        ),
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.tealAccent : vmw.color3,
        ),
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.yellow : vmw.color4,
        ),
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.grey : vmw.color5,
        ),
        Container(
          height: 50,
          width: 50,
          color: vmw.isSelected ? Colors.red : vmw.color6,
        ),
      ],
    );
  }
}

class ProviderModel extends ChangeNotifier {
  ThemeData lightTheme = ThemeData(brightness: Brightness.light);
  ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
  ThemeData defaultTheme = ThemeData();
  bool isSelected = false;

  Color color1 = Colors.black;
  Color color2 = Colors.amber;
  Color color3 = Colors.cyan;
  Color color4 = Colors.red;
  Color color5 = Colors.teal;
  Color color6 = Colors.yellow;

  void themes(ThemeData lighttheme) {
    defaultTheme = lighttheme;
    notifyListeners();
  }

  void selected() {
    isSelected != isSelected;
    notifyListeners();
  }
}
