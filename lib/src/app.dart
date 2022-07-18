import 'package:flutter/material.dart';
import 'package:products/models/api-model.dart';
import 'package:products/fetch_data/fetch_api.dart';
import 'package:products/src/cat_details.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<MyApp> {
  late Future<List<CatsModel>> catList;
  @override
  void initState() {
    super.initState();
    FetchApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(fontFamily: 'Roboto'),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => MyApp(),
      //   '/CatDetails': (context) => CatDetails(),
      // },
      home: Scaffold(
        body: FutureBuilder(
            future: FetchApi().fetchData(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                List<CatsModel> catList = snapshot.data as List<CatsModel>;
                return ListView.builder(
                    itemCount: catList.length,
                    itemBuilder: (context, index) {
                      
                      return CatsData(catList[index]);
                    });
              } else if (snapshot.hasError) {
                return Container(
                  child: Center(
                    child: Text('has Error'),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            })),
      ),
    );
  }
}

class CatsData extends StatelessWidget {
  var cat;
  CatsData(this.cat);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CatDetails(cat)))}, 
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Card(
            child: Row(
              children: [
                Container(
                  width: 100,
                  child: Image.network(cat.picture),
                ),
                SizedBox(
                  width: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cat.id,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      cat.title,
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 22,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
