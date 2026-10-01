part of '../app.dart';

class ConversationScreen extends StatefulWidget {
  const ConversationScreen({super.key});
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  final controller = TextEditingController();
  final messages = <Map<String, String>>[
    {
      'sender': 'Jules Martin',
      'body': 'Hey Maya! How is the functions lesson landing?',
      'time': '11:42 AM',
    },
    {
      'sender': 'Maya Chen',
      'body':
          'The idea is clear, but I keep reaching for global variables in my examples.',
      'time': '11:44 AM',
    },
    {
      'sender': 'Jules Martin',
      'body':
          'That is a useful signal. Try passing the value into the function instead. Small boundary, much easier to test.',
      'time': '11:47 AM',
    },
    {
      'sender': 'Maya Chen',
      'body':
          'That helped. I can see the inputs and outputs much more clearly now.',
      'time': '11:51 AM',
    },
  ];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                tooltip: 'Back to messages',
                icon: const Icon(Icons.arrow_back_rounded),
                onPressed: () =>
                    Navigator.of(context).pushReplacementNamed('/app/messages'),
              ),
              const SizedBox(width: 5),
              const CircleAvatar(
                radius: 21,
                backgroundColor: AppColors.coralSoft,
                child: Text(
                  'JM',
                  style: TextStyle(
                    color: AppColors.coral,
                    fontWeight: FontWeight.w800,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jules Martin',
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Mentor · active now',
                    style: TextStyle(
                      color: AppColors.teal,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                tooltip: 'Conversation options',
                icon: const Icon(Icons.more_horiz_rounded),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          SectionCard(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 520,
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(22),
                      children: [
                        const Center(
                          child: StatusPill(
                            'TODAY',
                            color: AppColors.inkMuted,
                            background: AppColors.canvas,
                          ),
                        ),
                        const SizedBox(height: 18),
                        ...messages.map((message) {
                          final mine = message['sender'] == 'Maya Chen';
                          return Align(
                            alignment: mine
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 14),
                              child: ConstrainedBox(
                                constraints:
                                    const BoxConstraints(maxWidth: 520),
                                child: Column(
                                  crossAxisAlignment: mine
                                      ? CrossAxisAlignment.end
                                      : CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: mine
                                            ? AppColors.teal
                                            : AppColors.canvas,
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(15),
                                          topRight: const Radius.circular(15),
                                          bottomLeft: Radius.circular(
                                            mine ? 15 : 4,
                                          ),
                                          bottomRight: Radius.circular(
                                            mine ? 4 : 15,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        message['body']!,
                                        style: TextStyle(
                                          color: mine
                                              ? Colors.white
                                              : AppColors.ink,
                                          fontSize: 13,
                                          height: 1.4,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${message['sender']} · ${message['time']}',
                                      style: const TextStyle(
                                        color: AppColors.inkMuted,
                                        fontSize: 9,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: AppColors.line)),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          tooltip: 'Add attachment',
                          icon: const Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.inkMuted,
                          ),
                          onPressed: () => _notice(
                            context,
                            'Attachments are available when secure media upload is enabled.',
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: 'Write a message…',
                              fillColor: AppColors.canvas,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Send message',
                          icon: const Icon(
                            Icons.send_rounded,
                            color: AppColors.teal,
                          ),
                          onPressed: () {
                            if (controller.text.trim().isNotEmpty) {
                              setState(() {
                                messages.add({
                                  'sender': 'Maya Chen',
                                  'body': controller.text.trim(),
                                  'time': 'Now',
                                });
                                controller.clear();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
