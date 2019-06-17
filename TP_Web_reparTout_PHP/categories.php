
    <h2 id="welcome">Bienvenue</h2>
    <p>Bienvenue sur votre site de gestion de catalogue.</p>

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
      <label></label><input type="submit">
    </form>
    
    <h3>Dernières catégories ajoutées</h3>
    <table cellspacing="5">
      <tr>
        <th>Nom</th>
        <th>Description</th>
      </tr>
      <tr>
        <td>pneus</td>
        <td>Pneus pour voiture, motos et poids-lourds</td>
      </tr>
    </table>
