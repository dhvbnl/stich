// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTopCollection on Isar {
  IsarCollection<Top> get tops => this.collection();
}

const TopSchema = CollectionSchema(
  name: r'Top',
  id: 2642652117895004451,
  properties: {
    r'imageUrl': PropertySchema(
      id: 0,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'material': PropertySchema(
      id: 1,
      name: r'material',
      type: IsarType.byte,
      enumMap: _TopmaterialEnumValueMap,
    ),
    r'primaryColor': PropertySchema(
      id: 2,
      name: r'primaryColor',
      type: IsarType.byte,
      enumMap: _TopprimaryColorEnumValueMap,
    ),
    r'secondaryColor': PropertySchema(
      id: 3,
      name: r'secondaryColor',
      type: IsarType.byte,
      enumMap: _TopsecondaryColorEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ToptypeEnumValueMap,
    )
  },
  estimateSize: _topEstimateSize,
  serialize: _topSerialize,
  deserialize: _topDeserialize,
  deserializeProp: _topDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _topGetId,
  getLinks: _topGetLinks,
  attach: _topAttach,
  version: '3.1.8',
);

int _topEstimateSize(
  Top object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageUrl.length * 3;
  return bytesCount;
}

void _topSerialize(
  Top object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.imageUrl);
  writer.writeByte(offsets[1], object.material.index);
  writer.writeByte(offsets[2], object.primaryColor.index);
  writer.writeByte(offsets[3], object.secondaryColor.index);
  writer.writeByte(offsets[4], object.type.index);
}

Top _topDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Top(
    imageUrl: reader.readStringOrNull(offsets[0]) ?? '',
    material: _TopmaterialValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        ClothingMaterial.cotton,
    primaryColor:
        _TopprimaryColorValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            ClothingColor.red,
    secondaryColor:
        _TopsecondaryColorValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            ClothingColor.red,
    type: _ToptypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        TopType.tshirt,
  );
  object.id = id;
  return object;
}

P _topDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (_TopmaterialValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingMaterial.cotton) as P;
    case 2:
      return (_TopprimaryColorValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 3:
      return (_TopsecondaryColorValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 4:
      return (_ToptypeValueEnumMap[reader.readByteOrNull(offset)] ??
          TopType.tshirt) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _TopmaterialEnumValueMap = {
  'cotton': 0,
  'polyester': 1,
  'wool': 2,
  'silk': 3,
  'linen': 4,
  'denim': 5,
  'leather': 6,
  'rayon': 7,
  'spandex': 8,
  'suede': 9,
  'velvet': 10,
  'canvas': 11,
  'fleece': 12,
  'unknown': 13,
};
const _TopmaterialValueEnumMap = {
  0: ClothingMaterial.cotton,
  1: ClothingMaterial.polyester,
  2: ClothingMaterial.wool,
  3: ClothingMaterial.silk,
  4: ClothingMaterial.linen,
  5: ClothingMaterial.denim,
  6: ClothingMaterial.leather,
  7: ClothingMaterial.rayon,
  8: ClothingMaterial.spandex,
  9: ClothingMaterial.suede,
  10: ClothingMaterial.velvet,
  11: ClothingMaterial.canvas,
  12: ClothingMaterial.fleece,
  13: ClothingMaterial.unknown,
};
const _TopprimaryColorEnumValueMap = {
  'red': 0,
  'green': 1,
  'lightBlue': 2,
  'navyBlue': 3,
  'yellow': 4,
  'black': 5,
  'white': 6,
  'gray': 7,
  'brown': 8,
  'purple': 9,
  'orange': 10,
  'pink': 11,
  'cyan': 12,
  'magenta': 13,
  'beige': 14,
  'none': 15,
};
const _TopprimaryColorValueEnumMap = {
  0: ClothingColor.red,
  1: ClothingColor.green,
  2: ClothingColor.lightBlue,
  3: ClothingColor.navyBlue,
  4: ClothingColor.yellow,
  5: ClothingColor.black,
  6: ClothingColor.white,
  7: ClothingColor.gray,
  8: ClothingColor.brown,
  9: ClothingColor.purple,
  10: ClothingColor.orange,
  11: ClothingColor.pink,
  12: ClothingColor.cyan,
  13: ClothingColor.magenta,
  14: ClothingColor.beige,
  15: ClothingColor.none,
};
const _TopsecondaryColorEnumValueMap = {
  'red': 0,
  'green': 1,
  'lightBlue': 2,
  'navyBlue': 3,
  'yellow': 4,
  'black': 5,
  'white': 6,
  'gray': 7,
  'brown': 8,
  'purple': 9,
  'orange': 10,
  'pink': 11,
  'cyan': 12,
  'magenta': 13,
  'beige': 14,
  'none': 15,
};
const _TopsecondaryColorValueEnumMap = {
  0: ClothingColor.red,
  1: ClothingColor.green,
  2: ClothingColor.lightBlue,
  3: ClothingColor.navyBlue,
  4: ClothingColor.yellow,
  5: ClothingColor.black,
  6: ClothingColor.white,
  7: ClothingColor.gray,
  8: ClothingColor.brown,
  9: ClothingColor.purple,
  10: ClothingColor.orange,
  11: ClothingColor.pink,
  12: ClothingColor.cyan,
  13: ClothingColor.magenta,
  14: ClothingColor.beige,
  15: ClothingColor.none,
};
const _ToptypeEnumValueMap = {
  'tshirt': 0,
  'polo': 1,
  'shirt': 2,
  'jacket': 3,
  'sweater': 4,
  'tankTop': 5,
  'longSleeve': 6,
  'sweatshirt': 7,
  'buttonDown': 8,
  'unknown': 9,
};
const _ToptypeValueEnumMap = {
  0: TopType.tshirt,
  1: TopType.polo,
  2: TopType.shirt,
  3: TopType.jacket,
  4: TopType.sweater,
  5: TopType.tankTop,
  6: TopType.longSleeve,
  7: TopType.sweatshirt,
  8: TopType.buttonDown,
  9: TopType.unknown,
};

Id _topGetId(Top object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _topGetLinks(Top object) {
  return [];
}

void _topAttach(IsarCollection<dynamic> col, Id id, Top object) {
  object.id = id;
}

extension TopQueryWhereSort on QueryBuilder<Top, Top, QWhere> {
  QueryBuilder<Top, Top, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TopQueryWhere on QueryBuilder<Top, Top, QWhereClause> {
  QueryBuilder<Top, Top, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Top, Top, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Top, Top, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Top, Top, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TopQueryFilter on QueryBuilder<Top, Top, QFilterCondition> {
  QueryBuilder<Top, Top, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> materialEqualTo(
      ClothingMaterial value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> materialGreaterThan(
    ClothingMaterial value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> materialLessThan(
    ClothingMaterial value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> materialBetween(
    ClothingMaterial lower,
    ClothingMaterial upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'material',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> primaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> primaryColorGreaterThan(
    ClothingColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> primaryColorLessThan(
    ClothingColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> primaryColorBetween(
    ClothingColor lower,
    ClothingColor upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'primaryColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> secondaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> secondaryColorGreaterThan(
    ClothingColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'secondaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> secondaryColorLessThan(
    ClothingColor value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'secondaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> secondaryColorBetween(
    ClothingColor lower,
    ClothingColor upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'secondaryColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> typeEqualTo(TopType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> typeGreaterThan(
    TopType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> typeLessThan(
    TopType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Top, Top, QAfterFilterCondition> typeBetween(
    TopType lower,
    TopType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TopQueryObject on QueryBuilder<Top, Top, QFilterCondition> {}

extension TopQueryLinks on QueryBuilder<Top, Top, QFilterCondition> {}

extension TopQuerySortBy on QueryBuilder<Top, Top, QSortBy> {
  QueryBuilder<Top, Top, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TopQuerySortThenBy on QueryBuilder<Top, Top, QSortThenBy> {
  QueryBuilder<Top, Top, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Top, Top, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension TopQueryWhereDistinct on QueryBuilder<Top, Top, QDistinct> {
  QueryBuilder<Top, Top, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Top, Top, QDistinct> distinctByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'material');
    });
  }

  QueryBuilder<Top, Top, QDistinct> distinctByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryColor');
    });
  }

  QueryBuilder<Top, Top, QDistinct> distinctBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondaryColor');
    });
  }

  QueryBuilder<Top, Top, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension TopQueryProperty on QueryBuilder<Top, Top, QQueryProperty> {
  QueryBuilder<Top, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Top, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Top, ClothingMaterial, QQueryOperations> materialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'material');
    });
  }

  QueryBuilder<Top, ClothingColor, QQueryOperations> primaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryColor');
    });
  }

  QueryBuilder<Top, ClothingColor, QQueryOperations> secondaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondaryColor');
    });
  }

  QueryBuilder<Top, TopType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
