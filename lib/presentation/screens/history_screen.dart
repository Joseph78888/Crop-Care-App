import 'package:crop_care_app/data/models/detection_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/presentation/widgets/history_searh_bar.dart';
import '/presentation/widgets/total_healthy_deasise_filter.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/widgets/history_card.dart';
import '/presentation/providers/history_provider.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final TextEditingController controller = TextEditingController();
  final isSelected = false;
  String _filterType = 'all'; // all, healthy, diseased

  void _onFilterChanged(String filter) {
    setState(() {
      _filterType = filter;
    });
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // elevation: 0,
        title: const Text(
          'Analysis History',
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              children: [
                // TotalHealthyDeasiseFilter
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TotalHealthyDeasiseFilter(name: 'Total'),
                    TotalHealthyDeasiseFilter(name: 'Healthy'),
                    TotalHealthyDeasiseFilter(name: 'Diseased'),
                  ],
                ),
                const SizedBox(height: 20),

                // HistorySearhBar
                const HistorySearhBar(),
                const SizedBox(height: 14),
                
                // Filter Buttons
                Row(
                  children: [
                    _buildFilterChip('All', 'all'),
                    const SizedBox(width: 8),
                    _buildFilterChip('Healthy', 'healthy'),
                    const SizedBox(width: 8),
                    _buildFilterChip('Diseased', 'diseased'),
                  ],
                ),

                const SizedBox(height: 20),
                // History list (watches provider)
                Consumer(
                  builder: (context, ref, _) {
                    final allItems = ref.watch(historyProvider);
                    
                    // Filter items based on selected filter type
                    final filteredItems = _filterType == 'all'
                        ? allItems
                        : _filterType == 'healthy'
                            ? allItems.where((e) => e.status == HealthStatus.healthy).toList()
                            : allItems.where((e) => e.status == HealthStatus.diseased).toList();
                    
                    if (filteredItems.isEmpty) return _buildEmptyHistoryState();
                    return Column(
                      children: filteredItems.map((e) => HistoryCard(result: e)).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _filterType == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => _onFilterChanged(value),
      backgroundColor: Colors.white,
      selectedColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      checkmarkColor: Theme.of(context).colorScheme.primary,
      side: BorderSide(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey[300]!,
      ),
    );
  }

  Widget _buildEmptyHistoryState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'No Analysis History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Start analyzing your crops to see results here',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }


}
