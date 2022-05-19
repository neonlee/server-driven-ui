import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
//import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:serverdriven/model.dart';
import 'package:serverdriven/text_form_field_custom.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var register = JsonWidgetRegistry.instance;
  var model = Model.fromDynamic(textFormFieldCustomizado);
  @override
  void initState() {
    super.initState();
    //aqui eu posso criar widgets personalizados para serem renderizados no json e insiro eles na lib
    register.registerCustomBuilders({
      'dale_no_custom': JsonWidgetBuilderContainer(
        builder: (map, {registry}) => model,
      )
    });
    //todas as funções seram registradas aqui dentro e deve vir esse nome no json, os args são as passagens de argumentos, e o registry vem da lib
    register.registerFunctions({
      'simplePrintMessage': ({args, required registry}) => () {
            var message = 'This is a simple print message';
            if (args?.isEmpty == false) {
              for (var arg in args!) {
                message += ' $arg';
              }
            }
            print(args);
            print(message);
            navigatorKey.currentState?.pushNamed('/newPage');
          },
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const DynamicText(),
        '/newPage': (context) => const Dynamic2(),
      },
      title: 'Simple Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class DynamicText extends StatefulWidget {
  const DynamicText({Key? key}) : super(key: key);

  @override
  _DynamicTextState createState() => _DynamicTextState();
}

class _DynamicTextState extends State<DynamicText> {
  //aqui eu chamo o json
  var teste = JsonWidgetData.fromDynamic(json1);

  @override
  Widget build(BuildContext context) {
    //aqui eu crio o build
    return teste!.build(context: context);
  }
}

class Dynamic2 extends StatefulWidget {
  const Dynamic2({Key? key}) : super(key: key);

  @override
  State<Dynamic2> createState() => _Dynamic2State();
}

class _Dynamic2State extends State<Dynamic2> {
  var teste = JsonWidgetData.fromDynamic(json2);
  @override
  Widget build(BuildContext context) {
    return teste!.build(context: context);
  }
}

var json2 = {
  "type": "scaffold",
  "args": {
    "appBar": {
      "type": "app_bar",
      "args": {
        "title": {
          "type": "text",
          "args": {"text": "Form"}
        }
      }
    },
    "body": {
      "type": "column",
      "children": [
        {
          "type": "text",
          "args": {
            "text": "Comentário para avaliação 2",
            "style": {
              "color": "#000",
              "fontSize": 18,
              "fontWeight": "bold",
            },
          }
        },
        {
          "type": "text_button",
          "args": {
            "onPressed": "\${simplePrintMessage(1)}",
          },
          "child": {
            "type": "text",
            "args": {"text": "ElevatedButton3"}
          }
        },
      ]
    }
  }
};
var json1 = {
  "type": "scaffold",
  "args": {
    "appBar": {
      "type": "app_bar",
      "args": {
        "title": {
          "type": "text",
          "args": {"text": "Form"}
        }
      }
    },
    "body": {
      "type": "column",
      "children": [
        {
          "type": "text",
          "args": {
            "text": "Comentário para avaliação",
            "style": {
              "color": "#000",
              "fontSize": 18,
              "fontWeight": "bold",
            },
          }
        },
        {
          "type": "text_button",
          "args": {
            "onPressed": "\${simplePrintMessage(1)}",
          },
          "child": {
            "type": "text",
            "args": {"text": "ElevatedButton"}
          }
        },
        {
          "type": "dale_no_custom",
          "args": {
            'autocorrect': false,
            'autofocus': false,
            'controller': TextEditingController(),
            'cursorWidth': 1.0,
            'enableIMEPersonalizedLearning': false,
            'enableInteractiveSelection': false,
            'enableSuggestions': false,
            'expands': false,
            'obscuringCharacter': '0',
          }
        },
      ]
    }
  }
};
