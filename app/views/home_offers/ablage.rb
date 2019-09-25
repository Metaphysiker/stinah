<table class="table table-striped table-bordered">
<thead>
  <tr>
    <th>
      ID
    </th>
    <th>Anbieter</th>
    <th>
      Erstellt
    </th>
    <th>
      Matches
    </th>
  </tr>
</thead>
<tbody>
  <% home_offers.each do |home_offer| %>
    <tr>
      <td>
        <%= link_to home_offer.id, home_offer_path(home_offer) %>
      </td>
      <td>
        <%= link_to "#{home_offer.firstname} #{home_offer.lastname}", home_offer_path(home_offer) %>
      </td>
      <td><%= link_to "#{l(home_offer.created_at)}", home_offer_path(home_offer) %></td>
      <td>
        <%= render "home_offers/matches", home_offer: home_offer %>
      </td>
    </tr>
  <% end %>
</tbody>
</table>
<%#= render partial: "home_offers/show", collection: @home_offers, as: :home_offer %>
<br />

<% if @archived == "true" %>
  <%= link_to "Nicht-archivierte Einträge anzeigen", home_offers_path(archived: false), class: "btn btn-primary m-2" %>
<% else %>
  <%= link_to "Archivierte Einträge anzeigen", home_offers_path(archived: true), class: "btn btn-primary m-2" %>
<% end %>
