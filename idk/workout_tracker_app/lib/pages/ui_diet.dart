import 'package:flutter/material.dart';
import 'package:workout_tracker_app/navigation.dart';
import '../src/model.dart';
import '../src/api.dart';

class DietPage extends StatefulWidget {
  final User user;
  DietPage(this.user);
  @override
  _DietPageState createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  final Api _api = Api();
  Widget getDietView() {
    return FutureBuilder(
        future: _api.getDiet('5fe07621b271d358089313e5'),
        builder: (buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            throw snapshot.error;
          else if (!snapshot.hasData) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            String dday =
                "monday"; //var date = DateTime.now();print(DateFormat('EEEE').format(date));
            int dindex = 0;
            for (var i = 0; i < snapshot.data["dietdays"].length; i++) {
              if (snapshot.data["dietdays"][i]["day"] == dday) {
                print(snapshot.data["dietdays"][i]["day"]);
                dindex = i;
                break;
              }
            }
            var currentDietDay = snapshot.data["dietdays"][dindex];
            print(snapshot.data);
            // print(
            //     'Num exercises: ${snapshot.data["days"][dindex]["routine"].length}');
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentDietDay["day"],
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: currentDietDay["meals"].length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var currentMeal = currentDietDay["meals"][index];
                            print('FoodId: ${currentMeal.runtimeType}');
                            print('FoodId: $currentMeal');
                            return FutureBuilder(
                                future: _api.getFood(currentMeal),
                                builder:
                                    (buildContext, AsyncSnapshot snapshot) {
                                  if (snapshot.hasError) {
                                    throw snapshot.error;
                                  } else if (!snapshot.hasData) {
                                    return Container(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  } else {
                                    return Card(
                                      color: Colors.grey[300],
                                      elevation: 4,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            child: RichText(
                                              text: TextSpan(
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                        text:
                                                            "    ${snapshot.data["name"]}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold)),
                                                  ]),
                                            ),
                                            width: 100,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                child: RichText(
                                                  text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "    \n",
                                                        ),
                                                        TextSpan(
                                                          text: "    Fat\n",
                                                        ),
                                                        TextSpan(
                                                          text: "    Proteins\n",
                                                        ),
                                                        TextSpan(
                                                          text: "    Carbs\n",
                                                        ),
                                                        TextSpan(
                                                          text: "    Calories",
                                                        ),
                                                      ],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                                width: 100,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                child: RichText(
                                                  text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Amount (g)\n",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "    ${snapshot.data["fat"]}\n",
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "    ${snapshot.data["protein"]}\n",
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "    ${snapshot.data["carbs"]}\n",
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              "    ${snapshot.data["calories"]}",
                                                        ),
                                                      ],
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      )),
                                                ),
                                                width: 100,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                });
                          }))
                ]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    int index = 1;
    return SafeArea(
      child: Scaffold(
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Center(
                  child: Text('Choose Your Diet', style: TextStyle(
                    fontSize: 20
                  ),),
                ),
                decoration: BoxDecoration(

                  color: Colors.grey[350]
                ),
              ),
              ListTile(
                title: Text('Diet 1', style: TextStyle(
                  fontSize: 15
                ),),
                trailing: Icon(Icons.lunch_dining),
                onTap: (){

                },
              ),
              ListTile(
                title: Text('Diet 2', style: TextStyle(
                    fontSize: 15
                ),),
                trailing: Icon(Icons.lunch_dining),
                onTap: (){

                },
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF141414),
        appBar: AppBar(
          backgroundColor: Color(0xFF141414),
          title: Text("Diet"),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white.withAlpha(200),
          ),
          child: NavigationBar(index, widget.user),
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Opacity(
              opacity: 0.5,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
                margin: EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: getDietView()
                ),
              ),
            )),
      ),
    );
  }
}
