
import 'package:geese_relief/constraints.dart';
import 'package:hive/hive.dart';

part 'search_suggestion.g.dart';

@HiveType(typeId: TABLE_SEARCH_SUGGESTION)
class SearchSuggestion {
  @HiveField(0)
  int type;
  @HiveField(1)
  String keyword;
  @HiveField(2)
  bool isNew;

  SearchSuggestion(this.type, this.keyword, this.isNew);
}