import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ChangeNotifierProvider(
          create: (_) => to_do_list_provider(), child: to_do_list(),)
    );
  }
}

class to_do_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => to_do_list_State();
}

class to_do_list_State extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Consumer(builder: (ctx, _, __) {
         return Provider.of<to_do_list_provider>(ctx).list().isNotEmpty ?

         Container(
           width: 200,
           child: ListView.builder(itemCount: Provider.of<to_do_list_provider>(ctx).list().length,
               itemBuilder: (ctx, index) {
                                  return Stack(children: [
                                    Provider.of<to_do_list_provider>(ctx , listen: true).showWork(index),

                                  ],
                 );

            }),
         ) : Text(
          'Empty',
          style: TextStyle(
              fontSize: 40, color: Colors.green
          ),);
      }),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () {
        Provider.of<to_do_list_provider>(context , listen: false).addWork();
      }),
    );
  }
}