import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counterapp/blocs/counter_bloc.dart';
import 'package:flutter_counterapp/events/counter_event.dart';

class CounterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = context.bloc<CounterBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context,state){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Two actions/event here",style: TextStyle(fontSize: 25),),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent
                  ),
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text("Increment(+)",style: TextStyle(fontSize: 16,color: Colors.black),),
                    onPressed: (){

                      counterBloc.add(CounterEvent.increment);
                    },
                  ),
                ),
                Text("Result: $state",style: TextStyle(fontSize: 40,color: Colors.blue),),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                  ),
                  margin: EdgeInsets.all(10),
                  child: FlatButton(
                    child: Text("Decrement(-)",style: TextStyle(fontSize: 16, color: Colors.black),),
                    onPressed: (){
                      counterBloc.add(CounterEvent.decrement);
                    },
                  ),
                )
              ],
            );
           },
        )
      ),
    );
  }
}
