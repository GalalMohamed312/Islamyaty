
class AzkarModel{
String? category;
  String? count;
  String? description;
  String? reference;
  String? zekr;


  AzkarModel ({this.category, this.count, this.description, this.reference,this.zekr});

  //To insert the data in the bd, we need to convert it into a Map

  Map<String, dynamic> toMap() => {
   "category":category,
  "count":count,
   "description":description,
   "reference":reference,
  "zekr":zekr,
      };

  //to receive the data we need to pass it from Map to json
  //para recibir los datos necesitamos pasarlo de Map a json
  factory AzkarModel.fromMap(Map<String, dynamic> json) => AzkarModel(
    category:json["category"],
    count:json["count"],
    description:json["description"],
    reference:json["reference"],
    zekr:json["zekr"],
  );
}