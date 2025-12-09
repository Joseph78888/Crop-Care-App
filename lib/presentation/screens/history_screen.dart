import 'package:crop_care_app/data/models/detection_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:crop_care_app/generated/l10n.dart';
import '/presentation/widgets/history_search_bar.dart';
import '/presentation/widgets/total_healthy_deasise_filter.dart';
import '/presentation/widgets/gradient_scaffold.dart';
import '/presentation/widgets/history_card.dart';
import '/presentation/providers/history_provider.dart';
import '/core/utils/responsive_helper.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  final TextEditingController controller = TextEditingController();
  final isSelected = false;
  String _filterType = 'all'; // all, healthy, diseased
  String _searchQuery = ''; // Track search text for filtering

  void _onFilterChanged(String filter) {
    setState(() {
      _filterType = filter;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query.toLowerCase(); // Case-insensitive search
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
        title: Builder(
          builder: (context) {
            return Text(
              S.of(context).analysisHistory,
              style: const TextStyle(fontWeight: FontWeight.w400),
            );
          },
        ),
      ),

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(context.responsive.md),

            child: Column(
              children: [
                // TotalHealthyDeasiseFilter
                
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TotalHealthyDeasiseFilter(name: S.of(context).total),
                        TotalHealthyDeasiseFilter(name: S.of(context).healthy),
                        TotalHealthyDeasiseFilter(name: S.of(context).diseased),
                      ],
                    ),
                  
                SizedBox(height: context.responsive.lg),

                // HistorySearhBar
                HistorySearchBar(
                  controller: controller,
                  onChanged: _onSearchChanged,
                ),
                SizedBox(height: context.responsive.sm),

                // Filter Buttons
                Builder(
                  builder: (context) {
                    return Row(
                      children: [
                        _buildFilterChip(S.of(context).all, 'all'),
                        const SizedBox(width: 8),
                        _buildFilterChip(S.of(context).healthy, 'healthy'),
                        const SizedBox(width: 8),
                        _buildFilterChip(S.of(context).diseased, 'diseased'),
                      ],
                    );
                  },
                ),

                SizedBox(height: context.responsive.md),
                // History list (watches provider)
                Consumer(
                  builder: (context, ref, _) {
                    final allItems = ref.watch(historyProvider);

                    // STAGE 1: Filter by status (healthy/diseased/all)
                    final statusFiltered = _filterType == 'all'
                        ? allItems
                        : _filterType == 'healthy'
                        ? allItems
                              .where((e) => e.status == HealthStatus.healthy)
                              .toList()
                        : allItems
                              .where((e) => e.status == HealthStatus.diseased)
                              .toList();

                    // STAGE 2: Filter by search query (disease name)
                    final filteredItems = _searchQuery.isEmpty
                        ? statusFiltered
                        : statusFiltered
                              .where(
                                (e) => e.diseaseName.toLowerCase().contains(
                                  _searchQuery,
                                ),
                              )
                              .toList();

                    if (filteredItems.isEmpty) return _buildEmptyHistoryState();
                    return Column(
                      children: filteredItems
                          .map((e) => HistoryCard(result: e))
                          .toList(),
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
    return Builder(
      builder: (context) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history,
                  size: context.responsive.rs(64),
                  color: Colors.grey[400],
                ),
                SizedBox(height: context.responsive.md),
                Text(
                  S.of(context).noAnalysisHistory,
                  style: TextStyle(
                    fontSize: context.responsive.textXL,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: context.responsive.sm),
                Text(
                  S.of(context).startAnalyzingMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: context.responsive.textSM,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
