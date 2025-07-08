import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Toyut(),
    debugShowCheckedModeBanner: false,
  ));
}

class Toyut extends StatefulWidget {
  @override
  State<Toyut> createState() => _ToyutState();
}

class _ToyutState extends State<Toyut> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToPage(String page) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DestinationPage(pageName: page),
      ),
    );
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
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Center(
          child: Text(
            'Тоют',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Image.asset(
              'assets/images/logo.png',
              height: 70,
              width: 70,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Tema',
                isDense: true,
                contentPadding: EdgeInsets.only(left: 20.0),
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 366,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white), // border you want
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                'assets/images/toyut_grass.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            ClickableContainer(
              onTap: () => navigateToPage("Image 1"),
              image: Image.asset(
                'assets/images/1.png',
                width: 86,
                height: 70,
                fit: BoxFit.cover,
              ),
              title: 'Image 1',
              subtitle: 'Lorem Ipsum is simply dummy text of the',
              text: 'Тоют ',
            ),
            SizedBox(height: 10),
            ClickableContainer(
              onTap: () => navigateToPage("Image 2"),
              image: Image.asset(
                'assets/images/2.png',
                width: 86,
                height: 70,
                fit: BoxFit.cover,
              ),
              //text: 'I',
              title: '123',
              subtitle: '1111111111', text: 'Тоют ',
            ),
            SizedBox(height: 10),
            ClickableContainer(
              onTap: () => navigateToPage("Image 3"),
              image: Image.asset(
                'assets/images/3.png',
                width: 86,
                height: 70,
                fit: BoxFit.cover,
              ),
              text: 'Тоют ',
              title: '111',
              subtitle: '222',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            label: 'Contact info',
          ),
        ],
      ),
    );
  }
}

class ClickableContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Widget image;
  final String text;

  const ClickableContainer({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
    required String title,
    required String subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: image,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DestinationPage extends StatelessWidget {
  final String pageName;

  const DestinationPage({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
      ),
      body: Center(
        child: Text('This is the $pageName page'),
      ),
    );
  }
}
