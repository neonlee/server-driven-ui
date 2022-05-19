import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class Model extends JsonTextFormFieldBuilder {
  Model({
    required bool autocorrect,
    required bool autofocus,
    required TextEditingController controller,
    required double cursorWidth,
    required bool enableIMEPersonalizedLearning,
    required bool enableInteractiveSelection,
    required bool enableSuggestions,
    required bool expands,
    required String obscuringCharacter,
  }) : super(
          autocorrect: autocorrect,
          autofocus: autofocus,
          controller: controller,
          cursorWidth: cursorWidth,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          enableInteractiveSelection: enableInteractiveSelection,
          enableSuggestions: enableSuggestions,
          expands: expands,
          obscuringCharacter: obscuringCharacter,
        );

  static JsonTextFormFieldBuilder? fromDynamic(dynamic map) {
    JsonTextFormFieldBuilder? result;
    if (map != null) {
      result = JsonTextFormFieldBuilder(
        autocorrect: map['autocorrect'] ?? true,
        autofillHints: map['autofillHints'] == null
            ? null
            : List<String>.from(map['autofillHints']),
        autofocus: map['autofocus'],
        autovalidateMode: map['autovalidate'] == null
            ? map['autovalidateMode']
            : map['autovalidate'] == true
                ? AutovalidateMode.always
                : AutovalidateMode.disabled,
        buildCounter: map['buildCounter'],
        controller: TextEditingController(),
        cursorColor: map['cursorColor'],
        cursorHeight: map['cursorHeight'],
        cursorRadius: map['cursorRadius'],
        cursorWidth: map['cursorWidth'],
        decoration: map['decoration'],
        enableIMEPersonalizedLearning:
            map['enableIMEPersonalizedLearning'] ?? true,
        enableInteractiveSelection: map['enableInteractiveSelection'] ?? true,
        enableSuggestions: map['enableSuggestions'] ?? true,
        enabled: map['enabled'] ?? true,
        expands: map['expands'],
        focusNode: map['focusNode'],
        inputFormatters: map['inputFormatters'],
        keyboardAppearance: map['keyboardBrightness'],
        keyboardType: map['keyboardType'],
        maxLength: map['maxLength'],
        maxLengthEnforcement: map['maxLengthEnforcement'],
        maxLines: map['maxLines'],
        minLines: map['minLines'],
        obscureText: map['obscureText'],
        obscuringCharacter: map['obscuringCharacter'] ?? '•',
        onChanged: map['onChanged'],
        onEditingComplete: map['onEditingComplete'],
        onFieldSubmitted: map['onFieldSubmitted'],
        onSaved: map['onSaved'],
        onTap: map['onTap'],
        readOnly: map['readOnly'],
        restorationId: map['restorationId'],
        scrollPadding: map['scrollPadding'] ?? const EdgeInsets.all(20.0),
        scrollPhysics: map['scrollPhysics'],
        selectionControls: map['selectionControls'],
        showCursor: map['showCursor'],
        smartDashesType: map['smartDashesType'],
        smartQuotesType: map['smartQuotesType'],
        strutStyle: map['strutStyle'],
        style: map['style'],
        textAlign: map['textAlign'] ?? TextAlign.start,
        textAlignVertical: map['textAlignVertical'],
        textCapitalization:
            map['textCapitalization'] ?? TextCapitalization.none,
        textDirection: map['textDirection'],
        textInputAction: map['textInputAction'],
        toolbarOptions: map['toolbarOptions'],
        validator: map['validators'],
      );
    }

    return result;
  }
}
