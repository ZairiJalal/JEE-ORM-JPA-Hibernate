<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Livres</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
 
</head>
<body>

   <div  class="container mt-5" >
   
         <h1 class="d-flex justify-content-center text-light bg-secondary">Liste des produits</h1>
         <form action="livresPaMC.php" method="get">
            <div class="input-group">
               <input type="search" name="mc" class="form-control rounded m-3" placeholder="Search" aria-label="Recherche un livre par son nom"aria-describedby="search-addon" />
               <button type="button" class="btn btn-success m-3" data-toggle="modal" data-target="#exampleModal">Ajouter un livre</button>
            </div>
         </form>
                 
         <table class="table table-striped">
            <thead>
               <tr>
                     <th scope="col">ID</th>
                     <th scope="col">Nom</th>
                     <th scope="col">Auteur</th>
                     <th scope="col">Prix(DH)</th>
                     <th scope="col">Quantité</th>
                     <th scope="col">Modifier</th>
                     <th scope="col">Supprimer</th>
               </tr>
           </thead>
          <tbody>
          <c:forEach items="${livreModel.produits }" var="l" >
             <tr>
                     <th scope="row">${l.id}</th>
                     <td>${l.nom }</td>
                     <td>${l.auteur }</td>
                     <td>${l.prix }</td>
                     <td>${l.quantite }</td>
                     <td> <button type="button" class="btn btn-warning btn-sm " data-toggle="modal" data-target="#editeModal${l.id}"> <i class="fas fa-edit"></i> </button></td>
                     <td> <button  type="button" class="btn btn-danger btn-sm " data-toggle="modal" data-target="#deleteModal${l.id}"> <i class="far fa-trash-alt"></i> </button></td>
            </tr>
        
        <!-- --------------------------------------------------------------------------- -->
<div class="modal fade" id="deleteModal${l.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Suppremier le produit </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="suppProduit.php" method="POST" >
            <div class="form-group">
                <label for="delId">Id</label>
                <input type="number" class="form-control disabled" id="delId" name="id" value="${l.id}"  readonly>
             </div> 
            <div class="form-group">
                <label for="delNom">Le nom</label>
                <input type="text" class="form-control disabled" id="delNom" name="nom" value="${l.nom}"  readonly>
             </div>
             <div class="form-group">
                <label for="delAuteur">L'auteur</label>
                <input type="text" class="form-control disabled" id="delAuteur" name="auteur" value="${l.auteur}" readonly >
             </div>
             <div class="form-group">
                <label for="delPrix">Le prix(DH)</label>
                <input type="text" class="form-control disabled" id="delPrix" name="prix" value="${l.prix}" readonly >
             </div>
             <div class="form-group">
                <label for="delQuantite">La quantité</label>
                <input type="number" class="form-control disabled" id="delQuantite" name="quantite" value="${l.quantite}"  readonly>
             </div>                      
           <button type="submit" class="btn btn-danger float-right ">Supprimer</button>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- --------------------------------------------------------------------------- -->
<div class="modal fade" id="editeModal${l.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modifier le produit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="editProduit.php" method="POST" >
            <div class="form-group">
                <label for="editId">Id</label>
                <input type="number" class="form-control" id="editId" name="id" value="${l.id}"  readonly>
             </div> 
            <div class="form-group">
                <label for="editNom">Le nom</label>
                <input type="text" class="form-control" id="editNom" name="nom" value="${l.nom}"  >
             </div>
             <div class="form-group">
                <label for="editAuteur">L'auteur</label>
                <input type="text" class="form-control" id="editAuteur" name="auteur" value="${l.auteur}"  >
             </div>
             <div class="form-group">
                <label for="editPrix">Le prix(DH)</label>
                <input type="text" class="form-control" id="editPrix" name="prix" value="${l.prix}"  >
             </div>
             <div class="form-group">
                <label for="editQuantite">La quantité</label>
                <input type="number" class="form-control" id="editQuantite" name="quantite" value="${l.quantite}"  >
             </div>                      
           <button type="submit" class="btn btn-warning float-right">Modifier</button>
        </form>
      </div>
    </div>
  </div>
</div>
        
         </c:forEach>
         </tbody>
      </table>
     </div>

    <!-- Modal pour ajouter un livre -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
       <div class="modal-dialog" role="document">
          <div class="modal-content">
             <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ajouter un livre</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                   <span aria-hidden="true">&times;</span>
                </button>
             </div>
          <div class="modal-body">
             <form action="addLivre.php" method="POST" >           
                <div class="form-group">
                   <label for="addNom">Le nom</label>
                   <input type="text" class="form-control" id="addNom" name="nom"   placeholder="Le nom">
                </div>
                <div class="form-group">
                   <label for="addAuteur">L'auteur</label>
                   <input type="text" class="form-control" id="addAuteur" name="auteur"   placeholder="L'auteur">
                </div>
                <div class="form-group">
                   <label for="addPrix">Le prix(DH)</label>
                   <input type="text" class="form-control" id="addPrix" name="prix"  placeholder="Le prix">
                </div>
                <div class="form-group">
                   <label for="addQuantite">La quantité</label>
                   <input type="number" class="form-control" id="addQuantite" name="quantite"  placeholder="La quantité">
                </div>                      
                <button type="submit" class="btn btn-success float-right">Ajouter</button>
             </form>
         </div>
       </div>
      </div>
     </div>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
</body>
</html>
