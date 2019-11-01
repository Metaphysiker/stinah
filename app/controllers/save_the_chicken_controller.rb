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

  def keeping
    set_meta_tags title: 'Hühnerhaltung', reverse: true,
                  description: "Hühner haben im Verband  eine feste Rangordnung. Sobald neue Tiere in eine bestehende Gruppe eingegliedert werden, muss eine neue Rangordnungfestgelegt werden. Diese oftmals brutal anmutenden Kämpfe sind ein wesentlicher Bestandteil der Bildung eines neuen sozialen Gefüges und sollten in keinem Fall unterbrochen werden.",
                  keywords: 'Hühnerhaltung'
  end

  def act_sustainable
    set_meta_tags title: 'Nachhaltig Handeln', reverse: true,
                  description: "Es gibt viele, die den Hochleistungsarbeiterinnen einen neuen, würdigen Lebensplatz ermöglichen. Dafür, dass die Zahlen der ausgestallten Legehennen aber nicht stetig weiter steigen, kann jeder von uns selbst einen Beitrag leisten. Leben ohne Eier ist nicht nur gesünder sondern auch für engagierte Köche und begeisterte BäckerInnen ein Gewinn.",
                  keywords: 'Nachhaltigkeit'
  end

  def new_home
    set_meta_tags title: 'Lebensplatz gesucht', reverse: true,
                  description: "Lebensplätze für Hühner gesucht.",
                  keywords: 'Lebensplatz'
  end

  def picture_gallery
    set_meta_tags title: 'Fotogalerie', reverse: true,
                  description: "Die Videos und Fotos zeigen einen kurzen Einblick in zwei unserer vergangenen Rettungsaktionen.",
                  keywords: 'Rettungsaktion'
  end

  def donation
    set_meta_tags title: 'Spenden', reverse: true,
                  description: "Die Videos und Fotos zeigen einen kurzen Einblick in zwei unserer vergangenen Rettungsaktionen.",
                  keywords: 'Rettungsaktion'
  end

  def contact
    set_meta_tags title: 'Kontakt', reverse: true,
                  description: "Kontakt aufnehmen mit Rettet-das-Huhn!"
  end

  def requirements
    set_meta_tags title: 'Voraussetzungen', reverse: true,
                  description: "
Die Vermittlungsstelle geht davon aus, dass das Tier bis zu seinem natürlichen Lebensende oder der –wenn dringend nötig-
beim Tierarzt durchgeführten Euthanasie beim Eigentümer liebevoll umsorgt wird."
  end

end
