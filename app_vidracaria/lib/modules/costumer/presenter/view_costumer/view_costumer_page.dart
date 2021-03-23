import 'package:app_vidracaria/modules/costumer/domain/entities/Costumer.dart';
import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ViewCostumerPage extends StatefulWidget {
  final Costumer costumer;

  ViewCostumerPage({this.costumer});

  @override
  _ViewCostumerPageState createState() =>
      _ViewCostumerPageState(costumer: costumer);
}

class _ViewCostumerPageState extends State<ViewCostumerPage> {
  final Costumer costumer;

  _ViewCostumerPageState({this.costumer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: DrawerWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF2376ba),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                return Modular.to.popAndPushNamed('/dashboard/costumers');
              },
            ),
            title: Padding(
              padding: EdgeInsets.only(left: 0, top: 20),
              child: Text(
                'Detalhes - ' + costumer.name,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
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
            child: SliverFillRemaining(
              child: _buildContentPage(),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/dashboard/costumers/add', arguments: costumer);
        },
        child: Icon(
          Icons.edit,
          size: 35,
        ),
        elevation: 10,
        focusColor: Colors.yellowAccent,
        backgroundColor: Colors.yellow[700],
      ),
    );
  }

  Widget _buildContentPage() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Card(
        elevation: 10,
        child: Column(
          children: [_buildDetailsCostumerCard(), _buildBudgetsList()],
        ),
      ),
    );
  }

  Widget _buildDetailsCostumerCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Nome: ' + costumer.name,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Telefone: ' + costumer.phone,
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Email: ' + costumer.email,
                style: TextStyle(fontSize: 18, color: Colors.black)),
          ),
          Container(
            child: Expanded(
              child: Divider(
                endIndent: 20,
                indent: 0,
                thickness: 12,
                color: Colors.grey[300],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text('Orçamentos: ',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetsList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      width: MediaQuery.of(context).size.width * 0.9,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Orçamento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.verified_user, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: ConcluÃ­do',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'Relatórios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.yellow[800],
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Orçamento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.timer, color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: Em Andamento',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'Relatórios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 50,
                      color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Orçamento New Glass',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(Icons.remove_circle_outline,
                                color: Colors.white)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Status: Cancelado',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: Colors.yellow[800],
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.restore_from_trash,
                            color: Colors.red,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.zero,
                      child: Container(
                        child: Expanded(
                          child: Divider(
                            endIndent: 0,
                            indent: 0,
                            thickness: 12,
                            color: Colors.grey[100],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 20, top: 10),
                          child: Text(
                            'Relatórios:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Card(
                                color: Colors.green,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Cliente')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.yellow[900],
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Ferragens')
                            ],
                          ),
                          Column(
                            children: [
                              Card(
                                color: Colors.blue,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(
                                    Icons.sd_card,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text('Materiais')
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
