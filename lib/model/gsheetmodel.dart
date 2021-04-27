class MarkerModel {
  String marker_names;
  // ignore: non_constant_identifier_names
  String marker_ids;
  double x_cord;
  double y_cord;

  MarkerModel({
    this.marker_names,
    this.marker_ids,
    this.x_cord,
    this.y_cord,
  });
  factory MarkerModel.fromJson(dynamic json) {
    return MarkerModel(
      marker_names: "${json['marker_name']}",
      marker_ids: "${json['marker_id']}",
      x_cord: json['x'],
      y_cord: json['y'],
    );
  }
  Map toJson() => {
        "marker_name": marker_names,
        "marker_id": marker_ids,
        "x": x_cord,
        "y": y_cord
      };
}
