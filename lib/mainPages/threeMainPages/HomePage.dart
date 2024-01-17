import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:project_one/routes/app_router.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController(initialScrollOffset: 200.0,
    keepScrollOffset: true,);
  bool menu = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              '/Users/dmitrijdeneko/AndroidStudioProjects/project_one/assets/background.jpeg'
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Знаки тела", style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                setState(() {});
                if (FirebaseAuth.instance.currentUser == null) {
                  AutoRouter.of(context).push(RegisterRoute());
                }
              },
              icon: Icon(Icons.logout)),
          actions: [
            IconButton(
                onPressed: () {
                  menu = !menu;
                  setState(() {});
                  scrollToSecondContainer();
                },
                icon: Icon(Icons.menu))
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height * 0.11)),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 200,
                  height: double.infinity,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushRoute(HeadRoute());
                        },
                        child: Container(
                          width: 150,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text("Глаза", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedContainer(
                  width: menu ? 300 : MediaQuery.of(context).size.width,
                  //color: Colors.red.withOpacity(0.2),
                  duration: Duration(milliseconds: 500),
                  child: ModelViewer(

                    interactionPrompt: InteractionPrompt.none,
                    backgroundColor: Colors.transparent,
                    src: 'assets/3d_model/fs.glb',
                    alt: 'A 3D model of an astronaut',
                    ar: true,
                    autoRotate: true,
                    iosSrc: 'assets/hu/fs.glb',
                    disableZoom: false,
                    cameraOrbit: "0deg 75deg 100%",
                    maxCameraOrbit: "Infinity 157.5deg 100%",

                  ),
                ),
                Container(
                  width: 150,
                  height: double.infinity,
                  //color: Colors.blue,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Listener(
                          onPointerDown: (PointerDownEvent event) {
                            // Обработка события касания (down)
                          },
                          onPointerUp: (PointerUpEvent event) {
                            // Обработка события отпускания касания (up)
                            scrollToSecondContainerItem();
                          },
                          child: Container(
                            width: 90,
                            height: 90,
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
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 90,
                          height: 90,
                          child: ModelViewer(
                            interactionPrompt: InteractionPrompt.none,
                            backgroundColor: Colors.transparent,
                            src: 'assets/3d_model/fs.glb',
                            alt: 'A 3D model of an astronaut',
                            ar: true,
                            autoRotate: false,
                            iosSrc: 'assets/hu/fs.glb',
                            disableZoom: false,
                            autoPlay: false,
                            cameraOrbit: "0deg 75deg 15%",
                            maxCameraOrbit: "Infinity 80deg 20%",
                            minCameraOrbit: "Infinity 70deg 10%",
                            cameraTarget: "0m 8m 0m",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 90,
                          height: 90,
                          child: ModelViewer(
                            interactionPrompt: InteractionPrompt.none,
                            backgroundColor: Colors.transparent,
                            src: 'assets/3d_model/fs.glb',
                            alt: 'A 3D model of an astronaut',
                            ar: true,
                            autoRotate: false,
                            iosSrc: 'assets/hu/fs.glb',
                            disableZoom: false,
                            autoPlay: false,
                            cameraOrbit: "100deg 75deg 18%",
                            maxCameraOrbit: "80deg 80deg 20%",
                            minCameraOrbit: "120deb 70deg 10%",
                            cameraTarget: "0m -3m 0m",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 90,
                          height: 90,
                          child: ModelViewer(
                            interactionPrompt: InteractionPrompt.none,
                            backgroundColor: Colors.transparent,
                            src: 'assets/3d_model/fs.glb',
                            alt: 'A 3D model of an astronaut',
                            ar: true,
                            autoRotate: false,
                            iosSrc: 'assets/hu/fs.glb',
                            disableZoom: false,
                            autoPlay: false,
                            cameraOrbit: "0deg 75deg 15%",
                            maxCameraOrbit: "Infinity 80deg 20%",
                            minCameraOrbit: "Infinity 70deg 10%",
                            cameraTarget: "0m 8m 0m",
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scrollToSecondContainer() {
    _scrollController.animateTo(
      menu
          ? ((150 - (MediaQuery.of(context).size.width - 300)) + 200)
          : 200, // Прокрутите до второго контейнера
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  void scrollToSecondContainerItem() {
    _scrollController.animateTo(
      0, // Прокрутите до второго контейнера
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
