import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Sheep extends StatefulWidget {
  @override
  State<Sheep> createState() => _SheepState();
}

class _SheepState extends State<Sheep> {
  int _selectedIndex = 0;
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
            'Кой эчкилер',
            style: TextStyle(
              fontWeight: FontWeight.bold, // Makes the text bold
              fontSize:
                  18, // Makes the text smaller, you can adjust the value as needed
            ),
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 20.0), // Adjust padding as needed
            child: Image.asset(
              'assets/images/logo.png', // Path to your logo image
              height: 70,
              width: 70, // Set the height of the logo image
              fit: BoxFit
                  .contain, // Maintain the aspect ratio and fit inside the container
            ),
          ),
        ],
      ),
      body: Column(
        // Center the image vertically
        children: [
          // Add your image here
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 20.0), // Adjust vertical padding as needed
            child: Image.asset(
              'assets/images/sheep.png', // Path to the image you want to show
              height: 320, // Adjust the height of the image
              width: double.infinity, // You can set a fixed width or full width
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0), // Adjust vertical padding as needed
            child: Image.asset(
              'assets/images/toyut_button.png', // Path to the image you want to show
              height: 75, // Adjust the height of the image
              width: double.infinity, // You can set a fixed width or full width
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0), // Adjust vertical padding as needed
            child: Image.asset(
              'assets/images/ooruu_button.png', // Path to the image you want to show
              height: 75, // Adjust the height of the image
              width: double.infinity, // You can set a fixed width or full width
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ),
          SizedBox(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 5.0), // Adjust vertical padding as needed
            child: Image.asset(
              'assets/images/uruktandyruu_button.png', // Path to the image you want to show
              height: 75, // Adjust the height of the image
              width: double.infinity, // You can set a fixed width or full width
              fit: BoxFit.contain, // Adjust fit as needed
            ),
          ),
          // Add other widgets here if needed
        ],
      ),
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
