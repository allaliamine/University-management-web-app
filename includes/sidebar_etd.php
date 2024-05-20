<?php

require_once '../../securiteetd.php';
$countNotif = $_SESSION['countNotif'];    
$countSeenNotif = $_SESSION['countSeenNotif']; 


$countNotif = $countNotif[0]["nmbrAnnonce"];
$countSeenNotif = $countSeenNotif[0]["nmbrSeen"];
?>

<html lang="en">
<head>
    <title>Edu-Net</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.5.1/css/all.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

</head>

<body id="page-top">
    <div id="wrapper" >

        <!-- side bar debut-->
        <div class="sidebar sider_principal mt-0 flex position-fixed col-md-2 col-sm-1">

            
            <div class="logo">
                <div class="logo_edu_net"></div>
            </div>
            

            <div class="side-bar flex">

                
               <a href="../../routing/routing.php?action=actualite&role=2" >
                   <span class="material-symbols-outlined">grid_view</span>
                   <h3>Dashboard</h3>
               </a>
                

               <a href="../../routing/routing.php?action=getAllCours&etape=1" >
                   <span class="material-symbols-outlined">menu_book</span>
                   <h3>Cours</h3>
               </a>

               <a href="../../routing/routing.php?action=noteetd">
                   <span class="material-symbols-outlined">Group</span>
                   <h3>Notes</h3>
               </a>

               <a href="../../routing/routing.php?action=rapportetd">
                   <span class="material-symbols-outlined">Summarize</span>
                   <h3>Rapport</h3>
               </a>

               <a href="../../routing/routing.php?action=notification">
                   <span class="material-symbols-outlined">Notifications</span>
                   <h3>Notifications</h3>
               </a>

               <a href="../../logout.php">
                    <span class="material-symbols-outlined">logout</span>
                    <h3>Log-out</h3>
                </a>
                
                
            </div>

        </div>

        <!--sidebar fin-->

        <!--start of main content (navbar + main(4 choices, news , stats))-->
        <div class="container-fluid offset-2 px-0 col-md-10 col-sm-9">

            <div class="content">

                <!--start of navbar-->
                <nav class="navbar bg-white topbar shadow d-flex">

                    <div class="search-bar-div">
                        <form class="ms-5 navbar-search me-auto my-0">
                            <div class="input-group">
                                <input type="text" class="form-control border-0 search" placeholder="Rcherche par mot clé"> 
                                <button class="btn search" type="submit">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                    
                    <!--right side of navbar (user , messagerie + (search for media queries))-->
                    <ul class="right_side text-center pe-3 mb-0">

                        <!--search for media queries-->
                        <li class="nav-item me-3 dropdown" style="list-style: none;" >

                            <a  class="nav-link" data-toggle="dropdown" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-search media"></i>
                            </a>
        
                            <ul class="dropdown-menu shadow p-0 dropdown-menu-right">
                                
                                <div class="card m-0 p-3">
                                    
                                        <form class="navbar-search me-auto my-0">
                                            <div class="input-group flex d-flex">
                                                <input type="text" class="form-control bg-light border-0 small" placeholder="Rcherche par mot clé">
                                                <div class="input-group-append">
                                                    <button class="btn search" type="submit">
                                                        <i class="fas fa-search fa-sm"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </form>
                                    
                                </div>
                                
                            </ul>
                        </li>
                        <!--end of search media queries-->


    
                        <!--notif icon + dropdown menu-->
                        <li class="nav-item mx-1 dropdown" style="list-style: none;" >
                            <a  class="nav-link" href="../../routing/routing.php?action=notification">
                                <i class="fa-solid fa-inbox"></i>
                                <span class="translate-middle badge rounded-pill bg-danger">
                                    <?php echo $countNotif - $countSeenNotif; ?>
                                </span>
                            </a>
                        </li>
                        <!--end of notif icon + dropdown menu-->
                        
                        <div class="topbar-divider"></div>

                        <!--profile icon + dropdown menu-->
                        <li class="nav-item mx-1 dropdown " style="list-style: none;">
                            <a class="nav-link py-2" data-toggle="dropdown" data-bs-toggle="dropdown">
                                <span class="username">Bonjour, <?php echo " ".strtoupper($_SESSION['etd']['Nom']);?> </span>
                                <img class="img-profile rounded-circle" src="https://ensah.ma/apps/eservices/resources/img/user-1.png" alt="image">
                            </a>
                        
                            <div class="dropdown-menu shadow p-0 dropdown-menu-right">
                                <div class="card">
                                    <div class="card-header user_menu text-center text-light">Profile</div>
                                    <div class="card-body py-1 ">
                                
                                        <a class="dropdown-item ps-0" href="#">
                                            <i class="fa-solid fa-user"></i>
                                            Compte
                                        </a>
                                        
                                        <a class="dropdown-item ps-0" href="../../routing/routing.php?action=editerCompte&role=2">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                            Editer Mon Compte
                                        </a>                            
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!--end of profile icon + dropdown menu-->
                    </ul>
                    <!--end of the right side of tha nav bar -->
                    

                </nav>
                 <!--end of navbar-->
            </div>
        </div>
    </div>
</body>
</html>               