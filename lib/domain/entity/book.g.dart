// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$$_BookFromJson(Map<String, dynamic> json) => _$_Book(
      title: json['title'] as String?,
      isbn: json['isbn'] as String?,
      titleKana: json['titleKana'] as String?,
      subTitle: json['subTitle'] as String?,
      subTitleKana: json['subTitleKana'] as String?,
      seriesName: json['seriesName'] as String?,
      seriesNameKana: json['seriesNameKana'] as String?,
      contents: json['contents'] as String?,
      contentsKana: json['contentsKana'] as String?,
      author: json['author'] as String?,
      authorKana: json['authorKana'] as String?,
      publisherName: json['publisherName'] as String?,
      size: json['size'] as String?,
      itemCaption: json['itemCaption'] as String?,
      salesDate: json['salesDate'] as String?,
      itemPrice: json['itemPrice'] as int?,
      itemUrl: json['itemUrl'] as String?,
      affiliateUrl: json['affiliateUrl'] as String?,
      smallImageUrl: json['smallImageUrl'] as String?,
      mediumImageUrl: json['mediumImageUrl'] as String?,
      largeImageUrl: json['largeImageUrl'] as String?,
      chirayomiUrl: json['chirayomiUrl'] as String?,
      availability: json['availability'] as String?,
      postageFlag: json['postageFlag'] as int?,
      limitedFlag: json['limitedFlag'] as int?,
      reviewCount: json['reviewCount'] as int?,
      reviewAverage: json['reviewAverage'] as String?,
      booksGenreId: json['booksGenreId'] as String?,
      registeredDateTime: json['registeredDateTime'] == null
          ? null
          : DateTime.parse(json['registeredDateTime'] as String),
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => DateTime.parse(e as String))
          .toList(),
    );

Map<String, dynamic> _$$_BookToJson(_$_Book instance) => <String, dynamic>{
      'title': instance.title,
      'isbn': instance.isbn,
      'titleKana': instance.titleKana,
      'subTitle': instance.subTitle,
      'subTitleKana': instance.subTitleKana,
      'seriesName': instance.seriesName,
      'seriesNameKana': instance.seriesNameKana,
      'contents': instance.contents,
      'contentsKana': instance.contentsKana,
      'author': instance.author,
      'authorKana': instance.authorKana,
      'publisherName': instance.publisherName,
      'size': instance.size,
      'itemCaption': instance.itemCaption,
      'salesDate': instance.salesDate,
      'itemPrice': instance.itemPrice,
      'itemUrl': instance.itemUrl,
      'affiliateUrl': instance.affiliateUrl,
      'smallImageUrl': instance.smallImageUrl,
      'mediumImageUrl': instance.mediumImageUrl,
      'largeImageUrl': instance.largeImageUrl,
      'chirayomiUrl': instance.chirayomiUrl,
      'availability': instance.availability,
      'postageFlag': instance.postageFlag,
      'limitedFlag': instance.limitedFlag,
      'reviewCount': instance.reviewCount,
      'reviewAverage': instance.reviewAverage,
      'booksGenreId': instance.booksGenreId,
      'registeredDateTime': instance.registeredDateTime?.toIso8601String(),
      'history': instance.history?.map((e) => e.toIso8601String()).toList(),
    };
