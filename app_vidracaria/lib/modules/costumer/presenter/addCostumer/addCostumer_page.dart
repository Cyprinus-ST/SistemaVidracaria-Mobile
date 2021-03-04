import 'package:app_vidracaria/modules/util/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddCostumerPage extends StatefulWidget {
  @override
  _AddCostumerPageState createState() => _AddCostumerPageState();
}

class _AddCostumerPageState extends State<AddCostumerPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  String client;

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
            title: Text(
              'Adicionar Cliente',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: _buildFormFields(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Colors.red[300],
                    onPressed: () {},
                    child: Container(
                      child: Text("Cancelar",style: TextStyle(fontSize: 16),),
                    ),
                  ),
                  RaisedButton(
                    color: Colors.green[300],
                    onPressed: () {},
                    child: Container(
                      child: Text("Adicionar", style: TextStyle(fontSize: 16),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
