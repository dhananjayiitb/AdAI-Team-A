class Template{
  String posterDetails;
  String price;
  String posterName;
  String posterLocation;
  Template(this.posterDetails,this.price,this.posterName,this.posterLocation);
}

// List<Template> getTemplates(){
//   List<Template> temporaryList = [];
//   temporaryList.add(Template("Random poster 1", "Rs 100", "Protect Our Community", 'assets/images/poster1.jpg'));
//   temporaryList.add(Template("Random poster 2", "Rs 150", "I am the one who knocks", 'assets/images/poster2.jpg'));
//   temporaryList.add(Template("Random poster 3", "Rs 100", "Music Festival", 'assets/images/poster3.jpg'));
//   temporaryList.add(Template("Random poster 4", "Rs 50", "Protect Kids not Guns", 'assets/images/poster4.jpg'));
//   temporaryList.add(Template("Random poster 5", "Rs 70", "Covid-19", 'assets/images/poster5.jpg'));
//   temporaryList.add(Template("Random poster 6", "Rs 95", "Mental Health Awareness", 'assets/images/poster6.jpg'));
//   temporaryList.add(Template("Random poster 7", "Rs 69", "Festival", 'assets/images/poster7.jpg'));
//   temporaryList.add(Template("Random poster 8", "Rs 85", "End Detention and Deportation", 'assets/images/poster8.png'));
//   temporaryList.add(Template("Random poster 9", "Rs 55", "Classic Black Light Poster", 'assets/images/poster9.jpg'));
//   temporaryList.add(Template("Random poster 10", "Rs 200", "Motivational Poster", 'assets/images/poster10.jpeg'));
//   temporaryList.add(Template("Random poster 11", "Rs 170", "Modern Art", 'assets/images/poster11.jpg'));
//   return temporaryList;
// }