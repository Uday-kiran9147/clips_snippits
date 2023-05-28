

// API model for videos
class VideoModel {
  String? message;
  Data? data;

  VideoModel({this.message, this.data});

  VideoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Posts>? posts;
  int? page;
  int? offset;

  Data({this.posts, this.page, this.offset});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
    page = json['page'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    data['page'] = this.page;
    data['offset'] = this.offset;
    return data;
  }
}

class Posts {
  String? postId;
  Creator? creator;
  Comment? comment;
  Reaction? reaction;
  Submission? submission;

  Posts(
      {this.postId,
      this.creator,
      this.comment,
      this.reaction,
      this.submission});

  Posts.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    comment =
        json['comment'] != null ? new Comment.fromJson(json['comment']) : null;
    reaction = json['reaction'] != null
        ? new Reaction.fromJson(json['reaction'])
        : null;
    submission = json['submission'] != null
        ? new Submission.fromJson(json['submission'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    if (this.comment != null) {
      data['comment'] = this.comment!.toJson();
    }
    if (this.reaction != null) {
      data['reaction'] = this.reaction!.toJson();
    }
    if (this.submission != null) {
      data['submission'] = this.submission!.toJson();
    }
    return data;
  }
}

class Creator {
  String? name;
  String? id;
  String? handle;
  String? pic;

  Creator({this.name, this.id, this.handle, this.pic});

  Creator.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    handle = json['handle'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['handle'] = this.handle;
    data['pic'] = this.pic;
    return data;
  }
}

class Comment {
  int? count;
  bool? commentingAllowed;

  Comment({this.count, this.commentingAllowed});

  Comment.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    commentingAllowed = json['commentingAllowed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['commentingAllowed'] = this.commentingAllowed;
    return data;
  }
}

class Reaction {
  int? count;
  bool? voted;

  Reaction({this.count, this.voted});

  Reaction.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    voted = json['voted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['voted'] = this.voted;
    return data;
  }
}

class Submission {
  String? title;
  String? description;
  String? mediaUrl;
  String? thumbnail;
  String? hyperlink;
  String? placeholderUrl;

  Submission(
      {this.title,
      this.description,
      this.mediaUrl,
      this.thumbnail,
      this.hyperlink,
      this.placeholderUrl});

  Submission.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    mediaUrl = json['mediaUrl'];
    thumbnail = json['thumbnail'];
    hyperlink = json['hyperlink'];
    placeholderUrl = json['placeholderUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['mediaUrl'] = this.mediaUrl;
    data['thumbnail'] = this.thumbnail;
    data['hyperlink'] = this.hyperlink;
    data['placeholderUrl'] = this.placeholderUrl;
    return data;
  }
}