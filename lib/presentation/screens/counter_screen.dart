import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  void onPressed() {
    print('Button clicked');
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
          child: const Column(
        /// NOTE: const keyword added for the purpose of tell Flutter that this specific
        /// widget is a constant and it should not be rebuilt during runtime
        /// this includes the children widgets as well
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('10',
              style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
          Text('Clicks', style: TextStyle(fontSize: 25))
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
