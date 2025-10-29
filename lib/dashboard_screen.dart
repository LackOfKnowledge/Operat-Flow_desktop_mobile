import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:operat_flow/theme.dart';
import 'package:resizable_widget/resizable_widget.dart';

import 'package:operat_flow/widgets/dashboard/dashboard_app_bar.dart';
import 'package:operat_flow/widgets/dashboard/project_list_column.dart';
import 'package:operat_flow/widgets/dashboard/document_list_column.dart';
import 'package:operat_flow/widgets/dashboard/workspace_area_column.dart';
import 'package:operat_flow/providers/dashboard_providers.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: ResizableWidget(
        percentages: const [0.25, 0.35, 0.4],
        isDisabledSmartHide: true,
        separatorSize: 4.0,
        separatorColor: borderColor,
        children: const [
          ProjectListColumn(),
          DocumentListColumn(),
          WorkspaceAreaColumn(),
        ],
      ),
    );
  }
}