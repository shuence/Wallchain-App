import 'package:flutter/material.dart';
import 'package:walchain/features/home/home_screen.dart';

class Consignmentdetails extends StatefulWidget {
  const Consignmentdetails({super.key, required this.name, required this.role});
  final String name;
  final String role;

  @override
  _ConsignmentdetailsState createState() => _ConsignmentdetailsState();
}

class _ConsignmentdetailsState extends State<Consignmentdetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
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
                            height: 1,
                            letterSpacing: 1.68,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 42,
                      height: 42,
                      decoration: const ShapeDecoration(
                        color: Color(0xFFFF9F1C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(21)),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                        onPressed: () {
                          // Handle notifications button press
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
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
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Text(
                        'Check In Task',
                        style: TextStyle(
                          color: selectedIndex == 0
                              ? Colors.black
                              : Colors.black.withOpacity(0.6),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Text(
                        'Assigned Slot',
                        style: TextStyle(
                          color: selectedIndex == 1
                              ? Colors.black
                              : Colors.black.withOpacity(0.6),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 1,
                        color: selectedIndex == 0
                            ? const Color(0xFFFF9F1C)
                            : const Color(0x28FF9F1C),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 1,
                        color: selectedIndex == 1
                            ? const Color(0xFFC98D3A)
                            : const Color(0x28FF9F1C),
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: selectedIndex == 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 168.13,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/truckp.jpg"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Consignment Details',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildDetailRow('Consignment ID:', '123456'),
                            _buildDetailRow('Consignment Type:', 'Food'),
                            _buildDetailRow('Consignment Weight:', '1000kg'),
                            _buildDetailRow(
                                'Consignment Status:', 'In Transit'),
                            _buildDetailRow('Consignment ETA:', '12:00 PM'),
                            _buildDetailRow('Consignment ETD:', '10:00 AM'),
                            _buildDetailRow('Consignment Source:', 'Bangalore'),
                            _buildDetailRow(
                                'Consignment Destination:', 'Chennai'),
                            _buildDetailRow(
                                'Consignment Vehicle:', 'KA 01 AB 1234'),
                            _buildDetailRow('Driver Full Name:', 'John Doe'),
                            _buildDetailRow(
                                'Trailer Plate No:', 'KA 01 AB 1234'),
                            _buildDetailRow('License No:', 'DL12345678'),
                            _buildDetailRow('Assigned Slot:', 'A5'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF9F1C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: const Text(
                            'View Assigned Slot',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
       Visibility(
  visible: selectedIndex == 1,
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Assigned Slot',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.green, // Color for Assigned Slot
              shape: BoxShape.circle,
            ),
          ),
          const Text(
            'Slot A5',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      const SizedBox(height: 20),
      // Truck Grid with Slot Names
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Slot Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < 6; i++)
                Container(
                  width: 40,
                  height: 20,
                  alignment: Alignment.center,
                  child: Text(
                    String.fromCharCode('A'.codeUnitAt(0) + i) + '1',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
         const SizedBox(height: 10),
                  for (var row in ['A', 'B', 'C'])
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var i = 1; i <= 5; i++)
                              GestureDetector(
                                onTap: () {
                                  if ('$row$i' == 'A5') {
                                    _showUnloadDialog();
                                  }
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _getTruckColor('$row$i'), // Set color based on slot
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    '$row$i', // Slot number
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                const SizedBox(height: 10),
              ],
            ),
          const SizedBox(height: 10),
          // Color Legend
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColorBox(Colors.blue, 'Loaded Trucks'),
              const SizedBox(height: 8),
              _buildColorBox(Colors.brown, 'Unloaded Trucks'),
              const SizedBox(height: 8),
              _buildColorBox(Colors.grey, 'Empty Spots'),
              const SizedBox(height: 8),
              _buildColorBox(Colors.green, 'Assigned Slot'),
            ],
          ),
        ],
      ),
    ],
  ),
),

 ],
            ),
          ),
        ),
      ),
    );
  }

 void _showUnloadDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Unload'),
        content: const Text('Are you sure you want to mark this consignment as unloaded?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add logic here to update consignment status
              _updateConsignmentStatus(); // Call a method to handle the update
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()),
                      (route) => false,
                    );
                  });
                  return const AlertDialog(
                    title: Text('Consignment Unload Success'),
                    content: Text('The consignment has been marked as unloaded.'),
                  );
                },
              );
            },
            child: const Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('No'),
          ),
        ],
      );
    },
  );
}

void _updateConsignmentStatus() {
  // Add your logic here to update the consignment status
  // For example, you might update the status in a database or notify a server
  print('Consignment status updated.');
}

  Color _getTruckColor(String slot) {
  // Define the assigned slot
  const String assignedSlot = 'A5'; // Example assigned slot
  if (slot == assignedSlot) {
    return Colors.green; // Color for Assigned Slot
  }
  
  // Define colors for other slots
  if (slot.startsWith('A')) {
    return Colors.blue; // Loaded Trucks
  } else if (slot.startsWith('B')) {
    return Colors.brown; // Unloaded Trucks
  } else if (slot.startsWith('C')) {
    return Colors.grey; // Empty Spots
  }
  
  return Colors.white; // Default color
}

Widget _buildColorBox(Color color, String label) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
      ),
      const SizedBox(width: 8),
      Text(
        label,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
      

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
