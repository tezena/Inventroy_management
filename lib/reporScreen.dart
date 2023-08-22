import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportPage extends StatelessWidget {
  final double totalStockAmount = 5000.0;
  final int totalCategories = 10;
  final List<Product> runningOutProducts = [
    Product('Product A', 5, "assets/images/shoe1.jpg"),
    Product('Product B', 8, "assets/images/shoe1.jpg"),
    Product('Product C', 10, "assets/images/shoe1.jpg"),
    Product('Product A', 5, "assets/images/shoe1.jpg"),
    Product('Product B', 8, "assets/images/shoe1.jpg"),
    Product('Product C', 10, "assets/images/shoe1.jpg"),
  ];
  final List<Product> topSellingProducts = [
    Product('Product D', 15, "assets/images/shoe1.jpg"),
    Product('Product E', 12, "assets/images/shoe1.jpg"),
    Product('Product F', 20, "assets/images/shoe1.jpg"),
  ];
  final List<Category> categoryDistribution = [
    Category('Category X', 30),
    Category('Category Y', 25),
    Category('Category Z', 45),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
            ),
            Text('Inventory Report'),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRunningOutProducts(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                _buildTotalStockCircularIndicator('$totalStockAmount'),
                SizedBox(
                  width: 10,
                ),
                _buildTotalCategoryCircularIndicator(' $totalCategories'),
              ],
            ),
            SizedBox(height: 32.0),
            _buildTopSellingProducts(),
            SizedBox(height: 16.0),
            _buildStockTrendsChart(),
            SizedBox(height: 16.0),
            _buildCategoryDistributionChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildRunningOutProducts() {
    return Card(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Running Out Products',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            SizedBox(
              height: 140.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: runningOutProducts.length,
                itemBuilder: (context, index) {
                  final product = runningOutProducts[index];
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                            width: 100.0,
                            height: 100.0,
                            // color: Colors.red,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              child: Image.asset(
                                product.ImageUrl,
                                fit: BoxFit.fill,
                              ),
                            )),
                        SizedBox(height: 4.0),
                        Text('Quantity: ${product.quantity}'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSellingProducts() {
    return Card(
      child: Container(
        width: 400.0, // Adjust the width to your preference
        child: Padding(
          padding:const  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const  Text(
                'Top selling Products',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              SizedBox(
                height: 140.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topSellingProducts.length,
                  itemBuilder: (context, index) {
                    final product = topSellingProducts[index];
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              width: 100.0,
                              height: 100.0,
                              // color: Colors.red,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                child: Image.asset(
                                  product.ImageUrl,
                                  fit: BoxFit.fill,
                                ),
                              )),
                         const  SizedBox(height: 4.0),
                          Text('Sold: ${product.quantity}'),
                        ],
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

  Widget _buildStockTrendsChart() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stock Trends',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            AspectRatio(
              aspectRatio: 1.5,
              child: LineChart(
                LineChartData(
                  // Configure your line chart data here (mock data provided)
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 10),
                        FlSpot(1, 20),
                        FlSpot(2, 15),
                        FlSpot(3, 18),
                        FlSpot(4, 25),
                      ],
                      color: Colors.blue,
                      isCurved: true,
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDistributionChart() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Category Distribution',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            AspectRatio(
              aspectRatio: 1.5,
              child: BarChart(
                BarChartData(
                  // Configure your bar chart data here (mock data provided)
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  gridData: FlGridData(show: true),
                  barGroups: categoryDistribution.map((category) {
                    return BarChartGroupData(
                      x: category.percentage,
                      barRods: [
                        BarChartRodData(
                          toY: category.percentage.toDouble(),
                          color: Colors.green,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTotalStockCircularIndicator(String text) {
  return Center(
    child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.green, width: 5)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 45,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
              ),
              Text(
                "Total Items",
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
        )),
  );
}

Widget _buildTotalCategoryCircularIndicator(String text) {
  return Center(
    child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.blue, width: 5)),
        child: Center(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Total Category",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        )),
  );
}

class Product {
  final String name;
  final int quantity;
  final String ImageUrl;

  Product(this.name, this.quantity, this.ImageUrl);
}

class Category {
  final String name;
  final int percentage;

  Category(this.name, this.percentage);
}
