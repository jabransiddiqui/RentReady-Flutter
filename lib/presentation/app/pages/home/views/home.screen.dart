import 'package:flutter/material.dart';
import 'package:taskapp/presentation/presentation.dart';
import 'package:taskapp/presentation/widgets/dropdown/dropwndown.widget.dart';

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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: 60,
              child: Row(
                children: [
                  const Expanded(
                      child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownWidget(
                    itemList: const ["StateCode", "StateOrProvince"],
                    onChange: (index) {
                      print(index);
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
                    child: const Icon(Icons.grid_view),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(
              children: const [
                AccountListRowWidget(),
                AccountListRowWidget(),
                AccountListRowWidget()
              ],
            ))
          ],
        ),
      ),
    );
  }
}
