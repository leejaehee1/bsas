import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
// import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class TaggingWidget extends StatefulWidget {
  @override
  _TaggingWidgetState createState() => _TaggingWidgetState();
}

class _TaggingWidgetState extends State<TaggingWidget> {
  String _selectedValuesJson = 'Nothing to show';
  late final List<Language> _selectedLanguages;

  @override
  void initState() {
    super.initState();
    _selectedLanguages = [];
  }

  @override
  void dispose() {
    _selectedLanguages.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // width: MediaQuery.of(context).size.width * 5.7 / 10,
      // height: 110,
      child: Column(
        children: <Widget>[
          FlutterTagging<Language>(
            initialItems: _selectedLanguages,
            textFieldConfiguration: TextFieldConfiguration(
              decoration: InputDecoration(
                // border: InputBorder.none,
                // filled: true,
                fillColor: Colors.white,
                hintText: 'Search Tags',
                labelText: 'Select Tags',
              ),
            ),
            findSuggestions: LanguageService.getLanguages,
            additionCallback: (value) {
              return Language(
                name: value,
                position: 0,
              );
            },
            onAdded: (language) {
              // api calls here, triggered when add to tag button is pressed
              return language;
            },
            configureSuggestion: (lang) {
              return SuggestionConfiguration(
                title: Text(lang.name),
                subtitle: Text(lang.position.toString()),
                additionWidget: Chip(
                  avatar: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                    // size: 300,
                  ),
                  label: Text('Add New Tag'),
                  labelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            },
            configureChip: (lang) {
              return ChipConfiguration(
                // 태깅된거
                // padding: EdgeInsets.all(5),
                label: Text(lang.name),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white),
                deleteIconColor: Colors.white,
              );
            },
            onChanged: () {
              setState(() {
                _selectedValuesJson = _selectedLanguages
                    .map<String>((lang) => '\n${lang.toJson()}')
                    .toList()
                    .toString();
                _selectedValuesJson =
                    _selectedValuesJson.replaceFirst('}]', '}\n]');
              });
            },
          ),

          // Expanded(
          //   child: SyntaxView(
          //     code: _selectedValuesJson,
          //     syntax: Syntax.JAVASCRIPT,
          //     withLinesCount: false,
          //     syntaxTheme: SyntaxTheme.standard(),
          //   ),
          // ),
        ],
      ),
    );
  }
}

/// LanguageService
class LanguageService {
  /// Mocks fetching language from network API with delay of 500ms.
  static Future<List<Language>> getLanguages(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Language>[
      Language(name: 'JavaScript', position: 1),
      Language(name: 'Python', position: 2),
      Language(name: 'Java', position: 3),
      Language(name: 'PHP', position: 4),
      Language(name: 'C#', position: 5),
      Language(name: 'C++', position: 6),
    ]
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}

/// Language Class
class Language extends Taggable {
  ///
  final String name;

  ///
  final int position;

  /// Creates Language
  Language({
    required this.name,
    required this.position,
  });

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    "position": $position\n
  }''';
}
