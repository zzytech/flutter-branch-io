part of flutter_branch_sdk;

/*
 * Class represents a single piece of content within your app, as well as any associated metadata.
 * It provides convenient methods for sharing, deep linking, and tracking how often that content is viewed. This information is then used to provide you with powerful content analytics
 * and deep linking.
 */

class BranchUniversalObject {
  /* Canonical identifier for the content referred. */
  String canonicalIdentifier;

  /* Canonical url for the content referred. This would be the corresponding website URL */
  String canonicalUrl;

  /* Title for the content referred by BranchUniversalObject */
  String title;

  /* Description for the content referred */
  String contentDescription;

  /* An image url associated with the content referred */
  String imageUrl;

  /* Meta data provided for the content. {@link ContentMetadata} object holds the metadata for this content */
  BranchContentMetaData contentMetadata;

  /* Content index mode */
  bool publiclyIndex;

  /* Any keyword associated with the content. Used for indexing */
  List<dynamic> keywords;

  /* Expiry date for the content and any associated links. Represented as epoch milli second */
  int expirationDateInMilliSec = 0;

  /* Index mode for  local content indexing */
  bool locallyIndex;
  int _creationDateTimeStamp = DateTime.now().millisecondsSinceEpoch;

  ///Create a BranchUniversalObject with the given content.
  BranchUniversalObject(
      {@required this.canonicalIdentifier,
      this.canonicalUrl,
      this.title,
      this.contentDescription,
      this.imageUrl,
      this.contentMetadata,
      this.keywords,
      this.publiclyIndex,
      this.locallyIndex,
      this.expirationDateInMilliSec});

  ///Adds any keywords associated with the content referred
  void addKeyWords(List<dynamic> keywords) {
    if (keywords == null) return;
    if (this.keywords == null) this.keywords = [];
    this.keywords.addAll(keywords);
  }

  ///Add a keyword associated with the content referred
  void addKeyWord(String keyword) {
    if (keyword == null) return;
    if (this.keywords == null) this.keywords = [];
    this.keywords.add(keyword);
  }

  ///Remove a keyword associated with the content referred
  void removeKeyWord(String keyword) {
    if (this.keywords == null) return;
    this.keywords.remove(keyword);
  }

  ///Get the keywords associated with this BranchUniversalObject
  List<dynamic> getKeywords() {
    if (this.keywords == null) return [];
    return this.keywords;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> ret = <String, dynamic>{};
    if (this.canonicalIdentifier != null && this.canonicalIdentifier.isNotEmpty)
      ret["canonicalIdentifier"] = this.canonicalIdentifier;
    if (this.canonicalUrl != null && this.canonicalUrl.isNotEmpty)
      ret["canonicalUrl"] = this.canonicalUrl;
    if (this.title != null && this.title.isNotEmpty) ret["title"] = this.title;
    if (this.contentDescription != null && this.contentDescription.isNotEmpty)
      ret["contentDescription"] = this.contentDescription;
    if (this.imageUrl != null && this.imageUrl.isNotEmpty)
      ret["imageUrl"] = this.imageUrl;
    if (this.keywords != null && this.keywords.isNotEmpty)
      ret["keywords"] = this.keywords;
    if (this._creationDateTimeStamp != null)
      ret["creationDate"] = this._creationDateTimeStamp;
    if (this.expirationDateInMilliSec != null)
      ret["expirationDate"] = this.expirationDateInMilliSec;
    if (this.locallyIndex != null) ret["locallyIndex"] = this.locallyIndex;
    if (this.publiclyIndex != null) ret["publiclyIndex"] = this.publiclyIndex;
    if (this.contentMetadata != null && this.contentMetadata.toMap().isNotEmpty)
      ret["contentMetadata"] = this.contentMetadata.toMap();
    if (ret.isEmpty) {
      throw ArgumentError('Branch Universal Object is required');
    }
    return ret;
  }
}
