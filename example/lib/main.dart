import 'package:flutter/material.dart';

// ignore: unused_import
import 'package:z/z.dart' as z;

void main() => runApp(const ExampleFrame());

/// [MaterialApp] frame.
class ExampleFrame extends StatelessWidget {
  /// [MaterialApp] frame.
  const ExampleFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Example(),
      );
}

/// One entire page for a [PageView]. Comprised of a [SingleChildScrollView]
/// and a [Column].
Widget buildView({
  required double w,
  required double h,
  String title = '',
  String subtitle = '',
  Widget child = const SizedBox(),
}) =>
    z.Curtains.elevated(
      elevation: 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Text(
              title,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 25),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 50),
            child,
          ],
        ),
      ),
    );

/// Construct a [new Example] `Widget` to fill an [ExampleFrame].
class Example extends StatelessWidget {
  /// Fill an [ExampleFrame] with a [Scaffold] and [AppBar] whose body is a
  /// [PageView]. The `children` of this swiping page view are each built by
  /// [buildView].
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final w = s.width;
    final h = s.height;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('z')),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          buildView(
            w: w,
            h: h,
            title: '',
            subtitle: '',
            child: const z.Surface(
              width: 375,
              height: 250,
            ),
          ),
          buildView(
            w: w,
            h: h,
            title: '',
            subtitle: '',
            child: z.Foil(
                child: Container(
              color: Colors.black,
              width: 250,
              height: 100,
            )),
          ),
        ],
      ),
    );
  }
}
