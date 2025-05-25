// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoes.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetShoesCollection on Isar {
  IsarCollection<Shoes> get shoes => this.collection();
}

const ShoesSchema = CollectionSchema(
  name: r'Shoes',
  id: -2111287095969077006,
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
      enumMap: _ShoesmaterialEnumValueMap,
    ),
    r'primaryColor': PropertySchema(
      id: 2,
      name: r'primaryColor',
      type: IsarType.byte,
      enumMap: _ShoesprimaryColorEnumValueMap,
    ),
    r'secondaryColor': PropertySchema(
      id: 3,
      name: r'secondaryColor',
      type: IsarType.byte,
      enumMap: _ShoessecondaryColorEnumValueMap,
    ),
    r'type': PropertySchema(
      id: 4,
      name: r'type',
      type: IsarType.byte,
      enumMap: _ShoestypeEnumValueMap,
    )
  },
  estimateSize: _shoesEstimateSize,
  serialize: _shoesSerialize,
  deserialize: _shoesDeserialize,
  deserializeProp: _shoesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _shoesGetId,
  getLinks: _shoesGetLinks,
  attach: _shoesAttach,
  version: '3.1.8',
);

int _shoesEstimateSize(
  Shoes object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imageUrl.length * 3;
  return bytesCount;
}

void _shoesSerialize(
  Shoes object,
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

Shoes _shoesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Shoes(
    imageUrl: reader.readStringOrNull(offsets[0]) ?? '',
    material: _ShoesmaterialValueEnumMap[reader.readByteOrNull(offsets[1])] ??
        ClothingMaterial.cotton,
    primaryColor:
        _ShoesprimaryColorValueEnumMap[reader.readByteOrNull(offsets[2])] ??
            ClothingColor.red,
    secondaryColor:
        _ShoessecondaryColorValueEnumMap[reader.readByteOrNull(offsets[3])] ??
            ClothingColor.red,
    type: _ShoestypeValueEnumMap[reader.readByteOrNull(offsets[4])] ??
        ShoesType.sneakers,
  );
  object.id = id;
  return object;
}

P _shoesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 1:
      return (_ShoesmaterialValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingMaterial.cotton) as P;
    case 2:
      return (_ShoesprimaryColorValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 3:
      return (_ShoessecondaryColorValueEnumMap[reader.readByteOrNull(offset)] ??
          ClothingColor.red) as P;
    case 4:
      return (_ShoestypeValueEnumMap[reader.readByteOrNull(offset)] ??
          ShoesType.sneakers) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ShoesmaterialEnumValueMap = {
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
const _ShoesmaterialValueEnumMap = {
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
const _ShoesprimaryColorEnumValueMap = {
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
const _ShoesprimaryColorValueEnumMap = {
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
const _ShoessecondaryColorEnumValueMap = {
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
const _ShoessecondaryColorValueEnumMap = {
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
const _ShoestypeEnumValueMap = {
  'sneakers': 0,
  'sandals': 1,
  'boots': 2,
  'loafers': 3,
  'heels': 4,
  'flats': 5,
  'slippers': 6,
  'unknown': 7,
};
const _ShoestypeValueEnumMap = {
  0: ShoesType.sneakers,
  1: ShoesType.sandals,
  2: ShoesType.boots,
  3: ShoesType.loafers,
  4: ShoesType.heels,
  5: ShoesType.flats,
  6: ShoesType.slippers,
  7: ShoesType.unknown,
};

Id _shoesGetId(Shoes object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _shoesGetLinks(Shoes object) {
  return [];
}

void _shoesAttach(IsarCollection<dynamic> col, Id id, Shoes object) {
  object.id = id;
}

extension ShoesQueryWhereSort on QueryBuilder<Shoes, Shoes, QWhere> {
  QueryBuilder<Shoes, Shoes, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ShoesQueryWhere on QueryBuilder<Shoes, Shoes, QWhereClause> {
  QueryBuilder<Shoes, Shoes, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Shoes, Shoes, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterWhereClause> idBetween(
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

extension ShoesQueryFilter on QueryBuilder<Shoes, Shoes, QFilterCondition> {
  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlEqualTo(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlGreaterThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlLessThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlBetween(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlStartsWith(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlEndsWith(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlContains(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlMatches(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> materialEqualTo(
      ClothingMaterial value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> materialGreaterThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> materialLessThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> materialBetween(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> primaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'primaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> primaryColorGreaterThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> primaryColorLessThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> primaryColorBetween(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> secondaryColorEqualTo(
      ClothingColor value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'secondaryColor',
        value: value,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> secondaryColorGreaterThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> secondaryColorLessThan(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> secondaryColorBetween(
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> typeEqualTo(
      ShoesType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
      ));
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> typeGreaterThan(
    ShoesType value, {
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> typeLessThan(
    ShoesType value, {
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

  QueryBuilder<Shoes, Shoes, QAfterFilterCondition> typeBetween(
    ShoesType lower,
    ShoesType upper, {
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

extension ShoesQueryObject on QueryBuilder<Shoes, Shoes, QFilterCondition> {}

extension ShoesQueryLinks on QueryBuilder<Shoes, Shoes, QFilterCondition> {}

extension ShoesQuerySortBy on QueryBuilder<Shoes, Shoes, QSortBy> {
  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ShoesQuerySortThenBy on QueryBuilder<Shoes, Shoes, QSortThenBy> {
  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByPrimaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'primaryColor', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenBySecondaryColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'secondaryColor', Sort.desc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Shoes, Shoes, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension ShoesQueryWhereDistinct on QueryBuilder<Shoes, Shoes, QDistinct> {
  QueryBuilder<Shoes, Shoes, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Shoes, Shoes, QDistinct> distinctByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'material');
    });
  }

  QueryBuilder<Shoes, Shoes, QDistinct> distinctByPrimaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'primaryColor');
    });
  }

  QueryBuilder<Shoes, Shoes, QDistinct> distinctBySecondaryColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'secondaryColor');
    });
  }

  QueryBuilder<Shoes, Shoes, QDistinct> distinctByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type');
    });
  }
}

extension ShoesQueryProperty on QueryBuilder<Shoes, Shoes, QQueryProperty> {
  QueryBuilder<Shoes, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Shoes, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Shoes, ClothingMaterial, QQueryOperations> materialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'material');
    });
  }

  QueryBuilder<Shoes, ClothingColor, QQueryOperations> primaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'primaryColor');
    });
  }

  QueryBuilder<Shoes, ClothingColor, QQueryOperations>
      secondaryColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'secondaryColor');
    });
  }

  QueryBuilder<Shoes, ShoesType, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}
