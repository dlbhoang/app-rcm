import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/data_cubit.dart';
import '../models/data_state.dart';
import '../widgets/data_analysis.dart';
import '../widgets/data_statistics.dart';  // Import widget thống kê

class DataAnalysisScreen extends StatelessWidget {
  const DataAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataCubit, DataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DataError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is DataLoaded) {
            return Column(
              children: [
                // Hiển thị thống kê dữ liệu
                DataStatisticsWidget(data: state.data),
                // Hiển thị danh sách dữ liệu
                Expanded(
                  child: DataAnalysisWidget(data: state.data),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
