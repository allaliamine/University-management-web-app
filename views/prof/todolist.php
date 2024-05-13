<?php
session_start();
require_once '../../securiteprof.php';
include '../../includes/sidebar_prof.php';

$todo=$_SESSION['todo'];

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>To-Do list </title>
    <link rel="stylesheet" href="style_Prf.css">

    <style>
        table{
            background-color:#dfdfdf !important;
        }
        thead{
            background-color: #212529 !important;
            color: white !important;
        }
    </style>
</head>
<body>
        <h1 class="py-4 my-4" style="margin-left: 300px;">Votre To-Do List</h1>

        <div class="w-50 m-auto" >
        <form action="../../routing/routing.php" method="post">
        <div class="form-group">
            <h5 for="title">Nouvelle tâche...</h5>
            <input class="form-control" type="text" name="task" id="task" placeholder="Ajouter votre tâche ici...." Required>
            </div><br>
            <button type="submit" name="action" value="addtodo" class="btn btn-success btn-sm" onclick="return confirm('Vous êtes sûr d;ajouter cette tache ?')">Ajouter</button>
        </form>


        </div><br>
        <hr class="bg-dark w-50 m-auto">
        <div class="lists w-50 m-auto my-4">
            <h1>Votre Liste</h1>
            <div id="lists">
            <table class="table table-light table-hover" >
                <thead >
                    <tr>
                    <th scope="col" name="id">Tâche.No</th>
                    <th scope="col">Tâche</th>
                    <th scope="col">Etat</th>
                    <th>Action</th>
                    </tr>
                </thead>
        <tbody>
            <?php foreach($todo as $td) { 
                if($td['act']=='Non Termine'){
                ?>
                        <tr scope="row">
                            <td><?php echo $td['id'] ?></td>
                            <td>
                                <span class="task-text"><?php echo $td['task'] ?></span>
                                <input type="text" class="edit-task-input form-control" value="<?php echo $td['task'] ?>" style="display: none;">
                            </td>
                            <td><?php echo $td['act']  ?></td>
                            <td>
                                <a href="../../routing/routing.php?todolist=terminer&id=<?= $td['id']?>" class="btn btn-info btn-sm" onclick="return confirm('Vous êtes sûr que cette tâche est terminée ?')">Terminer</a>
                                <button class="btn btn-success btn-sm edit-task">Edit</button>
                                <a href="../../routing/routing.php?todolist=supprimer&id=<?= $td['id']?>" class="btn btn-danger btn-sm" onclick="return confirm('Vous êtes sûr de supprimer cette tâche ?')">Supprimer</a>
                            </td>
                            
                        </tr>
            <?php } } ?>
        </tbody>
        </table>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const editButtons = document.querySelectorAll('.edit-task');
                editButtons.forEach(button => {
                    button.addEventListener('click', function() {
                        const row = this.closest('tr');
                        const taskText = row.querySelector('.task-text');
                        const editInput = row.querySelector('.edit-task-input');
                        const isEditing = editInput.style.display === 'block';

                        if (!isEditing) {
                            taskText.style.display = 'none';
                            editInput.style.display = 'block';
                            editInput.focus();
                            this.textContent = 'Save';
                        } else {
                            const newTask = editInput.value;
                            const taskId = row.querySelector('td:first-child').textContent;

                            // Send an AJAX request to update the task in the database
                            const formData = new FormData();
                            formData.append('action', 'editTask');
                            formData.append('id', taskId);
                            formData.append('task', newTask);

                            fetch('../../routing/routing.php', {
                                method: 'POST',
                                body: formData
                            })
                            .then(response => {
                                if (!response.ok) {
                                    throw new Error('Network response was not ok');
                                }
                                return response.text();
                            })
                            .then(data => {
                                // Update the task text if the request is successful
                                taskText.textContent = newTask;
                                taskText.style.display = 'inline';
                                editInput.style.display = 'none';
                                this.textContent = 'Edit';
                            })
                            .catch(error => {
                                console.error('There was an error!', error);
                                // Handle errors
                            });
                        }
                    });
                });
            });
        </script>


</body>
</html>