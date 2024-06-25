<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp"></jsp:include>
<jsp:include page="Title.jsp"></jsp:include>
<style>
.center-footer {
	margin-left: auto;
	margin-right: auto;
}
</style>


</head>

<body>
	<jsp:include page="Menu.jsp" />

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">

		<!-- The slideshow/carousel -->
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="uploads/Carousel1.jpg" class="d-block" style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="uploads/Carousel2.jpg" class="d-block" style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="uploads/Carousel3.jpg" class="d-block" style="width: 100%">
			</div>
			<div class="carousel-item">
				<img src="uploads/Carousel4.jpg" class="d-block" style="width: 100%">
			</div>
		</div>


		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>

	<!--Another card1-->
<div class="container-fluid mt-3">
    <!--Main Card-->
    <div class="card">
        <div class="card-header bg-white">
            <h3 class="card-text text-decoration-danger">Flash Deals on the Products</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-sm-3">
                    <p class="card-text">Today's Deals of the day! <a href="#" class="btn btn-warning btn-small">Upto
                            30%Off</a><a href="#" class="card-link"></a>
                    </p>
                    <img src="uploads/airpods.jpg" style="width: 160px;">
                </div>

                <div class="col-sm-3">
                    <p class="card-text">Today's Deals of the day! <a href="#" class="btn btn-warning brn-small"> Upto
                            25%Off</a><a href="#" class="card-link"></a>
                    </p>
                    <img src="uploads/cromp.jpg" style="width:170px; height:160px;">
                </div>
                <div class="col-sm-3">
                    <p class="card-text">Today's Deals of the day! <a href="#" class="btn btn-warning brn-small"> Upto
                            15%Off</a><a href="#" class="card-link"></a>
                    </p>
                    <img src="uploads/sofa.jpg" style="width:180px;">
                </div>
                <div class="col-sm-3">
                    <p class="card-text">Today's Deals of the day! <a href="#" class="btn btn-warning brn-small"> Upto
                            15%Off</a><a href="#" class="card-link"></a>
                    </p>
                    <img src="uploads/toast.jpg" style="width:200px;">
                </div>
            </div>
        </div>
    </div>
    <!-- second card -->
					<div class="container-fluid mt-3">
                        <!--Main Card-->
                        <div class="card">
                            <div class="card-header bg-white">
                                <h3 class="card-text text-decoration-danger">Great Deals on Health and Sports
                                    Supplements</h3>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="card-text">Today's Deals on HK Medicines! <a href="#"
                                                class="btn btn-warning btn-small">Upto
                                                25%Off</a><a href="#" class="card-link"></a>
                                        </p>
                                        <img src="uploads/Med1.jpg" style="width: 200px;">
                                    </div>

                                    <div class="col-sm-3">
                                        <p class="card-text">Today's Deals on Multivitamins <a href="#"
                                                class="btn btn-warning brn-small"> Upto
                                                31%Off</a><a href="#" class="card-link"></a>
                                        </p>
                                        <img src="uploads/Med2.jpg" style="width:200px;">
                                    </div>
                                    <div class="col-sm-3">
                                        <p class="card-text">Today's Deals on MB-VITE <a href="#"
                                                class="btn btn-warning brn-small"> Upto
                                                23%Off</a><a href="#" class="card-link"></a>
                                        </p>
                                        <img src="uploads/Med3.jpg" style="width:200px;">
                                    </div>
                                    <div class="col-sm-3">
                                        <p class="card-text">Muscle Blaze! <a href="#"
                                                class="btn btn-warning brn-small"> Upto
                                                22%Off</a><a href="#" class="card-link"></a>
                                        </p>
                                        <img src="uploads/Med4.jpg" style="width:170px;">
                                    </div>
                                </div>
                            </div>
                        </div>
					</div>	
						
					</div>
				

			

			
		
	&nbsp; &nbsp;
	
	
	
	
	<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html>

