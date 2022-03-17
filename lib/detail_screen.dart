import 'package:flutter/material.dart';
import 'package:kedai_angkringan/model/menu_angkringan.dart';

class DetailScreen extends StatelessWidget {
  final MenuAngkringan menu;

  DetailScreen ({required this.menu});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(menu: menu);
        } else {
          return DetailMobilePage(menu: menu);
        }
      },
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final MenuAngkringan menu;

  DetailWebPage({required this.menu});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kedai Angkringan Manggar. Size: ${MediaQuery.of(context).size.width}'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Menu Angkringan Manggar',
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.menu.imageAsset),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          const SizedBox(height: 16.0)
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.brown,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.arrow_back,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      FavoriteButton(),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  widget.menu.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                  ),
                                ),
                              ),  
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.menu.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    ElevatedButton(
                                      onPressed: () {

                                      }, 
                                      child: const Text('Original')
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        
                                      }, 
                                      child: const Text('Bakar')
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        
                                      }, 
                                      child: const Text('Goreng')
                                    ),
                                    IconButton(
                                      onPressed: () {

                                      }, 
                                      icon: const Icon(Icons.note_add, color: Color.fromARGB(255, 255, 230, 0))
                                    )
                                  ],
                                )
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: AddToCartButton(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final MenuAngkringan menu;

  DetailMobilePage ({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(menu.imageAsset)
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.brown,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(
                menu.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),           
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                menu.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {                     
                    },
                    child: Text('Original')
                  ),
                  ElevatedButton(
                    onPressed: () {                     
                    },
                    child: Text('Bakar')
                  ),
                  ElevatedButton(
                    onPressed: () {                     
                    },
                    child: Text('Goreng')
                  ),
                  IconButton(
                    onPressed: () { 
                  },
                  icon: Icon(Icons.note_add, color: Color.fromARGB(255, 255, 230, 0))
                  )
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(top: 150.0),
              child: AddToCartButton(),
            )
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isAddToFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isAddToFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isAddToFavorite = !isAddToFavorite;
        });
      },
    );
  }
}

class AddToCartButton extends StatefulWidget {
  AddToCartButton({Key? key}) : super(key: key);

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  String textStatus = 'Belum masuk ke Keranjang';

  changeStatus() {
    setState(() {
      textStatus = 'Oke udah masuk keranjang';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          child: Text('$textStatus', 
            style: TextStyle(fontSize: 21))),
 
        ElevatedButton(
          onPressed: () => changeStatus(),
          child: Text('Masukin ke Keranjang'),
        ),   
      ])
    );
  }
}