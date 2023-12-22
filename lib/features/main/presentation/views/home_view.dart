import 'package:edu_platform/assets/colors/colors.dart';
import 'package:edu_platform/features/common/pagination/presentation/paginator.dart';
import 'package:edu_platform/features/common/widgets/w_scale.dart';
import 'package:edu_platform/features/main/presentation/controllers/bloc/home_bloc.dart';
import 'package:edu_platform/features/main/presentation/views/live_page.dart';
import 'package:edu_platform/features/main/presentation/widgets/event_iteam.dart';
import 'package:edu_platform/features/main/presentation/widgets/select_data_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:edu_platform/features/main/presentation/controllers/controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 76,
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => WScaleAnimation(
                onTap: () {
                  changePage(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 28),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44),
                    border: Border.all(color: select == index ? green : whiteGrey),
                    color: select == index ? green : white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    list[index],
                    style: TextStyle(color: select == index ? white : null),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    Builder(builder: (context) {
                      if (state.eventsUpcoming.isNotEmpty) {
                        return Paginator(
                          padding: const EdgeInsets.all(16),
                          paginatorStatus: state.statusUpcoming,
                          itemBuilder: (context, index) => EventIteam(
                            onTap: () => jumpToLivePage(
                              context,
                              liveID: state.eventsUpcoming[index].id.toString(),
                              isHost: true,
                            ),
                          ),
                          itemCount: state.eventsUpcoming.length,
                          fetchMoreFunction: () {},
                          hasMoreToFetch: false,
                          errorWidget: SelectDataIteam(),
                        );
                      } else {
                        return SelectDataIteam();
                      }
                    }),
                    Builder(builder: (context) {
                      if (state.eventsLive.isNotEmpty) {
                        return Paginator(
                          padding: const EdgeInsets.all(16),
                          paginatorStatus: state.statusLive,
                          itemBuilder: (context, index) => EventIteam(
                            onTap: () => jumpToLivePage(
                              context,
                              liveID: state.eventsUpcoming[index].id.toString(),
                              isHost: true,
                            ),
                          ),
                          itemCount: state.eventsLive.length,
                          fetchMoreFunction: () {},
                          hasMoreToFetch: false,
                          errorWidget: SelectDataIteam(),
                        );
                      } else {
                        return SelectDataIteam();
                      }
                    }),
                    Builder(builder: (context) {
                      if (state.eventsNeed.isNotEmpty) {
                        return Paginator(
                          padding: const EdgeInsets.all(16),
                          paginatorStatus: state.statusNeed,
                          itemBuilder: (context, index) => EventIteam(
                            onTap: () => jumpToLivePage(
                              context,
                              liveID: state.eventsUpcoming[index].id.toString(),
                              isHost: true,
                            ),
                          ),
                          itemCount: state.eventsNeed.length,
                          fetchMoreFunction: () {},
                          hasMoreToFetch: false,
                          errorWidget: SelectDataIteam(),
                        );
                      } else {
                        return SelectDataIteam();
                      }
                    }),
                    Builder(builder: (context) {
                      if (state.eventsCompleted.isNotEmpty) {
                        return Paginator(
                          padding: const EdgeInsets.all(16),
                          paginatorStatus: state.statusCompleted,
                          itemBuilder: (context, index) => EventIteam(
                            onTap: () => jumpToLivePage(
                              context,
                              liveID: state.eventsUpcoming[index].id.toString(),
                              isHost: true,
                            ),
                          ),
                          itemCount: state.eventsCompleted.length,
                          fetchMoreFunction: () {},
                          hasMoreToFetch: false,
                          errorWidget: SelectDataIteam(),
                        );
                      } else {
                        return SelectDataIteam();
                      }
                    }),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
