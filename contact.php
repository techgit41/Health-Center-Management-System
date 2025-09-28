<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">
<head>
<?php include __DIR__.'/includes/head.php'; ?>
</head>
<body>
<?php include __DIR__.'/includes/nav.php'; ?>
    
    <section class="py-5">
        <div class="container" style="max-width: 800px;">
            <h2 class="text-center mb-4">Contact Us</h2>
            
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="card-title">Contact Information</h4>
                            <p class="card-text">
                                <strong>Address:</strong>
                                Debre Tabor, Ethiopia<br>
                                <strong>Phone:</strong> +251 58 441 20 44<br>
                                
                            </p>
                        </div>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="card h-100">
                        <div class="card-body">
                            <h4 class="card-title">Send Message</h4>
                            <form action="send_message.php" method="POST">
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                                </div>
                                <div class="mb-3">
                                    <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                                </div>
                                <div class="mb-3">
                                    <textarea class="form-control" name="message" rows="4" placeholder="Your Message" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Send Message</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <?php include __DIR__.'/includes/footer.php'; ?>
</body>
</html>