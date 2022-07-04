import 'package:e2e_tests/screens/home/home_controller.dart';
import 'package:e2e_tests/widgets/card_counter_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = HomeController();
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: controller.title,
          builder: (context, String title, _) => Text(
            title,
            key: const Key('title'),
          ),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                key: const Key('titleInput'),
                initialValue: controller.title.value,
                onChanged: (value) => controller.title.value = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Título'),
                ),
              ),
            ),
            CardCounter(
              counter: controller.counter,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.counter.value++,
        label: const Text('Incrementar'),
        icon: const Icon(Icons.plus_one),
      ),
    );
  }
}
