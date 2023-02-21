import 'package:flutter/material.dart';

class MySliderPage extends StatefulWidget {
  const MySliderPage({super.key});

  @override
  State<MySliderPage> createState() => _MySliderPageState();
}

class _MySliderPageState extends State<MySliderPage> {
  double sliderValue = 0;
  ValueNotifier<double>? sliderValueNotifier;

  @override
  void initState() {
    super.initState();
    sliderValueNotifier = ValueNotifier(sliderValue);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Slider'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                  'This app demonstrates the use of Value Notifier. Drag the slider and see the text correspons to the slider\'s value.'),
              const Expanded(
                child: SizedBox(),
              ),
              ValueListenableBuilder(
                valueListenable: sliderValueNotifier!,
                builder: (context, value, child) => Slider(
                  value: double.parse(
                      sliderValueNotifier!.value.round().toString()),
                  max: 100,
                  divisions: 100,
                  label: sliderValueNotifier!.value.round().toStringAsFixed(0),
                  onChanged: (double value) {
                      sliderValueNotifier!.value = value;
                  },
                ),
              ),
              ValueListenableBuilder(
                valueListenable: sliderValueNotifier!,
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Slider Value is : '),
                    Text(
                      sliderValueNotifier!.value.toStringAsFixed(0),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
