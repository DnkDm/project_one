import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/search.jpeg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            title: Text("Ангельские знаки", style: TextStyle(color: Colors.white),),
            backgroundColor: Colors.transparent,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                bottom: (MediaQuery.of(context).size.height * 0.11)),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  //color: Colors.red.withOpacity(0.2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 230,
                        child: ListWheelScrollView(
                          physics: FixedExtentScrollPhysics(),
                          squeeze: 0.93,
                          perspective: 0.007,
                          itemExtent: 100,
                          onSelectedItemChanged: (index) => setState(() {
                            if (index == 2){
                              flag = false;
                            } else {
                              flag = true;
                            }
                          }),
                          children: [Conts(0), Conts(1), Conts(2)],

                        ),
                      ),
                      Container(
                        width: 90,
                        height: 230,
                        child: ListWheelScrollView(
                          physics: FixedExtentScrollPhysics(),
                          squeeze: 0.93,
                          perspective: 0.007,
                          itemExtent: 100,
                          children: flag ? [Conts(0), Conts(1), Conts(2), Conts(3), Conts(4), Conts(5), Conts(6), Conts(7), Conts(8), Conts(9)] : [Conts(0), Conts(1), Conts(2), Conts(3), Conts(4)],
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Icon(Icons.circle, size: 12, color: Colors.black.withOpacity(0.7),), Icon(Icons.circle, size: 12, color: Colors.black.withOpacity(0.7),)],
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 230,
                        child: ListWheelScrollView(
                          physics: FixedExtentScrollPhysics(),
                          squeeze: 0.93,
                          perspective: 0.007,
                          itemExtent: 100,
                          children: [Conts(0), Conts(1), Conts(2), Conts(3), Conts(4), Conts(5)],
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 230,
                        child: ListWheelScrollView(
                          physics: FixedExtentScrollPhysics(),
                          squeeze: 0.93,
                          perspective: 0.007,
                          itemExtent: 100,
                          children: [Conts(0), Conts(1), Conts(2), Conts(3), Conts(4), Conts(5), Conts(6), Conts(7), Conts(8), Conts(9)],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    //color: Colors.blue.withOpacity(0.2),
                    child: Center(
                      child: Text("Text"),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  bool flag = true;

  Widget Conts(int a){
    return Container(
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(0.2),
      ),

      child: Center(child: Text(a.toString(), style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),),
    );
  }
}
