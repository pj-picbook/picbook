/// TODO:#58のタスク→削除する。freezedで作り直す
class BookDummy {
  final String id,
      titile,
      titleKana,
      subTitle,
      subTitleKana,
      author,
      authorKana,
      isbn,
      itemCaption,
      itemPrice,
      itemUrl,
      largeImageUrl,
      mediumImageUrl,
      smallImageUrl,
      publisherName,
      salesDate,
      size;

  BookDummy({
    required this.id,
    required this.titile,
    required this.titleKana,
    required this.subTitle,
    required this.subTitleKana,
    required this.author,
    required this.authorKana,
    required this.isbn,
    required this.itemCaption,
    required this.itemPrice,
    required this.itemUrl,
    required this.largeImageUrl,
    required this.mediumImageUrl,
    required this.smallImageUrl,
    required this.publisherName,
    required this.salesDate,
    required this.size,
  });
}

BookDummy dummyBook = BookDummy(
  id: '1',
  titile: 'ハリー・ポッターと賢者の石',
  titleKana: 'たいとる',
  subTitle: 'サブタイトル',
  subTitleKana: 'さぶたいとる',
  author: 'J．K．ローリング/ミナリマ',
  authorKana: 'ちょしゃ',
  isbn: '9784863895669',
  itemCaption:
      'ハリー・ポッターは、これまで魔法とは無縁だった。ダーズリー一家という情けない連中と一緒に、プリベット通り４番地に住み、階段下の物置で暮らしている。生まれてから１１年間、一度だって誕生日を祝ってもらったことなどない。ところが、なんと、ふくろうが不思議な手紙を運んできた。「ホグワーツ魔法魔術学校」という、信じられないようなところへの招待状だ。学校でハリーが出会ったのは、友達、箒に乗って飛ぶスポーツ、そして授業から食事まで、なにもかもが魔法づくし。ただし、それだけではなかった。ハリーを待ち受けていた重い運命…それも、最初の対決に生き残ることができればのことだが。フルカラーの華麗なイラストと、読者が遊べる奇抜な紙細工の仕掛け。受賞歴に輝くミナリマ・スタジオの手になるハリー・ポッターシリーズ、その第１作は、あらゆる年齢の読者を魅了し、愛蔵される一冊になることまちがいなし！',
  itemPrice: '4950',
  itemUrl: 'https://books.rakuten.co.jp/rb/16410126/',
  largeImageUrl:
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5669/9784863895669.jpg?_ex=200x200',
  mediumImageUrl:
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5669/9784863895669.jpg?_ex=120x120',
  smallImageUrl:
      'https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5669/9784863895669.jpg?_ex=64x64',
  publisherName: '静山社',
  salesDate: '2020年10月20日頃',
  size: 'サイズ',
);
