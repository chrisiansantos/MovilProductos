import 'package:flutter/material.dart';
import 'package:parcial_christian_santos/favoritos.dart';
import 'package:parcial_christian_santos/login.dart';
import 'package:parcial_christian_santos/noti.dart';
import 'package:parcial_christian_santos/productos_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {  
    return ChangeNotifierProvider(
      create: (context) => FavNoti(),
      child: MaterialApp(   
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IniciarApp(),
      ),
    );
  }
}

class IniciarApp extends StatelessWidget {
  const IniciarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple, 
                onPrimary: Colors.white, 
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
                elevation: 5, 
              ),
              child: const Text(
                'Comenzar',
                style: TextStyle(fontSize: 18), 
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // el registro
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple, 
                onPrimary: Colors.white, 
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), 
                ),
                elevation: 5, 
                
              ),
              child: const Text(
                'Registrarse',
                style: TextStyle(fontSize: 18), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Productos")),
      body: _selectedIndex == 0 ? ProductosList() : Favoritos(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Ver Productos'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritos'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
