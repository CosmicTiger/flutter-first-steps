import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  /// NOTE: Stateful Widget should be used accurately in order to keep optimization of things.
  /// NOTE: Only are good to use when we would like to mutate variables within runtime.

  /// NOTE: Constructor should be defined after the variables and always be declared as `const WidgetName({super.key})`
  const CounterScreen({super.key});

  /// NOTE: My previous StatelessWidget when I turn it to StatefulWidget, that definition became the State of this new
  /// StatefulWidget, so the build method should be defined within the State class.
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  /// NOTE: Definition of variables within the widget should be always first before constructor
  /// NOTE: Can't define a const constructor for a class with non-final fields.
  /// Try making all of the fields final, or removing the keyword 'const' from the constructor. So, the variable should always
  int clickCounter = 0;

  void onPressed() {
    // NOTE: This is the way to mutate the variable within the Stateful Widget. When it comes to differentiate a local scope against foreign scope
    // this.clickCounter += 1;
    // NOTE: This is the way to mutate the variable within the StatefulWidget. When it comes to only local scope
    // clickCounter += 1;

    // setState(() {});

    // NOTE: Cleaner approach on how to mutate the variable within the StatefulWidget using setState callback
    setState(() {
      clickCounter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// NOTE: The importance of CounterScreen possessing some children widgets as const
    /// is to tell Flutter that this specific widget is a constant and it should not be rebuilt
    /// during runtime, this helps Flutter to optimize the performance of the app.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
      ),

      /// NOTE: Scaffold doesn't need to be a const widget because in good theory
      /// it should be rebuilt during runtime due to the different breakpoints a device can have
      /// and the different screen orientations coming from the usage.
      body: Center(
          child: Column(
        /// NOTE: const keyword added for the purpose of tell Flutter that this specific
        /// widget is a constant and it should not be rebuilt during runtime
        /// this includes the children widgets as well
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
          Text('Click${clickCounter == 1 ? '' : 's'}',
              style: TextStyle(fontSize: 25))
        ],
      )),
      floatingActionButton: FloatingActionButton(

          /// NOTE: FloatingActionButton is not a const widget because it should be rebuilt
          /// during runtime due to the different breakpoints a device can have and have to adapt to
          /// Scaffold widget changes, nonetheless, its children widgets can be constant
          onPressed: onPressed,
          child: const Icon(Icons.plus_one)),
    );
  }
}
