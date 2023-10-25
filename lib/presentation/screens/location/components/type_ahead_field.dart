import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../../../components/text_widget.dart';
import '../cubit/location_cubit.dart';
import '../cubit/location_state.dart';

class SearchableField extends StatelessWidget {
  const SearchableField({
    Key? key,
    required this.title,
    // required this.suggestionsCallback,
    required this.onSuggestionSelected,
    required this.isEnabled,
    required this.controller,
    required this.itemsList,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isEnabled;
  final TextEditingController controller;
  final List itemsList;
  // final Iterable<String> Function(String) suggestionsCallback;
  final Function(String) onSuggestionSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return TypeAheadField(
          getImmediateSuggestions: false,
          keepSuggestionsOnSuggestionSelected: false,
          // hideKeyboardOnDrag: true,
          // hideSuggestionsOnKeyboardHide: false,
          direction: AxisDirection.down,
          // onSuggestionsBoxToggle: (p0) {
          //   debugPrint('statementp0: $p0');
          //   p0 = false;
          // },

          textFieldConfiguration: TextFieldConfiguration(
            enabled: isEnabled,
            controller: controller,
            onTap: onTap,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Choose Your $title',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(Icons.keyboard_arrow_down),
              label: DefaultText(
                text: isEnabled ? title : '',
                size: 18,
                weight: FontWeight.w600,
                // color: Colors.black54,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey[200]!,
                  width: 2,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey[200]!,
                  width: 2,
                ),
              ),
            ),
          ),

          suggestionsBoxDecoration: SuggestionsBoxDecoration(
            elevation: 10,
            color: Colors.white,
            constraints: const BoxConstraints(maxWidth: 250),
            offsetX: MediaQuery.of(context).size.width / 2 - 250 / 2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          itemBuilder: (context, suggestion) {
            return Center(
              child: DefaultText(
                text: suggestion.toString(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                size: 16,
                weight: FontWeight.normal,
                color: Colors.black,
                align: TextAlign.center,
              ),
            );
          },
          suggestionsCallback: (text) {
            debugPrint('statement: $text');

            List<String> items = [];
            for (var element in itemsList) {
              if (element.name.toLowerCase().contains(
                    text.toLowerCase(),
                  )) {
                items.add(element.name);
              }
            }

            return items;
          },
          noItemsFoundBuilder: (context) {
            return SizedBox(
              height: 50,
              child: Center(
                child: DefaultText(
                  text: 'No $title Found!',
                  size: 18,
                  weight: FontWeight.normal,
                  align: TextAlign.center,
                  color: Colors.grey,
                ),
              ),
            );
          },
          onSuggestionSelected: onSuggestionSelected,
        );
      },
    );
  }
}
