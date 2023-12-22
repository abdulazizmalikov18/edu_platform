import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/assets/constants/images.dart';
import 'package:edu_platform/features/messages/presentation/controllers/bloc/chat_bloc.dart';
import 'package:edu_platform/features/messages/presentation/views/massages_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MessagesMainView extends StatefulWidget {
  const MessagesMainView({super.key});

  @override
  State<MessagesMainView> createState() => _MessagesMainViewState();
}

class _MessagesMainViewState extends State<MessagesMainView> {
  @override
  void initState() {
    context.read<ChatBloc>().add(GetChat());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status.isSubmissionSuccess) {
            return ListView.builder(
              itemCount: state.chatList.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MessagesView(chatIteam: state.chatList[index]),
                  ));
                },
                tileColor: white,
                shape: Border(
                  bottom:
                      index == 5 ? const BorderSide(width: 1, color: dividerGrey) : BorderSide.none,
                  top: const BorderSide(width: 1, color: dividerGrey),
                ),
                leading: Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(48),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.user),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: state.chatList[index].isOnline ? green : red,
                      border: Border.all(color: white, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                title: Text(
                  "${state.chatList[index].firstname} ${state.chatList[index].lastname}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: Text(
                  'My name is Darren. I live in Normandy in France with my beatiful wife but',
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Row(
                    //   children: [Text('9:16 PM')],
                    // ),
                    Text(
                      '9:16 PM',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: inputGrey),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: red,
                      ),
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(color: white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
