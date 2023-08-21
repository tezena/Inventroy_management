import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import "package:inventory/EditScreen.dart";

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final String productImageUrl;
  final double stockInAmount;
  final double stockOutAmount;
  final double runningOutAmount;
  final double productPrice;
  final String expiryDate;
  final String supplier;
  final int availableUnits;

  ProductDetailPage({
    required this.productName,
    required this.productImageUrl,
    required this.stockInAmount,
    required this.stockOutAmount,
    required this.runningOutAmount,
    required this.productPrice,
    required this.expiryDate,
    required this.supplier,
    required this.availableUnits,
  });

  @override
  Widget build(BuildContext context) {
    final data = [
      charts.Series<StockData, String>(
        id: 'Stock',
        domainFn: (StockData series, _) => series.label,
        measureFn: (StockData series, _) => series.value,
        data: [
          StockData('Stock In', stockInAmount, Colors.green),
          StockData('Stock Out', stockOutAmount, Colors.red),
          StockData('Running Out', runningOutAmount, Colors.yellow),
        ],
        colorFn: (StockData series, _) =>
            charts.ColorUtil.fromDartColor(series.color),
        labelAccessorFn: (StockData series, _) =>
            '${series.label}: ${series.value}',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(107, 59, 225, 1),
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .2,
            ),
            Text('Product Detail'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .9,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.asset(
                    productImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditScreen(),
                              ))
                        },
                    icon: Icon(
                      Icons.edit_note,
                      size: 50,
                      color: Color.fromRGBO(107, 59, 225, 1),
                      semanticLabel: "Edit",
                    ))
              ],
            ),
            SizedBox(height: 25.0),
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width * .85,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromRGBO(107, 59, 225, 1), width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Daily Activity",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        SizedBox(
                          height: 180.0,
                          width: 180,
                          child: charts.PieChart(
                            data,
                            animate: true,
                          ),
                        ),
                        _buildLegend(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(height: 16.0),
            Text(
              'Price: \$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.0),
            Text('Expiry Date: $expiryDate',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.red)),
            SizedBox(height: 10.0),
            Text('Supplier: $supplier',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            SizedBox(height: 10.0),
            Text('Available Units: $availableUnits',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLegendItem('Stock In', Colors.green),
        _buildLegendItem('Stock Out', Colors.red),
        _buildLegendItem('Running Out', Colors.yellow),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
            width: 16.0,
            height: 16.0,
            color: color,
            margin: EdgeInsets.only(top: 5.0)),
        Text(label),
      ],
    );
  }
}

class StockData {
  final String label;
  final double value;
  final Color color;

  StockData(this.label, this.value, this.color);
}
