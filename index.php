<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atse Seyfe Ared Health Center</title>
    <!-- framework CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <?php include __DIR__."/includes/head.php";?>
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/index.css">
    <link rel="stylesheet" href="assets/css/font/all.min.css">
</head>

<body>
    <div class="d-block">
  <!-- reusable nav bar -->
  <?php include 'includes/nav.php'; ?>
    <!-- carousel -->
    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1"
                aria-current="true"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"
                class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"
                class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="3" aria-label="Slide 4"
                class=""></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="4" aria-label="Slide 5"
                class=""></button>
        </div>
        <div class="carousel-inner align-items-center">
            <div class="carousel-item active hero-section">
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1 class="font-weight-bold">Welcome to Atse Seyfe Ared Health Center</h1>
                        <p class="opacity-75">We are committed to providing quality healthcare services for our
                            community.</p>
                        <p><a class="btn btn-lg btn-primary" href="login.php">Login</a></p>
                    </div>
                </div>
            </div>

            <div class="carousel-item slidePage1">
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>Patient Management Services</h1>
                        <p>Efficient patient registration and records management</p>
                        <p><a class="btn btn-lg btn-primary" href="login.php">Login</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item hero-section slidePage2">
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>Emergency Health Care Services</h1>
                        <p class="opacity-75">24/7 access to immediate emergency care.</p>
                        <p><a class="btn btn-lg btn-primary" href="login.php">Login</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item hero-section slidePage3">
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>Laboratory Services</h1>
                        <p>Modernized laboratory testing and reporting
                        <p>
                        <p><a class="btn btn-lg btn-primary" href="login.php">Login</a></p>
                    </div>
                </div>
            </div>
            <div class="carousel-item hero-section slidePage4">
                <div class="container">
                    <div class="carousel-caption text-center">
                        <h1>Pharmacy</h1>
                        <p>Complete drug management and Pharmacy
                        <p>
                        <p><a class="btn btn-lg btn-primary" href="login.php">Login</a></p>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- end carousel -->
    </div>
    
    <!-- Services Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card service-card h-100">
                        <div class="card-body text-center">
                            <h5 class="card-title">Patient Management</h5>
                            <p class="opacity-75">Efficient patient registration and records management</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card service-card h-100">
                        <div class="card-body text-center">
                            <h5 class="card-title">Lab Services</h5>
                            <p class="opacity-75">Modernized laboratory testing and reporting</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card service-card h-100">
                        <div class="card-body text-center">
                            <h5 class="card-title">Pharmacy</h5>
                            <p class="opacity-75">Complete drug management and Pharmacy</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card service-card h-100">
                        <div class="card-body text-center">
                            <h5 class="card-title">Emergency Care</h5>
                            <p class="opacity-75">24/7 access to immediate emergency care.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer -->
    <?php include __DIR__.'/includes/footer.php'; ?>
    <!-- Bootstrap JS -->
</body>

</html>