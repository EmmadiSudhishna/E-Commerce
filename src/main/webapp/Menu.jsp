<nav class="navbar navbar-expand-sm navbar-dark" style="background-color: rgb(48, 66, 85);">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto"> <!-- Added ml-auto class to align items to the right -->
        <li class="nav-item">
          <a class="nav-link active" href="index.jsp"><i class="fas fa-home"></i> Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="About.jsp"><i class="fas fa-info-circle"></i> About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="Contact.jsp"><i class="fas fa-envelope"></i> Contact</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link active dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"><i class="fas fa-sign-in-alt"></i> Login</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="AdminLogin.jsp">Admin</a></li>
            <li><a class="dropdown-item" href="CustomerLogin.jsp">Customer</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</nav>
