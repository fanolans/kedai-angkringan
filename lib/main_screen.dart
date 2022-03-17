import 'package:flutter/material.dart';
import 'package:kedai_angkringan/detail_screen.dart';
import 'package:kedai_angkringan/model/menu_angkringan.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kedai Angkringan Manggar.'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 550) {
            return MenuAngkringanList();
          }
          else if (constraints.maxWidth <= 700) {
            return MenuAngkringanGrid(gridCount: 2);
          }
          else if (constraints.maxWidth <= 900) {
            return MenuAngkringanGrid(gridCount: 3);
          }
          else if (constraints.maxWidth <= 1200) {
            return MenuAngkringanGrid(gridCount: 4);
          }
          else {
            return MenuAngkringanGrid(gridCount: 5);
          }
        }
      )
    );
  }
}

class MenuAngkringanGrid extends StatelessWidget {
  final int gridCount;

  MenuAngkringanGrid({required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        children: menuAngkringanList.map((menu) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(menu: menu);
              },));
            },
            child: Card(
              elevation: 5.0,
              margin: EdgeInsets.all(10.0),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.white)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(menu.imageAsset, fit: BoxFit.cover,),
                    ),  
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      menu.name,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      menu.description,
                      style: const TextStyle(
                        fontSize: 12.0
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      menu.price,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.green
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MenuAngkringanList extends StatelessWidget {
  const MenuAngkringanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final MenuAngkringan menu = menuAngkringanList[index];
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(menu: menu,);
              },));
            },
            child: Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(16.0),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.white)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(menu.imageAsset),
                    )
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            menu.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            menu.description,
                            style: const TextStyle(
                              fontSize: 12.0
                            )
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            menu.price,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.green
                            ),
                          )
                        ],
                      ),
                    )
                  )
                ]
              ),
            ),
          );
        },
      itemCount: menuAngkringanList.length, 
    );
  }
}