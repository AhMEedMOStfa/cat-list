import 'package:flutter/material.dart';
import 'package:products/models/api-model.dart';

class CatDetails extends StatelessWidget {
  late CatsModel cat;
  CatDetails(this.cat);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cat Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Column(
            children: [
              Container(
                child:Image.network(cat.picture),
                width: 200,
              ),
              Text(
                'ID: ${this.cat.id}' ,
                style: TextStyle(fontSize: 25),
              ),
              Text(
                this.cat.title,
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  this.cat.content,
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
