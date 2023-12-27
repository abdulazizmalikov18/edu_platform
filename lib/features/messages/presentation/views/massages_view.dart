import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/assets/themes/theme.dart';
import 'package:edu_platform/features/common/pagination/presentation/paginator.dart';
import 'package:edu_platform/features/common/widgets/w_textfield.dart';
import 'package:edu_platform/features/messages/presentation/controllers/bloc/chat_bloc.dart';
import 'package:edu_platform/features/tutors/domain/entity/favorite_tutor_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key, required this.chatIteam});
  final TutorsEntity chatIteam;

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> {
  TextEditingController controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.bg), fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: false,
            title: Row(
              children: [
                const CircleAvatar(backgroundImage: AssetImage(AppImages.user)),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${widget.chatIteam.firstname} ${widget.chatIteam.lastname}"),
                    Text(
                      widget.chatIteam.isOnline ? 'Online' : 'Offline',
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: widget.chatIteam.isOnline ? green : red),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              PopupMenuButton(
                elevation: 0,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.share_outlined),
                        SizedBox(width: 16),
                        Text('Share'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 16),
                        Text('Favorite'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state.statusMessage.isSubmissionInProgress) {
                return const Center(child: CircularProgressIndicator(color: green));
              } else {
                return Paginator(
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    final message = state.messagesList[index];
                    if (message.fromUser.id != widget.chatIteam.id) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          constraints: BoxConstraints(maxWidth: size.width * .5),
                          decoration: wdecoration,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message.message,
                                style: AppTheme.bodyLarge.copyWith(color: dark),
                              ),
                              Text(
                                DateFormat('dd-MMM-yyyy, HH:mm')
                                    .format(DateTime.parse(message.createdAt).toLocal()),
                                style: AppTheme.labelLarge.copyWith(color: dark),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        constraints: BoxConstraints(maxWidth: size.width * .5),
                        decoration: wdecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.message,
                              style: AppTheme.bodyLarge,
                            ),
                            Text(
                              DateFormat('dd-MMM-yyyy, HH:mm')
                                  .format(DateTime.parse(message.createdAt).toLocal()),
                              style: AppTheme.labelLarge.copyWith(color: dark),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                  itemCount: state.messagesList.length,
                  paginatorStatus: FormzStatus.pure,
                  fetchMoreFunction: () {},
                  hasMoreToFetch: false,
                  controller: _scrollController,
                );
              }
            },
          ),
          bottomNavigationBar: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              return Container(
                padding:
                    EdgeInsets.fromLTRB(16, 16, 16, MediaQuery.of(context).viewInsets.bottom + 16),
                color: white,
                child: WTextField(
                  onChanged: (value) {},
                  onEditCompleted: () {
                    context.read<ChatBloc>().add(CreateMessageEvent(
                          id: widget.chatIteam.id,
                          message: controller.text,
                          onSucces: () {
                            controller.clear();
                            _scrollController.animateTo(
                              _scrollController.position.maxScrollExtent + 32,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ));
                  },
                  controller: controller,
                  hintText: 'Type something...',
                  suffixIcon: IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().add(CreateMessageEvent(
                            id: widget.chatIteam.id,
                            message: controller.text,
                            onSucces: () {
                              controller.clear();
                              _scrollController.animateTo(
                                _scrollController.position.maxScrollExtent + 32,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ));
                    },
                    icon: state.statusMessageCreate.isSubmissionInProgress
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.send_rounded),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
