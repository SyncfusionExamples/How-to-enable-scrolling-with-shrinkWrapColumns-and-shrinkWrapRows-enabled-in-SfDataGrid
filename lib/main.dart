import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class MyMaterialScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return Scrollbar(
      controller: details.controller,
      child: child,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  late EmployeeDataSource employeeDataSource;
  List<Employee> employees = <Employee>[];
  final verticalController = ScrollController(),
      horizontalController = ScrollController();

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: ScrollConfiguration(
        behavior: MyMaterialScrollBehavior(),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: horizontalController,
          child: SingleChildScrollView(
            controller: verticalController,
            scrollDirection: Axis.vertical,
            child: SfDataGrid(
              source: employeeDataSource,
              shrinkWrapColumns: true,
              shrinkWrapRows: true,
              columns: <GridColumn>[
                GridColumn(
                  columnName: 'ID',
                  label: Container(
                    padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: const Text('ID'),
                  ),
                ),
                GridColumn(
                  columnName: 'Name',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Name'),
                  ),
                ),
                GridColumn(
                  columnName: 'Designation',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Designation'),
                  ),
                ),
                GridColumn(
                  columnName: 'Salary',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Salary'),
                  ),
                ),
                GridColumn(
                  columnName: 'Country',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Country'),
                  ),
                ),
                GridColumn(
                  columnName: 'Nation',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Nation'),
                  ),
                ),
                GridColumn(
                  columnName: 'State',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('State'),
                  ),
                ),
                GridColumn(
                  columnName: 'District',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('District'),
                  ),
                ),
                GridColumn(
                  columnName: 'Town',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Town'),
                  ),
                ),
                GridColumn(
                  columnName: 'NetworkID',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('NetworkID'),
                  ),
                ),
                GridColumn(
                  columnName: 'Manager',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Manager'),
                  ),
                ),
                GridColumn(
                  columnName: 'TeamSize',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('TeamSize'),
                  ),
                ),
                GridColumn(
                  columnName: 'Department',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Department'),
                  ),
                ),
                GridColumn(
                  columnName: 'Project',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Project'),
                  ),
                ),
                GridColumn(
                  width: 160,
                  columnName: 'Email',
                  label: Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.center,
                    child: const Text('Email'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> firstNames = [
    'John',
    'Alice',
    'David',
    'Emma',
    'Michael',
    'Olivia',
    'Sophia',
    'Daniel',
    'Sophie',
    'Benjamin',
  ];

  List<String> positions = [
    'Manager',
    'Engineer',
    'Sales ',
    'Designer',
    'Accountant',
    'Technician',
    'Analyst',
    'Supervisor',
    'Assistant',
    'Developer',
  ];

  List<String> countries = [
    'United States',
    'Canada',
    'UK',
    'Australia',
    'Germany',
    'France',
    'Spain',
    'Japan',
    'India',
    'Brazil',
  ];

  List<String> nations = [
    'American',
    'Canadian',
    'British',
    'Australian',
    'German',
    'French',
    'Spanish',
    'Japanese',
    'Indian',
    'Brazilian',
  ];

  List<String> states = [
    'California',
    'New York',
    'Texas',
    'Florida',
    'Ontario',
    'London',
    'Queensland',
    'Bavaria',
    'Paris',
    'Madrid',
  ];

  List<String> districts = [
    'Los Angeles',
    'NewYork',
    'Houston',
    'Miami',
    'Toronto',
    'London',
    'Brisbane',
    'Munich',
    'Paris',
    'Madrid',
  ];

  List<String> towns = [
    'Beverly',
    'Manhattan',
    'Austin',
    'Miami Beach',
    'Toronto',
    'Westminster',
    'South',
    'Munich',
    'Champs',
    'SolSquare',
  ];

  List<String> networkIDs = [
    'NET-001',
    'NET-002',
    'NET-003',
    'NET-004',
    'NET-005',
    'NET-006',
    'NET-007',
    'NET-008',
    'NET-009',
    'NET-010',
  ];

  List<String> managers = [
    'Alice',
    'Bob',
    'Carol',
    'David',
    'Emma',
    'Frank',
    'Grace',
    'Henry',
    'Ivy',
    'Jack'
  ];

  List<int> teamSizes = [5, 8, 6, 7, 4, 9, 5, 6, 7, 8];

  List<String> departments = [
    'HR',
    'Engineering',
    'Sales',
    'Design',
    'Finance',
    'IT',
    'R&D',
    'Support',
    'Marketing',
    'Operations'
  ];

  List<String> projects = [
    'Project A',
    'Project B',
    'Project C',
    'Project D',
    'Project E',
    'Project F',
    'Project G',
    'Project H',
    'Project I',
    'Project J'
  ];

  List<String> emails = [
    'john@example.com',
    'alice@example.com',
    'david@example.com',
    'emma@example.com',
    'michael@example.com',
    'olivia@example.com',
    'sophia@example.com',
    'daniel@example.com',
    'sophie@example.com',
    'benjamin@example.com'
  ];

  List<String> generateRandomData(int count) {
    Random random = Random();
    List<String> data = [];
    for (int i = 0; i < count; i++) {
      data.add(random.nextInt(100).toString());
    }
    return data;
  }

  // Modify your getEmployeeData function
  List<Employee> getEmployeeData() {
    List<Employee> emp = [];
    Random random = Random();

    for (int i = 1; i <= 20; i++) {
      String fullName = firstNames[random.nextInt(firstNames.length)];

      String position = positions[random.nextInt(positions.length)];

      emp.add(Employee(
        i,
        fullName,
        position,
        (i * 1000),
        countries[i % 10],
        nations[i % 10],
        states[i % 10],
        districts[i % 10],
        towns[i % 10],
        networkIDs[i % 10],
        managers[i % 10],
        teamSizes[i % 10],
        departments[i % 10],
        projects[i % 10],
        emails[i % 10],
      ));
    }
    return emp;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the employee which will be rendered in datagrid.
class Employee {
  /// Creates the employee class with required details.
  Employee(
    this.id,
    this.name,
    this.designation,
    this.salary,
    this.country,
    this.nation,
    this.state,
    this.district,
    this.town,
    this.networkID,
    this.manager,
    this.teamSize,
    this.department,
    this.project,
    this.email,
  );

  int id;

  String name;

  String designation;

  int salary;

  String country;

  String nation;

  String state;

  String district;

  String town;

  String networkID;

  String manager;

  int teamSize;

  String department;

  String project;

  final String email;
}

/// An object to set the employee collection data source to the datagrid. This
/// is used to map the employee data to the datagrid widget.
class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Employee> employeeData}) {
    buildDataGridSource(employeeData);
  }

  void buildDataGridSource(List<Employee> employees) {
    _employeeData = employees
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'ID', value: e.id),
              DataGridCell<String>(columnName: 'Name', value: e.name),
              DataGridCell<String>(
                  columnName: 'Designation', value: e.designation),
              DataGridCell<int>(columnName: 'Salary', value: e.salary),
              DataGridCell<String>(columnName: 'Country', value: e.country),
              DataGridCell<String>(columnName: 'Nation', value: e.nation),
              DataGridCell<String>(columnName: 'State', value: e.state),
              DataGridCell<String>(columnName: 'District', value: e.district),
              DataGridCell<String>(columnName: 'Town', value: e.town),
              DataGridCell<String>(columnName: 'NetworkID', value: e.networkID),
              DataGridCell<String>(columnName: 'Manager', value: e.manager),
              DataGridCell<int>(columnName: 'TeamSize', value: e.teamSize),
              DataGridCell<String>(
                  columnName: 'Department', value: e.department),
              DataGridCell<String>(columnName: 'Project', value: e.project),
              DataGridCell<String>(columnName: 'Email', value: e.email),
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}
