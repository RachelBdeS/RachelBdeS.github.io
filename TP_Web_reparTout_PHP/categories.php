<h2 id="welcome">Catégories
  <button class="edit" onclick="showSpan('editForm');" title="" tabindex="10">+</button>
</h2>
<p>Voici les catégories du site.</p>

<span id="editForm">
  <h3>Ajouter une catégorie</h3>
  <form action="" method="GET" name="ajout">
    <label for="nom">Nom</label>
    <input 
      type="text" 
      id="nom" 
      name="nom" 
      value="" 
      placeholder="Nom de la catégorie"
      title="Doit contenir 2 à 8 caractères"
      pattern="[a-zA-Z0-9\s]+"
    ><br>
    <label for="desc">Description</label>
    <input 
      type="text" 
      id="catDescription" 
      name="desc" 
      value=""
      placeholder="Description de la catégorie"
      pattern="[a-zA-Z]+"
    ><br>
    <label></label><input type="submit" tabindex="10">
  </form>
</span>

<h3>Dernières catégories ajoutées</h3>
<table cellspacing="5">
  <tr>
    <th>Nom</th>
    <th>Description</th>
  </tr>
  <tr tabindex="9">
    <td>pneus</td>
    <td>Pneus pour voiture, motos et poids-lourds</td>
  </tr>
</table>
