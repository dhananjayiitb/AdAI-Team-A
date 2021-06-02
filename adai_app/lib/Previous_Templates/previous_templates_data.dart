class PreviousTemplate{
  String posterDetails;
  String price;
  String posterName;
  String posterLocation;
  PreviousTemplate(this.posterDetails,this.price,this.posterName,this.posterLocation);
}

List<PreviousTemplate> getPreviousTemplates(){
  List<PreviousTemplate> temporaryList = [];
  temporaryList.add(PreviousTemplate("Random poster 1", "Rs 85", "End Detention and Deportation", 'assets/images/poster8.png'));
  temporaryList.add(PreviousTemplate("Random poster 2", "Rs 55", "Classic Black Light Poster", 'assets/images/poster9.jpg'));
  temporaryList.add(PreviousTemplate("Random poster 3", "Rs 200", "Motivational Poster", 'assets/images/poster10.jpeg'));
  temporaryList.add(PreviousTemplate("Random poster 4", "Rs 170", "Modern Art", 'assets/images/poster11.jpg'));
  return temporaryList;
}