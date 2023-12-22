part of 'package:edu_platform/features/main/presentation/views/home_view.dart';

mixin HomeMixin on State<HomeView> {
  List<String> list = ['Upcoming', 'Live', 'Need schedule', 'Complated'];
  PageController controller = PageController(initialPage: 0);
  int select = 0;

  @override
  void initState() {
    context.read<HomeBloc>().add(GetEventsUpcoming());
    super.initState();
  }

  jumpToLivePage(BuildContext context, {required String liveID, required bool isHost}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VideoConferencePage(conferenceID: "video_conference_id_234"),
      ),
    );
  }

  changePage(int index) {
    setState(() {
      select = index;
      controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
      );
    });
    switch (index) {
      case 0:
        context.read<HomeBloc>().add(GetEventsUpcoming());
        break;
      case 1:
        context.read<HomeBloc>().add(GetEventsLive());
        break;
      case 2:
        context.read<HomeBloc>().add(GetEventsNeed());
        break;
      case 3:
        context.read<HomeBloc>().add(GetEventsCompleted());
        break;
    }
  }
}
