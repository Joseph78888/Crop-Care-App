import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/l10n.dart';
import '../../data/models/chat_session_model.dart';
import '../../data/models/detection_result.dart';
import '../../data/models/disease_info_model.dart';
import '../../presentation/providers/chat_provider.dart';
import '../../presentation/screens/chat_history_screen.dart';
import '../../presentation/widgets/chat_message.dart';
import '../../presentation/widgets/gradient_scaffold.dart';
import '../../presentation/widgets/new_message.dart';

class ChatbotScreen extends ConsumerStatefulWidget {
  final DetectionResult? detectionResult;
  final DiseaseInfo? diseaseInfo;

  const ChatbotScreen({super.key, this.detectionResult, this.diseaseInfo});

  @override
  ConsumerState<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends ConsumerState<ChatbotScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.detectionResult != null) {
      Future.delayed(Duration.zero, () {
        ref
            .read(chatProvider.notifier)
            .setContext(widget.detectionResult!, widget.diseaseInfo);
      });
    }
  }

  Future<void> _openHistory() async {
    final result = await Navigator.of(context).push<ChatSessionModel?>(
      MaterialPageRoute(builder: (_) => const ChatHistoryScreen()),
    );

    if (!mounted) return;

    if (result == null) {
      // User tapped "New Chat" — start a fresh session.
      ref.read(chatProvider.notifier).startNewSession();
    } else {
      // User selected a saved session — resume it.
      ref.read(chatProvider.notifier).loadSession(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatState = ref.watch(chatProvider);

    return GradientScaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              S.of(context).chatbotAppBar,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (widget.detectionResult != null)
              Text(
                'Discussing: ${widget.diseaseInfo?.getLocalizedName(context) ?? widget.detectionResult!.diseaseName}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded),
            tooltip: 'Chat History',
            onPressed: _openHistory,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: chatState.messages.isEmpty
                  ? _EmptyState(context: context)
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      itemCount: chatState.messages.length,
                      itemBuilder: (context, index) {
                        return ChatMessage(
                          message: chatState.messages[index],
                        );
                      },
                    ),
            ),
            if (chatState.isLoading)
              const LinearProgressIndicator(minHeight: 2),
            if (chatState.error != null)
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.red.withValues(alpha: 0.1),
                child: Row(
                  children: [
                    const Icon(Icons.error_outline, color: Colors.red),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        chatState.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            const NewMessage(),
          ],
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final BuildContext context;

  const _EmptyState({required this.context});

  @override
  Widget build(BuildContext buildContext) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.eco_rounded,
            size: 64,
            color: theme.colorScheme.primary.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).chatbotAppBar,
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).askMeAnything,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
