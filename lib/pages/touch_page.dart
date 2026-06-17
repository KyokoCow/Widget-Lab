import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/preview_state.dart';
import '../models/widget_definition.dart';
import '../widgets/param_renderer.dart';
import '../widgets/text_field_param_renderer.dart';

class TouchPage extends StatefulWidget {
  final WidgetDefinition definition;

  const TouchPage({
    super.key,
    required this.definition,
  });

  @override
  State<TouchPage> createState() =>
      _TouchPageState();
}

class _TouchPageState
    extends State<TouchPage> {
  late Map<String, dynamic> values;
  late PreviewState previewState;

  @override
  void initState() {
    super.initState();

    values = {
      for (final p in widget.definition.touchParams)
        p.key: (p.initialValue ?? p.min ?? 0) is num
            ? (p.initialValue ?? p.min ?? 0).toDouble()
            : p.initialValue,
    };
    previewState = PreviewState();

    previewState.focusNode ??= FocusNode()
      ..addListener(() {
        setState(() {});
      });
  }

  void updateValue(
      String key,
      dynamic value,
      ) {
    setState(() {
      values[key] = value;
    });
  }


  @override
  Widget build(
      BuildContext context,
      ) {
    final size =
        MediaQuery.of(context).size;

    final isLandscape =
        size.width > size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.definition.title,
        ),
      ),
      body:
      isLandscape
          ? _buildLandscape()
          : _buildPortrait(),
    );
  }

  /* =========================
     Landscape
  ========================= */

  Widget _buildLandscape() {
    final width =
        MediaQuery.of(context)
            .size
            .width;

    return Row(
      children: [

        /// Param Area
        Container(
          width: width * 0.35,
          color:
          Colors.grey.shade100,
          child: _buildParamArea(),
        ),

        /// Preview + Code
        Expanded(
          child: Column(
            children: [
              Expanded(
                child:
                _buildPreview(),
              ),
              Expanded(
                child:
                _buildCodeArea(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /* =========================
     Portrait
  ========================= */

  Widget _buildPortrait() {
    return Column(
      children: [

        /// Preview
        Expanded(
          flex: 3,
          child: _buildPreview(),
        ),

        /// Code
        Expanded(
          flex: 2,
          child: _buildCodeArea(),
        ),

        /// Param
        Expanded(
          flex: 5,
          child: Container(
            color:
            Colors.grey.shade100,
            child:
            _buildParamArea(),
          ),
        ),
      ],
    );
  }

  /* =========================
     Preview
  ========================= */

  Widget _buildPreview() {
    final builder = widget.definition.previewBuilder;

    if (builder == null) {
      return const Center(
        child: Text('No Preview'),
      );
    }

    return builder(
      values,
      previewState,
    );
  }

  /* =========================
     Code Area
  ========================= */
  Widget _buildCodeArea() {
    final code = widget.definition.codeBuilder?.call(values);

    if (code == null) {
      return const Center(
        child: Text('Code未対応'),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: SelectableText(
                  code,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.copy, color: Colors.white),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copied!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  /* =========================
     Param Area
  ========================= */

  Widget _buildParamArea() {
    final definition = widget.definition;

    if (definition.id == 'textField') {
      return TextFieldParamRenderer(
        params: definition.touchParams,
        values: values,
        onChanged: updateValue,
      );
    }

    return ParamRenderer(
      touchParams: definition.touchParams,
      values: values,
      onChanged: updateValue,
    );
  }
}