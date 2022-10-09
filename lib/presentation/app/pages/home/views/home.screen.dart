import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/extensions/extension.dart';
import '/business_logic/business_logic.dart';
import '/presentation/presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text(widget.title),
      ),
      body: BlocBuilder<AccountsCubit, AccountsState>(
        builder: (context, state) {
          if (state is AccountsInitial) {
            return SizedBox(
                height: MediaQuery.of(context).size.height - 250,
                child: const Center(
                  child: CircularProgressIndicator(),
                ));
          } else if (state.accountsModel != null &&
              (state.accountsModel?.length ?? 0) >= 0) {
            final data = state.accountsModel ?? [];
            return Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                            child: SearchFieldWidget(
                                onChanged: (value) {
                                  context
                                      .read<AccountsCubit>()
                                      .searchAccount(value);
                                },
                                title: 'Search')),
                        const SizedBox(
                          width: 10,
                        ),
                        DropdownWidget(
                          itemList: const ["StateCode", "StateOrProvince"],
                          onChange: (index) {
                            context
                                .read<AccountsCubit>()
                                .filterBy(index == 0 ? true : false);
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: state.isList
                              ? const Icon(Icons.grid_view)
                              : const Icon(Icons.list),
                          onPressed: () {
                            context.read<AccountsCubit>().changeView();
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: data.isEmpty
                        ? noWidgetMethod('No match found with you search key')
                        : state.isList
                            ? ListView.builder(
                                itemCount: state.accountsModel?.length ?? 0,
                                itemBuilder: (context, i) {
                                  return AccountListRowWidget(
                                      data[i], state.isList);
                                },
                              )
                            : GridView.builder(
                                itemCount: data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: (1 / 1.12)),
                                itemBuilder: (BuildContext context, int i) {
                                  return AccountListRowWidget(
                                      data[i], state.isList);
                                },
                                shrinkWrap: true,
                              ),
                  )
                ],
              ),
            );
          } else {
            return noWidgetMethod('No account data/error while fetching.');
          }
        },
      ),
    );
  }

  NoDataWidget noWidgetMethod(String text) {
    return NoDataWidget(
      image: Image.asset(
        'nodatafound'.png,
        height: 220,
      ),
      text: text,
      cross: Container(),
    );
  }
}
