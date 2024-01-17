import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

@RoutePage()
class HeadPage extends StatefulWidget {
  const HeadPage({super.key});

  @override
  State<HeadPage> createState() => _HeadPageState();
}

class _HeadPageState extends State<HeadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: ModelViewer(
                interactionPrompt: InteractionPrompt.none,
                backgroundColor: Colors.transparent,
                src: 'assets/3d_model/fs.glb',
                alt: 'A 3D model of an astronaut',
                ar: true,
                autoRotate: false,
                iosSrc: 'assets/hu/fs.glb',
                disableZoom: false,
                cameraOrbit: "0deg 75deg 10%",
                maxCameraOrbit: "Infinity 80deg 10%",
                minCameraOrbit: "Infinity 70deg 10%",
                cameraTarget: "0m 13m 0m",
                autoPlay: false,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                color: Colors.blue
              ),
              child: Center(
                child: Text("Какой то текст"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
