extension AssetsUtils on String {
  String get svgAsset => 'assets/svgs/$this.svg';
  String get pngAsset => 'assets/images/$this.png';
  String get webpAsset => 'assets/images/$this.webp';
  String get gifAsset => 'assets/gifs/$this.gif';
}
