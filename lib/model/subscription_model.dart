class SubscriptionModel {
  int? id;
  String? title1;
  String? title2;
  String? subtitle;
  SubscriptionModel({this.id, this.title1, this.title2, this.subtitle});
}

//Subscription list
List<SubscriptionModel>? subscriptionList = [
  SubscriptionModel(
    id: 0,
    title1: "USD \$10/month",
    title2:"USD \$250  66% off",
    subtitle:"12 months USD \$23", 
  ),
  SubscriptionModel(
    id: 1,
    title1: "USD \$8/month",
    title2:"USD \$122  66% off",
    subtitle:"12 months USD \$23", 
  ),
  SubscriptionModel(
    id: 2,
    title1: "USD \$5/month",
    title2:"USD \$90  66% off",
    subtitle:"12 months USD \$23", 
  ),
  
];