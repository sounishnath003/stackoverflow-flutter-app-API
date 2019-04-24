import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_over_flow/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return new HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.dispatch(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeEvent, HomeState>(
        bloc: widget._homeBloc,
        builder: (
          BuildContext context,
          HomeState currentState,
        ) {
          if (currentState is UnHomeState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorHomeState) {
            return new Container(
              child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error' ),
            ));
          }
          return new Material(
            child: new Column(
              children: <Widget>[
                new Stack(
                  children: <Widget>[
                    new Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width:  MediaQuery.of(context).size.width,
                      decoration: new BoxDecoration(
                        gradient: LinearGradient(
                          colors:  [
                            Color(0xffd399c1),
                            Color(0xff9b5acf),
                            Color(0xff611cdf)
                          ]
                        ),
                        borderRadius: new BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                        )
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("All Questions",
                  style: new TextStyle(
                    color: Colors.black
                  ),
                  ),
                ),
                new Expanded(
                  child: new Container(),
                )
              ],
            ),
          ) ;
        });
  }
}
