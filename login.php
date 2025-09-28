<?php
session_start();
require_once "includes/autoloader.php";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // get username and password
    $username = filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING);
    $password = filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING);
    // instantiate User object for login and try to login
    $user = new User();
    $loginResult = $user->login($username, $password);
    // checking for logging errors result
    if (isset($loginResult['error'])) {
        if ($loginResult['error'] === 'invalid') {
            header('Location: login.php?error=invalid');
            exit();
        } elseif ($loginResult['error'] === 'deactivated') {
            header('Location: login.php?error=deactivated');
            exit();
        } elseif ($loginResult['error'] === 'database') {
            die('Login failed: ' . $loginResult['message']);
        }
    } else {
        // if no any authentication errors happened go to dashboard and login successfully
        $_SESSION['user'] = $loginResult;
        switch ($_SESSION['user']['role']) {
            case 'Admin':
                header('location: admin/dashboard.php');
                break;
            case 'Clerk':
                header('location: clerk/dashboard.php');
                break;
            case 'Nurse':
                header('location: nurse/dashboard.php');
                break;
            case 'Lab Technician':
                header('location: lab/dashboard.php');
                break;
            case 'Pharmacist':
                header('location: pharmacist/dashboard.php');
                break;
            default:
                break;
        }
    }
}
?>
<html>

<head>
    <!-- Reusable head section -->
    <?php include __DIR__ . '/includes/head.php'; ?>
</head>

<body>


    <!-- Reusable navigation section -->
    <nav>
        <?php include __DIR__ . '/includes/nav.php'; ?>
    </nav>

    <!-- Main section -->
    <section>
        <div class="container my-5" style="max-width: 500px;">
            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <div class="d-flex justify-content-between">
                        <h4 class="mb-0">Login</h4>
                        <a type="button" href="index.php" class="btn-close"></a>
                    </div>
                </div>
                <div class="card-body">
                    <!-- error message for invalid username or password -->
                    <?php if (
                        isset($_GET['error']) &&
                        $_GET['error'] == 'invalid'
                    ): ?>
                        <div class="alert alert-warning"><strong>Login failed:</strong> Invalid username or password!
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <?php endif; ?>
                    <!-- error message for deactivated account-->
                    <?php if (isset($_GET['error']) && $_GET['error'] == 'deactivated'): ?>
                        <div class="alert alert-danger"><strong>Login failed:</strong> deactivated account!</div>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    <?php endif; ?>
                    <!-- login form -->
                    <form method="POST" class="py-3">
                        <div class="mb-3">
                            <!-- username input field -->
                            <label for="username" class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" placeholder="Enter username"
                                required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <!-- password input field -->
                                <input type="password" class="form-control" name="password" id="password"
                                    placeholder="Enter password" required>
                                <div class="input-group-append">
                                    <!-- show or hide password icon -->
                                    <span class="input-group-text py-3 password-toggle" id="show_hide">
                                        <i class="fas fa-eye"></i> </span>
                                </div>
                            </div>
                        </div>
                        <!-- login button -->
                        <button type="submit" class="btn btn-primary btn-lg w-100">Login</button>
                    </form>
                </div>
            </div>
    </section>
    <!-- Reusable footer section -->
    </div>
    <footer class="pt-5">
        <?php include __DIR__ . '/includes/footer.php'; ?>
    </footer>
    <script src="assets/js/password_show_hide.js"></script>
    <!-- javascript for showing or hiding the password -->
</body>

</html>