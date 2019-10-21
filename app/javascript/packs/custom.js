window.getNewAnimalInNeedOfSponsorship = function(){
  $.ajax({
    url: "/animals/animal_in_need_of_sponsorship.js",
    method: 'GET'
  });
}
