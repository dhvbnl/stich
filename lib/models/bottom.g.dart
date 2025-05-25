// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBottomCollection on Isar {
  IsarCollection<Bottom> get bottoms => this.collection();
}

const BottomSchema = CollectionSchema(
  name: r'Bottom',
  id: -7268876641226642873,
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
      enumMap: _BottommaterialEnumValueMap,
    ),
    r'primaryColor': PropertySchema(
      id: 2,
      name: r'primaryColor',
      type: IsarType.byte,
      enumMap: _BottomprimaryColorEnumValueMap,
    ),
    r'secondaryColor': PropertySchema(
      id: 3,
      name: r'secondaryColor',
      type: IsarType.byte,
      enumMap: _BottomsecondaryColorEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.byte,
      enumMap: _BottomtypeEnumValueMap,
    )
  },
  estimateSize: _bottomEstimateSize,
  serialize: _bottomSerialize,
  deserialize: _bottomDeserialize,
  deserializeProp: _bottomDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _bottomGetId,
  getLinks: _bottomGetLinks,
  attach: _bottomAttach,
  version: '3.1.8',
);

int _bottomEstimateSize(
  Bottom object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageUrl.length * 3;
  return bytesCount;
}

void _bottomSerialize(
  Bottom object,
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

Bottom _bottomDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Bottom(
    imageUrl: reader.readStringOrNull(offsets[0]) ?? '',
    material: _BottommaterialValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        ClothingMaterial.cotton,
    primaryColor:
        _BottomprimaryColorValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            ClothingColor.red,
    secondaryColor:
        _BottomsecondaryColorValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            ClothingColor.red,
    type: _BottomtypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        BottomType.jeans,
  );
  object.id = id;
  return object;
}

P _bottomDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (_BottommaterialValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingMaterial.cotton) as P;
    case 2:
      return (_BottomprimaryColorValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 3:
      return (_BottomsecondaryColorValueEnumMap[
              reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 4:
      return (_BottomtypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BottomType.jeans) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BottommaterialEnumValueMap = {
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
const _BottommaterialValueEnumMap = {
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
const _BottomprimaryColorEnumValueMap = {
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
const _BottomprimaryColorValueEnumMap = {
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
const _BottomsecondaryColorEnumValueMap = {
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
const _BottomsecondaryColorValueEnumMap = {
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
const _BottomtypeEnumValueMap = {
  'jeans': 0,
  'shorts': 1,
  'skirt': 2,
  'trousers': 3,
  'leggings': 4,
  'sweatpants': 5,
  'cargo': 6,
  'chinos': 7,
  'cordoroy': 8,
  'unknown': 9,
};
const _BottomtypeValueEnumMap = {
  0: BottomType.jeans,
  1: BottomType.shorts,
  2: BottomType.skirt,
  3: BottomType.trousers,
  4: BottomType.leggings,
  5: BottomType.sweatpants,
  6: BottomType.cargo,
  7: BottomType.chinos,
  8: BottomType.cordoroy,
  9: BottomType.unknown,
};

Id _bottomGetId(Bottom object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bottomGetLinks(Bottom object) {
  return [];
}

void _bottomAttach(IsarCollection<dynamic> col, Id id, Bottom object) {
  object.id = id;
}

extension BottomQueryWhereSort on QueryBuilder<Bottom, Bottom, QWhere> {
  QueryBuilder<Bottom, Bottom, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BottomQueryWhere on QueryBuilder<Bottom, Bottom, QWhereClause> {
  QueryBuilder<Bottom, Bottom, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Bottom, Bottom, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterWhereClause> idBetween(
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

extension BottomQueryFilter on QueryBuilder<Bottom, Bottom, QFilterCondition> {
  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlEqualTo(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlGreaterThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlLessThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlBetween(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlStartsWith(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlEndsWith(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> materialEqualTo(
      ClothingMaterial value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> materialGreaterThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> materialLessThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> materialBetween(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> primaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> primaryColorGreaterThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> primaryColorLessThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> primaryColorBetween(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> secondaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> secondaryColorGreaterThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> secondaryColorLessThan(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> secondaryColorBetween(
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> typeEqualTo(
      BottomType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> typeGreaterThan(
    BottomType value, {
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> typeLessThan(
    BottomType value, {
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

  QueryBuilder<Bottom, Bottom, QAfterFilterCondition> typeBetween(
    BottomType lower,
    BottomType upper, {
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

extension BottomQueryObject on QueryBuilder<Bottom, Bottom, QFilterCondition> {}

extension BottomQueryLinks on QueryBuilder<Bottom, Bottom, QFilterCondition> {}

extension BottomQuerySortBy on QueryBuilder<Bottom, Bottom, QSortBy> {
  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BottomQuerySortThenBy on QueryBuilder<Bottom, Bottom, QSortThenBy> {
  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Bottom, Bottom, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension BottomQueryWhereDistinct on QueryBuilder<Bottom, Bottom, QDistinct> {
  QueryBuilder<Bottom, Bottom, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Bottom, Bottom, QDistinct> distinctByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'material');
    });
  }

  QueryBuilder<Bottom, Bottom, QDistinct> distinctByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryColor');
    });
  }

  QueryBuilder<Bottom, Bottom, QDistinct> distinctBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondaryColor');
    });
  }

  QueryBuilder<Bottom, Bottom, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension BottomQueryProperty on QueryBuilder<Bottom, Bottom, QQueryProperty> {
  QueryBuilder<Bottom, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Bottom, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Bottom, ClothingMaterial, QQueryOperations> materialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'material');
    });
  }

  QueryBuilder<Bottom, ClothingColor, QQueryOperations> primaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryColor');
    });
  }

  QueryBuilder<Bottom, ClothingColor, QQueryOperations>
      secondaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondaryColor');
    });
  }

  QueryBuilder<Bottom, BottomType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
