import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/data.dart';
import '/business_logic/business_logic.dart';

import '/presentation/presentation.dart';

class SuccessStateWidget extends StatelessWidget {
  const SuccessStateWidget(this.state, this.data, {super.key});
  final AccountsState state;
  final List<AccountData> data;

  @override
  Widget build(BuildContext context) {
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
                          context.read<AccountsCubit>().searchAccount(value);
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
                ? const NoWidgetMethod('No match found with you search key')
                : state.isList
                    ? ListView.builder(
                        itemCount: state.accountsModel?.length ?? 0,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(data[i])));
                            },
                            child: AccountListRowWidget(data[i], state.isList),
                          );
                        },
                      )
                    : GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: (1 / 1.12)),
                        itemBuilder: (BuildContext context, int i) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DetailScreen(data[i])));
                            },
                            child: AccountListRowWidget(data[i], state.isList),
                          );
                        },
                        shrinkWrap: true,
                      ),
          )
        ],
      ),
    );
  }
}
