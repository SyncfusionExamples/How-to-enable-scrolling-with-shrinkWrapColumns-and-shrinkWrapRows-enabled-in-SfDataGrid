# How to enable Horizontal and Vertical scrolling with shrinkWrapColumns and shrinkWrapRows enabled in Flutter DataTable (SfDataGrid)?.

In this article, we will show you how to enable Horizontal and Vertical scrolling with shrinkWrapColumns and shrinkWrapRows enabled in [Flutter DataTable](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all necessary properties. When [shrinkWrapColumns](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid/shrinkWrapColumns.html) and [shrinkWrapRows](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid/shrinkWrapRows.html) are enabled, the DataGrid sets its maximum width and height based on the available columns and rows, causing all columns and rows to be laid out. To enable scrolling, wrap the DataGrid in a [SingleChildScrollView](https://api.flutter.dev/flutter/widgets/SingleChildScrollView-class.html) and set the respective [scrollDirection](https://api.flutter.dev/flutter/widgets/SingleChildScrollView/scrollDirection.html). Additionally, add a [ScrollConfiguration](https://api.flutter.dev/flutter/widgets/ScrollConfiguration-class.html) widget as the parent and set the [ScrollConfiguration.behavior](https://api.flutter.dev/flutter/widgets/ScrollConfiguration/behavior.html) property to ensure the scrollbar remains in view.

```dart
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

….

  final verticalController = ScrollController(),
      horizontalController = ScrollController();

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
              columns: getColumns,
            ),
          ),
        ),
      ),
    );
  }
}
```

You can download this example in [GitHub](https://github.com/SyncfusionExamples/How-to-enable-scrolling-with-shrinkWrapColumns-and-shrinkWrapRows-enabled-in-SfDataGrid).