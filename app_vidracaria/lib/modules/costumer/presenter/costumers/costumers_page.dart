import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/costumer/presenter/costumers/costumers_controller.dart';
import 'package:app_vidracaria/modules/costumer/presenter/costumers/states/state.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:app_vidracaria/modules/util/widget/loading_widget.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CostumersPage extends StatefulWidget {
  @override
  _CostumersPageState createState() => _CostumersPageState();
}

class _CostumersPageState
    extends ModularState<CostumersPage, CostumersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 10,
            pinned: true,
            backgroundColor: Color(0xFF2376ba),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                return Modular.to.popAndPushNamed('/dashboard');
              },
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Text(
                'Clientes',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
          ),
          SliverGroupBuilder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SliverFillRemaining(child: Observer(
              builder: (_) {
                var state = controller.state;

                if (state is CostumersError) {
                  return _messageFlushBar();
                }

                if (state is CostumersStart) {
                  controller.doListCostumers();
                } else if (state is CostumersLoading) {
                  return LoadingWidget();
                } else if (state is CostumersSuccess) {
                  return _buildBudgetsList(state.costumers);
                } else {
                  return Center(
                    child: Text("Falhou tudo meu caro kkkk"),
                  );
                }
              },
            )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/dashboard/costumers/add');
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        elevation: 10,

        focusColor: Colors.white,
        backgroundColor: Color(0xFF2376ba),
      ),
    );
  }

  Widget _buildBudgetsList(List<Costumer> costumersList) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView.builder(
        itemCount: costumersList.length,
        itemBuilder: (context, index) {
          return _buildCard(costumersList[index]);
        },
      ),
    );
  }

  Widget _buildCard(Costumer costumer) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 5,
        color: Colors.grey[50],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ExpansionTile(
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.red,
              size: 30,
            ),
            onPressed: () {
              print("TESTADAAAA");
            },
          ),
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(top: 0),
            height: 50,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    costumer.name,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[750]),
                  ),
                ],
              ),
            ),
          ),
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Container(
                      child: Expanded(
                        child: Divider(
                          endIndent: 0,
                          indent: 0,
                          thickness: 12,
                          color: Colors.lightBlue[50],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top:20),
                          child: Text(
                            'Email: '+costumer.email,
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 20),
                        child: Text(
                          'Telefone: '+costumer.phone,
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageFlushBar() {
    return Container(
      height: 100,
      child: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        title: 'This action is prohibited',
        message: 'Lorem ipsum dolor sit amet',
        icon: Icon(
          Icons.info_outline,
          size: 28,
          color: Colors.blue.shade300,
        ),
        leftBarIndicatorColor: Colors.blue.shade300,
        duration: Duration(seconds: 3),
      )..show(context),
    );
  }
}
