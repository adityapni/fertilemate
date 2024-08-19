class PostsModel {
  List<Post>? post;
  String? message;
  String? status;

  PostsModel({this.post, this.message, this.status});

  PostsModel.fromJson(Map<String, dynamic> json) {
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post!.add(Post.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (post != null) {
      data['post'] = post!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Post {
  String? postId;
  String? postName;
  String? postDescription;
  String? postImage;
  String? postVideo;
  String? postAudio;
  String? postType;
  String? postSubCategory;
  String? postUserId;
  String? postAdminId;

  Post(
      {this.postId,
      this.postName,
      this.postDescription,
      this.postImage,
      this.postVideo,
      this.postAudio,
      this.postType,
      this.postSubCategory,
      this.postUserId,
      this.postAdminId});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postName = json['post_name'];
    postDescription = json['post_description'];
    postImage = json['post_image'];
    postVideo = json['post_video'];
    postAudio = json['post_audio'];
    postType = json['post_type'];
    postSubCategory = json['post_sub_category'];
    postUserId = json['post_user_id'];
    postAdminId = json['post_admin_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['post_name'] = postName;
    data['post_description'] = postDescription;
    data['post_image'] = postImage;
    data['post_video'] = postVideo;
    data['post_audio'] = postAudio;
    data['post_type'] = postType;
    data['post_sub_category'] = postSubCategory;
    data['post_user_id'] = postUserId;
    data['post_admin_id'] = postAdminId;
    return data;
  }
}
