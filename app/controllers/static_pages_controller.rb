class StaticPagesController < ApplicationController
  def welcome
    set_meta_tags title: 'Herzlich Wilkommen', reverse: true,
              description: 'Die Stiftung "Tiere in Not - Animal Help" engagiert sich seit Jahren sowohl im institutionellen als auch im individuellen Tierschutz.',
              keywords: 'Tierschutz, Tierrechte, Tiere in Not, Hilfe für Tiere, Animal Help, Lebenshof, Gnadenhof'

    @posts = Post.all.order("created_at").reverse_order.first(5)
  end

  def newhome
    set_meta_tags title: 'Tiervermittlung', reverse: true,
              description: 'Stinah versucht für Tiere, die sich in Notsituationen befinden, ein neues Zuhause zu finden. Sie können einem Tier ein neues Zuhause bieten? Wir freuen uns über Ihre Kontaktaufnahme!',
              keywords: 'Tiervermittlung, Ich suche ein neues Zuhause für mein Tier, Ich biete einem Tier ein neues Zuhause'
  end

  def about
    set_meta_tags title: 'Über STINAH', reverse: true,
              description: 'Die Stiftung "Tiere in Not - Animal Help" hat es sich zur Aufgabe gemacht, die Umsetzung des verfassungsrechtlich verankerten Schutzes der Würde
                            der Kreatur voranzutreiben, die Stellung des Tieres als Mitgeschöpf zu festigen und als Konsequenz aus den ersten beiden Aufgaben die Tiere vor Ausbeutung
                            und Missbrauch zu schützen und ihnen - wo immer nötig – beizustehen.',
              keywords: 'Stinah, Stiftung Tiere in Not Animal Help'
  end

  def animalsofstinah

  end

  def faq

  end

  def contact

  end

end
