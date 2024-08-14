import 'package:flutter/material.dart';
import 'package:walchain/features/home/screens/qr_scanning.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.name, required this.role});
  final String name;
  final String role;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
Widget build(BuildContext context) {
  // MediaQuery for responsive sizing
  final mediaQuery = MediaQuery.of(context);
  final screenWidth = mediaQuery.size.width;
  final screenHeight = mediaQuery.size.height;

  return SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello👋 ${widget.name}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Lora',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.role,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 1.5,
                        letterSpacing: 1.68,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 42,
                  height: 42,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF9F1C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.notifications),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              width: screenWidth,
              height: 1,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.black.withOpacity(0.1),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
              const SizedBox(height: 14),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    borderRadius:
                        BorderRadius.circular(15), // Added border radius
                  ),
                ),
              ),
             
            SizedBox(height: screenHeight * 0.03),
            Center(
              child: Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.05,
                decoration: ShapeDecoration(
                  color: const Color(0xFFFF9F1C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'DASHBOARD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: _buildDashboardItem(
                screenWidth: screenWidth,
                imagePath: "assets/images/incoming.jpg",
                title: "INCOMING",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScanningScreen(type: 'incoming'),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Center(
              child: _buildDashboardItem(
                screenWidth: screenWidth,
                imagePath: "assets/images/outgoing.jpg",
                title: "OUTGOING",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QRScanningScreen(type: 'outgoing'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildDashboardItem({
  required double screenWidth,
  required String imagePath,
  required String title,
  required VoidCallback onTap,  // New parameter
}) {
  return GestureDetector(
    onTap: onTap,  // Trigger the callback when the container is tapped
    child: Container(
      width: screenWidth * 0.7,
      height: screenWidth * 0.5,
      decoration: ShapeDecoration(
        color: const Color(0xFFD9D9D9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.5,
            height: screenWidth * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 8), // Space between the image and the text
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF302A2A),
              fontSize: 16,
              fontFamily: 'Arial Rounded MT Bold',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    ),
  );
}

}