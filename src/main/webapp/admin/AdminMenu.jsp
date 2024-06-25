<nav class="navbar navbar-expand-sm navbar-dark" style="height: 40px; background-color: rgb(48, 66, 85);">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="AdminHome.jsp" style="color: white;"><i class="fas fa-home"></i>Home</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="color: white;"><i class="fas fa-list"></i>Category</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="AddCategory.jsp">Add</a></li>
                        <li><a class="dropdown-item" href="ViewCategories.jsp">View</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="color: white;"><i class="fas fa-box"></i>Products</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="AddProduct.jsp">Add</a></li>
                        <li><a class="dropdown-item" href="ViewProducts.jsp">View</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="color: white;"><i class="fas fa-users"></i>Customers</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="ViewCustomer.jsp">View</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" style="color: white;"><i class="fas fa-user-tie"></i>Employee</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="AddEmployee.jsp">Add</a></li>
                        <li><a class="dropdown-item" href="ViewEmployee.jsp">View</a></li>
                    </ul>
                </li>
                <li class="nav-item"><a class="nav-link" href="AdminOrders.jsp" style="color: white;"><i class="fas fa-shopping-cart"></i>Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="AdminInvoices.jsp" style="color: white;"><i class="fas fa-file-invoice"></i>Invoice</a></li>
                <li class="nav-item"><a class="nav-link" href="AdminReviews.jsp" style="color: white;"><i class="fas fa-eye"></i>Reviews</a></li>
                <li class="nav-item"><a class="nav-link" href="AdminFeedback.jsp" style="color: white;"><i class="fas fa-comments"></i>Feedback</a></li>
                <li class="nav-item"><a class="nav-link" href="../Logout.jsp" style="color: white;"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
