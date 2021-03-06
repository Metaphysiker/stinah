class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:visits]
  before_action :is_user_allowed?, only: [:visits]

  include ApplicationHelper

  def welcome
    set_meta_tags title: 'Herzlich Wilkommen', reverse: true,
              description: 'Die Stiftung "Tiere in Not - Animal Help" engagiert sich seit Jahren sowohl im institutionellen als auch im individuellen Tierschutz.',
              keywords: 'Tierschutz, Tierrechte, Tiere in Not, Hilfe für Tiere, Animal Help, Lebenshof, Gnadenhof',
              og: {
                title: :title,
                url: root_url,
                image: ActionController::Base.helpers.asset_url("main-picture.jpeg", type: :image)
              }

    #@posts = Post.all.order("created_at").reverse_order.first(5)
    #@events = Event.where("start > ?", DateTime.now).order("start")
  end

  def newhome
    set_meta_tags title: 'Tiervermittlung', reverse: true,
              description: 'Stinah versucht für Tiere, die sich in Notsituationen befinden, ein neues Zuhause zu finden. Sie können einem Tier ein neues Zuhause bieten? Wir freuen uns über Ihre Kontaktaufnahme!',
              keywords: 'Tiervermittlung, Ich suche ein neues Zuhause für mein Tier, Ich biete einem Tier ein neues Zuhause'
  end

  def about

    @page = Page.where(slug: "über-stinah")

    @page = @page.first if @page.any?

    unless @page.blank?
      set_meta_tags title: @page.title, reverse: true,
            description: @page.description,
            keywords: @page.keywords
    end
    #set_meta_tags title: 'Über STINAH', reverse: true,
    #          description: 'Die Stiftung "Tiere in Not - Animal Help" hat es sich zur Aufgabe gemacht, die Umsetzung des verfassungsrechtlich verankerten Schutzes der Würde
    #                        der Kreatur voranzutreiben, die Stellung des Tieres als Mitgeschöpf zu festigen und als Konsequenz aus den ersten beiden Aufgaben die Tiere vor Ausbeutung
    #                        und Missbrauch zu schützen und ihnen - wo immer nötig – beizustehen.',
    #          keywords: 'Stinah, Stiftung Tiere in Not Animal Help'
  end

  def faq
    @page = Page.where(slug: "faq")

    @page = @page.first if @page.any?

    unless @page.blank?
      set_meta_tags title: @page.title, reverse: true,
            description: @page.description,
            keywords: @page.keywords
    end

    #set_meta_tags title: 'FAQ', reverse: true,
    #          description: 'Antworten auf die häufigsten gestellten Fragen.'
  end

  def internship
    @testimonials = Testimonial.where(category: "interns")

    set_meta_tags title: 'Praktikum bei Stinah', reverse: true,
              description: 'Ein Praktikum bei Stinah machen! Wohnung ist im Praktikum inklusive.',
              keywords: "Praktikum bei Stinah, Tierschutzarbeit"
  end

  def contact

    @page = Page.where(slug: "kontakt")

    @page = @page.first if @page.any?

    unless @page.blank?
      set_meta_tags title: @page.title, reverse: true,
            description: @page.description,
            keywords: @page.keywords
    end

    #set_meta_tags title: 'Kontakt', reverse: true,
    #          description: 'Hier können Sie Kontakt mit der Stinah aufnehmen.'
  end

  def testimonials
    set_meta_tags title: 'Erfahrungsberichte', reverse: true,
              description: 'Praktikum? Auf einem Lebenshof arbeiten? Tierschutzarbeit? Die Erfahrungsberichte.'
  end

  def support
    @page = Page.where(slug: "unterstützen")

    @page = @page.first if @page.any?

    unless @page.blank?
      set_meta_tags title: @page.title, reverse: true,
            description: @page.description,
            keywords: @page.keywords
    end

    #set_meta_tags title: 'Stinah unterstützen!', reverse: true,
    #          description: 'Mit einer Spende helfen Sie der Stiftung, ihren täglichen Einsatz zugunsten der Tiere zu finanzieren.',
    #          keywords: "Spende, Patenschaft, Tierschutz, Gönnerbeitrag, Naturalspende"


  end

  def impressum
    set_meta_tags title: 'Impressum', reverse: true
  end

  def cookies
    set_meta_tags title: 'Cookies', reverse: true
  end

  def privacy_statement
    set_meta_tags title: 'Datenschutzerklärung', reverse: true
  end

  private

  def is_user_allowed?
    if !is_current_user_admin?
      #raise "not authorized"
      sign_out current_user
      flash[:notice] = "Sie sind nicht authorisiert!"
      redirect_to root_path
    end
  end

end
