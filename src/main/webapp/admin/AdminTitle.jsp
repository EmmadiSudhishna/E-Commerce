<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive Navbar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
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
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <img src="../uploads/Logo.jpeg" alt="Logo" style="width: 40px;" class="rounded-pill">
                <span class="ms-3 h4">E-commerce</span>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav social-icons">
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab fa-google fa-2x"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab fa-instagram fa-2x"></i></a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fab fa-twitter fa-2x"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.2/js/bootstrap.min.js"></script>
</body>
</html>
