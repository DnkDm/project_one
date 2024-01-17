import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Поддержка"),),
      body: Padding(
        padding: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height * 0.11)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Поддержка проекта обратная связь"),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blue
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Есть идеи?", style: TextStyle(fontSize: 24),),
                    SizedBox(width: 10,),
                    Icon(Icons.lightbulb, size: 32, color: Colors.yellow,)
                  ],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
