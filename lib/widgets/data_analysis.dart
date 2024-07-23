import 'package:flutter/material.dart';
import '../models/data_analysis.dart';

class DataAnalysisWidget extends StatefulWidget {
  final List<DataAnalysis> data;

  const DataAnalysisWidget({required this.data});

  @override
  _DataAnalysisWidgetState createState() => _DataAnalysisWidgetState();
}

class _DataAnalysisWidgetState extends State<DataAnalysisWidget> {
  String? selectedLabel;

  @override
  Widget build(BuildContext context) {
    final labelCounts = <String, int>{};
    for (var item in widget.data) {
      final label = item.label;
      if (labelCounts.containsKey(label)) {
        labelCounts[label] = labelCounts[label]! + 1;
      } else {
        labelCounts[label] = 1;
      }
    }

    final filteredData = selectedLabel == null
        ? widget.data
        : widget.data.where((item) => item.label == selectedLabel).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: selectedLabel,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blueGrey[300]!, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.blueGrey[300]!, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              hint: Text(
                'Select Label',
                style: TextStyle(color: Colors.grey[600]),
              ),
              icon: Icon(Icons.arrow_drop_down, color: Colors.blueGrey[600]),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLabel = newValue;
                });
              },
              items: labelCounts.keys.map<DropdownMenuItem<String>>((label) {
                return DropdownMenuItem<String>(
                  value: label,
                  child: Text(
                    label,
                    style: TextStyle(color: Colors.black87),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final item = filteredData[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.restaurantName,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 20.0, color: Colors.grey[600]),
                            const SizedBox(width: 4.0),
                            Expanded(
                              child: Text(
                                item.address,
                                style: const TextStyle(fontSize: 14.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 20.0, color: Colors.grey[600]),
                            const SizedBox(width: 4.0),
                            Text(
                              '${item.timeOpen} - ${item.timeClose}',
                              style: const TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Lowest Price: \$${item.lowestPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14.0, color: Colors.green),
                        ),
                        Text(
                          'Highest Price: \$${item.highestPrice.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 14.0, color: Colors.red),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(Icons.star, size: 20.0, color: Colors.yellow[700]),
                            const SizedBox(width: 4.0),
                            Text(
                              '${item.rating.toStringAsFixed(1)} / 5.0',
                              style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Positive Count: ${item.positiveCount}',
                          style: const TextStyle(fontSize: 14.0, color: Colors.green),
                        ),
                        Text(
                          'Negative Count: ${item.negativeCount}',
                          style: const TextStyle(fontSize: 14.0, color: Colors.red),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Label: ${item.label}',
                          style: const TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Comment Tokenize: ${item.commentTokenize}',
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
