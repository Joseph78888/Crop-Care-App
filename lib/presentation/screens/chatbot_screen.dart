import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../generated/l10n.dart';
import '../../data/models/detection_result.dart';
import '../../data/models/disease_info_model.dart';
import '../../presentation/providers/chat_provider.dart';
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
    // Initialize context if available
    if (widget.detectionResult != null) {
      // Defer the setContext call to after the first frame
      Future.delayed(Duration.zero, () {
        ref
            .read(chatProvider.notifier)
            .setContext(widget.detectionResult!, widget.diseaseInfo);
      });
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
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
              if (widget.detectionResult != null)
                Text(
                  "Discussing: ${widget.diseaseInfo?.getLocalizedName(context) ?? widget.detectionResult!.diseaseName}",
                style: TextStyle(
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
            icon: const Icon(Icons.delete_outline_rounded),
            tooltip: 'Clear Chat',
            onPressed: () {
              ref.invalidate(chatProvider);
              if (widget.detectionResult != null) {
                Future.delayed(Duration.zero, () {
                  ref
                      .read(chatProvider.notifier)
                      .setContext(widget.detectionResult!, widget.diseaseInfo);
                });
              }
            },
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
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.eco_rounded,
                            size: 64,
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.5),
                          ),
                          SizedBox(height: 16),
                          Text(
                            S
                                .of(context)
                                .chatbotAppBar, // Uses "AI Assistant" usually
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            S.of(context).askMeAnything,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                      .withValues(alpha: 0.7),
                                ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      reverse:
                          false, // Standard chat is usually bottom-up, but ListView defaults top-down.
                      // We want new messages at the bottom.
                      // Usually we reverse list and sort by date desc, or scroll to bottom.
                      // Simpler: Use regular ListView and scroll to bottom, or reverse and list.reversed.
                      itemCount: chatState.messages.length,
                      itemBuilder: (context, index) {
                        return ChatMessage(message: chatState.messages[index]);
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
