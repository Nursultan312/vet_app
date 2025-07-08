import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vet/menu_page/chicken.dart';
import 'package:vet/menu_page/cow.dart';
import 'package:vet/menu_page/horse.dart';
import 'package:vet/menu_page/sheep.dart';
import 'package:vet/screens/login.dart';
import 'package:vet/screens/profile_edit.dart';
import 'package:vet/screens/register.dart';
import 'screens/welcome_page.dart'; // Import the WelcomePage
import 'menu_page/biz_jonundo.dart';
import 'menu_page/toyut.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GridView Buttons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/welcome', // Set initial route to the WelcomePage

      routes: {
        '/welcome': (context) => WelcomePage(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/': (context) => HomePage(),
        '/page1': (context) => BizJonundo(),
        '/page2': (context) => Toyut(),
        '/page3': (context) => Page3(),
        '/page4': (context) => Page4(),
        '/page5': (context) => Cow(),
        '/page6': (context) => Sheep(),
        '/page7': (context) => Horse(),
        '/page8': (context) => Chicken(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Current selected index of the BottomNavigationBar
  int _selectedIndex = 0;

  // Handle tapping on BottomNavigationBar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
              size: 30,
            ), // The icon you want to add
            onPressed: () {
              // Action when the icon is pressed
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(
          child: Text(
            'Меню',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Makes the text bold
              fontSize:
                  18, // Makes the text smaller, you can adjust the value as needed
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileEdit(),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/logo.png',
                height: 70,
                width: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: _selectedIndex == 0
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of buttons per row
                crossAxisSpacing: 8.0, // Spacing between buttons
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 50.0),
              itemCount: 8, // Number of buttons
              itemBuilder: (context, index) {
                String imagePath = 'assets/images/${index + 1}.png';
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/page${index + 1}');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        height: 130, // Adjust image size
                        width: 130,
                      ),
                    ],
                  ),
                );
              },
            )
          : _selectedIndex == 1
              ? BizJonundo() //about us page
              : Toyut(),
      //: Cow(), // Add other pages as needed

      bottomNavigationBar: BottomNavigationBar(
        //String imagePath = 'assets/images/navigation.svg';
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Contact info',
          ),
        ],
      ),
    );
  }
}

/*class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 1'));
  }
}*/

/*class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 2'));
  }
}*/

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 3'));
  }
}

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 4'));
  }
}

/*class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 5'));
  }
}*/

/*class Page6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 6'));
  }
}*/

class Page7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 7'));
  }
}

class Page8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Welcome to Page 8'));
  }
}
