<?php session_start(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- reusable head -->
    <?php include __DIR__.'/includes/head.php'; ?>
</head>

<body>
    <!-- reusable nav -->
    <?php include __DIR__.'/includes/nav.php'; ?>

    <section class="py-5">
        <div class="container" style="max-width: 600px;">
            <h2 class="text-center mb-4">Feedback</h2>

            <div class="card shadow">
                <div class="card-body">
                    <?php if (isset($_GET['success'])): ?>
                                <div class="alert alert-success">Thank you for your feedback!</div>
                    <?php endif; ?>

                    <form action="submit_feedback.php" method="POST">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                        </div>
                        <div class="mb-3">
                            <select class="form-select" name="rating" required>
                                <option value="">Select Rating</option>
                                <option value="5">Excellent ★★★★★</option>
                                <option value="4">Very Good ★★★★</option>
                                <option value="3">Good ★★★</option>
                                <option value="2">Fair ★★</option>
                                <option value="1">Poor ★</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <textarea class="form-control" name="comments" rows="4" placeholder="Your Feedback/Comments"
                                required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Submit Feedback</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- reusable footer -->
    <?php include __DIR__.'/includes/footer.php'; ?>
</body>

</html>