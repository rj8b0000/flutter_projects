import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back, Admin!",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Here\'s an overview of your store",
                      style: GoogleFonts.poppins(
                        color: Colors.white70,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.auto_graph_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            childAspectRatio: 1.4,
            children: [
              _buildStatCard(
                context,
                title: 'Total Sales',
                value: '\$24,780',
                icon: Icons.attach_email_rounded,
                color: Color(0xFF4CAf50),
              ),
              _buildStatCard(
                context,
                title: 'Total Orders',
                value: '\$14,780',
                icon: Icons.shopping_basket_rounded,
                color: Color(0xFF2196F3),
              ),
              _buildStatCard(
                context,
                title: 'Total Products',
                value: '\$24,780',
                icon: Icons.inventory_rounded,
                color: Color(0xFFFF5722),
              ),
              _buildStatCard(
                context,
                title: 'Total Customers',
                value: '2,792',
                icon: Icons.groups_rounded,
                color: Color(0xFFF9C2780),
              ),
            ],
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Revenue Orders",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Monthly View",
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 11,
                        minY: 0,
                        maxY: 6,
                        lineBarsData: [
                          LineChartBarData(
                            spots: const [
                              FlSpot(0, 3),
                              FlSpot(2.6, 2),
                              FlSpot(4.9, 5),
                              FlSpot(6.8, 3.1),
                              FlSpot(8, 4),
                              FlSpot(9.5, 3),
                              FlSpot(11, 4),
                            ],
                            isCurved: true,
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(
                                  context,
                                ).colorScheme.primary.withOpacity(0.3),
                                Theme.of(
                                  context,
                                ).colorScheme.secondary.withOpacity(0.3),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ],
                        gridData: FlGridData(
                          show: true,
                          drawHorizontalLine: false,
                          horizontalInterval: 1,
                          getDrawingHorizontalLine: (value) => FlLine(
                            color: Colors.grey.withOpacity(0.2),
                            strokeWidth: 1,
                          ),
                        ),
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recent Orders",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Monthly View",
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ...List.generate(
                        4,
                        (index) => _buildOrderItem(
                          context,
                          '#ORD-${2345 + index}',
                          'Customer ${index + 1}',
                          index % 2 == 0 ? "Completed" : "Pending",
                          '\$${(120 + index * 50).toString()}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          //Top Products Section
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Orders",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Monthly View",
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...List.generate(
                    4,
                    (index) => Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product ${index + 1}',
                                style: GoogleFonts.poppins(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '${1000 - index * 120} sales',
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: (1000 - index * 120),
                              backgroundColor: Colors.grey[200],
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.secondary,
                              ),
                              minHeight: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
    BuildContext context,
    String id,
    String customer,
    String status,
    String amount,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  customer,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: status == "Completed"
                    ? Colors.green[50]
                    : Colors.orange[50],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: status == 'Completed' ? Colors.green : Colors.orange,
                ),
              ),
            ),
          ),
          Expanded(
            child: Text(
              amount,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: Opacity(
                opacity: 0.3,
                child: Icon(icon, size: 80, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: Colors.white, size: 30),
                  SizedBox(height: 10),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
