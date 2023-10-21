import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maxway/src/core/routes/routes_name.dart';
import 'package:maxway/src/core/widgets/global_button.dart';
import 'package:maxway/src/injecter_container.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../../core/widgets/text_items.dart';
import '../../../bloc/order_create/order_bloc.dart';
import 'deliver_tab/deliver_tab.dart';
import 'pick_up/pick_up_tab.dart';

class OrderCreatePage extends StatefulWidget {
  const OrderCreatePage({super.key});

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends State<OrderCreatePage> {
  late Completer<YandexMapController> mapController =
  Completer<YandexMapController>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OrderBloc>()..add(BranchsEvent())..add(CurrentLocationEvent()),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: 70,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: CustomText.items(
                text: 'Оформить заказ', size: 20, color: Colors.black),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white60,
              tabs: [
                Tab(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                        child: CustomText.items(
                            text: 'Доставка', size: 15, color: Colors.black)),
                  ),
                ),
                Tab(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                        child: CustomText.items(
                            text: 'Самовывоз', size: 15, color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              DeliverTab(),
              PickupTab(),
            ],
          ),
          bottomNavigationBar: /*SafeArea(
            child: GlobalButton(
                text: 'Заказать', onPressed: (){}),
          )*/
          SafeArea(
            minimum: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 16 + MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: SizedBox(
              height: 52,
                child: GlobalButton(
                  text: 'Заказать',
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.ordersPage);
                  },
                ),
            )
          ),
        ),
      ),
    );
  }
}
