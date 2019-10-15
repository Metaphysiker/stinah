class SaveTheChickenController < ApplicationController

  def welcome
    set_meta_tags title: 'Rettet das Huhn!', reverse: true,
                  description: "Auf diesen Seiten dreht sich alles um die Hühner. Mit unserem Motto Wegschauen war gestern! möchten wir auch möglichst viele Menschen erreichen und aufzeigen, was für ein schreckliches Leiden Legehennen tagtäglich durchleben und dass jeder einen Beitrag dazu leisten kann, diesem Wahnsinn ein Ende zu setzen.",
                  keywords: 'Tierschutz, Hühnerrettung, Huhn, Hühner, Legehennen, Lebensplatz'
  end

  def faq
    set_meta_tags title: 'Fragen & Antworten', reverse: true,
                  description: "Grundvoraussetzung ist, dass die Hennen ein artgerechtes Zuhause auf Lebenszeit erhalten. Weitere Informationen hier."
  end

end
