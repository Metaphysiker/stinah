admin = User.create!(:username => "sandro", :email => "s.raess@me.com", :password => "123456")
admin.roles << Role.find_by_role("admin")

Fotograf für Bilder überlegen

Möglichkeit ich biete Plätze für 3 Tiere an.

Angebot: Mehrere für verschiedene Formular 3 Tiere eingeben können.

Mehrere Tiere hinzufügen können und Plus hinzufügen

#Neue Patenschaft: Neue Mail an Stinah und User

Schön darstellung danke Bild vom Tier und schönes Bild.

#Vierteljährlich: Bestätigung für Patenschaft anfragen: Patenschaften 2 Buttons: Bezahlt ja, oder nein -> Fällt er aus.

#Links: FAQ

#Kontakt:  rechts von Stinah


------------
#komplementär zum unteren
<div class="d-none d-lg-block">

<div class="d-block d-lg-none">
  <% animals.in_groups_of(2, false).each do |group| %>
    <div class="card-deck">
      <% group.each do |animal| %>
        <%= render 'show', animal: animal %>
      <% end %>
    </div>
  <% end %>
</div>

<div class="row">
  <% animals.each do |animal| %>
    <div class="col-sm-12 col-md-6 col-lg-4">
      <%= render 'show', animal: animal %>
    </div>
  <% end %>
</div>

<div>
  <% animals.in_groups_of(3, false).each do |group| %>
    <div class="card-deck">
      <% group.each do |animal| %>
        <%= render 'show', animal: animal %>
      <% end %>
    </div>
  <% end %>
</div>

<hr />
<br />
  <div class="d-flex justify-content-center">
    <% animal.pictures.each do |picture| %>
      <%= image_tag picture, class: "img-fluid mx-auto my-2" %>
    <% end %>
  </div>

  <hr />
  Leider können wir keine Spenden unter 30 Franken pro Monat annehmen,
  da der administrative Aufwand für kleine Spenden zu gross ist.
