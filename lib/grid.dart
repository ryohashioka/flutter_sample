import 'package:flutter/material.dart';

class GridSample extends StatelessWidget {
  const GridSample({Key? key}) : super(key: key);

  Widget _photoItem(String image) {
    var assetsImage = "assets/img/" + image + ".jpg";
    return Container(
      child: Image.asset(assetsImage, fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("pic0"),
      _photoItem("pic1"),
      _photoItem("pic2"),
      _photoItem("pic3"),
      _photoItem("pic4"),
      _photoItem("pic5"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('GridViewSample'),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          children: list
      )
    );
  }
  
}

class GridExtentSample extends StatelessWidget {
  const GridExtentSample({Key? key}) : super(key: key);

  Widget _photoItem(String image) {
    var assetsImage = "assets/img/" + image + ".jpg";
    return Container(
      child: Image.asset(assetsImage, fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = [
      _photoItem("pic0"),
      _photoItem("pic1"),
      _photoItem("pic2"),
      _photoItem("pic3"),
      _photoItem("pic4"),
      _photoItem("pic5"),
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text('GridViewSample'),
        ),
        body: GridView.extent(
            maxCrossAxisExtent: 150,
            padding: const EdgeInsets.all(4),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: list
        )
    );
  }

}

class GridBuilderSample extends StatelessWidget {
  const GridBuilderSample({Key? key}) : super(key: key);

  Widget _photoItem(String image) {
    var assetsImage = "assets/img/" + image + ".jpg";
    return Container(
      child: Image.asset(assetsImage, fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    var grid = ["pic0", "pic1", "pic2", "pic3", "pic4", "pic5",];
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('GridView'),
          ),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // mainAxisSpacing: 4,
              // crossAxisSpacing: 4,
            ),
            // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //   maxCrossAxisExtent: 150,
            // ),
            // scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              if (index >= grid.length) {
                grid.addAll(["pic0", "pic1", "pic2", "pic3", "pic4", "pic5",]);
              }
              return _photoItem(grid[index]);
            }
          )
        )
    );
  }

}
