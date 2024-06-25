<style>
        /* Add your custom styles here */
        .social-icons .nav-item a {
            color: #007bff; /* Default color */
            position: relative;
            transition: color 0.3s;
        }

        .social-icons .nav-item a::before {
            content: "";
            position: absolute;
            width: 100%;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: #007bff; /* Default color for the line */
            visibility: hidden;
            transform: scaleX(0);
            transition: all 0.3s ease-in-out;
        }

        .social-icons .nav-item:hover a::before {
            visibility: visible;
            transform: scaleX(1);
        }

        .social-icons .nav-item:hover a {
            color: #0056b3; /* Change color on hover */
        }

        .social-icons .nav-item .icon {
            font-size: 50px;
            margin-right: 5px;
        }

        .social-icons .nav-item:nth-child(2) a {
            color: #ff8800; /* Customize color for the second social icon */
        }

        .social-icons .nav-item:nth-child(3) a {
            color: #4caf50; /* Customize color for the third social icon */
        }

        /* Hover effects for specific social icons */
        .social-icons .nav-item:hover .fa-google {
            box-shadow: 0px 0px 7px #ff0000 inset, 0px 0px 7px #ff0000;
        }

        .social-icons .nav-item:hover .fa-instagram {
            box-shadow: 0px 0px 7px #ff0095 inset, 0px 0px 7px #ff0095;
        }

        .social-icons .nav-item:hover .fa-twitter {
            box-shadow: 0px 0px 7px #FF1493 inset, 0px 0px 7px #FF1493;
        }

        .card {
            width: 18rem;
            margin-bottom: 20px;
        }

        .navbar-dark .navbar-nav .nav-link:hover {
            color: rgb(202, 238, 104);
        }

        .navbar-dark .navbar-nav .nav-item.dropdown:hover .dropdown-menu a:hover {
            background-color: rgb(202, 238, 104);
            color: #212529;
        }

        
    </style>
</head>
<body>
   <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark sticky-top" style="height: 70px;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"> <img src="../uploads/Logo.jpeg" alt="Logo" style="width: 40px;" class="rounded-pill"></a>
             <!-- Navbar toggler for small screens -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="topNavbarCollapse">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="#" style="color: white;"><h4>E-commerce</h4></a></li>
                </ul>
                <ul class="navbar-nav ms-auto social-icons">
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-google fa-2x"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-instagram fa-2x"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab  fa-twitter fa-2x"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bottom Navbar -->
    <nav class="navbar navbar-expand-sm navbar-dark" style="height: 40px; background-color: rgb(48, 66, 85);">
        <div class="container-fluid">
            <!-- Navbar toggler for small screens -->
           <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#bottomNavbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="bottomNavbarCollapse">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="CustomerHome.jsp">
                            <i class="fas fa-home"></i> Home
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user"></i> Profile
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="CustomerProfile.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="WishList.jsp">
                            <i class="fas fa-heart"></i> WishList
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Cart.jsp">
                            <i class="fas fa-shopping-cart"></i> Cart
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="OrdersHistory.jsp">
                            <i class="fas fa-history"></i> Order
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-star"></i> Ratings
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="ViewRatings.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-comment"></i> Feedback
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="AddFeedback.jsp">Add</a></li>
                            <li><a class="dropdown-item" href="ViewFeedbacks.jsp">View</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</body>
</html>