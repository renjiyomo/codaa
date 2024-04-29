<?php
include('tracking_db.php');
session_start();

if (!isset($_SESSION['prof_name']) || !isset($_SESSION['faculty_id'])) {
  header('Location: /coda/landing/Register/SignIn/signin.php');
  exit();
}

$user_id = $_SESSION['faculty_id'];
$query = "SELECT * FROM faculties WHERE faculty_id = $user_id";
$result = mysqli_query($conn, $query);

if ($result) {
  $user_row = mysqli_fetch_assoc($result);
  $user_name = $user_row['names'];
  $contact_no = $user_row['contact_no'];
  $email = $user_row['email'];
  $pass = $user_row['password'];
  $coordinator = $user_row['coordinator'];
  $address = $user_row['address'];
} else {
  // Handle error
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  // Handle form submission
  $new_name = $_POST['new_name'];
  $new_contact_no = $_POST['new_contact_no'];
  $new_email = $_POST['new_email'];
  $new_password = $_POST['new_password'];
  $new_coordinator = $_POST['new_coordinator']; 
  $new_address = $_POST['new_address'];

  // Update the database with new values
  $update_query = "UPDATE faculties SET names = '$new_name', contact_no = '$new_contact_no', email = '$new_email', password = '$new_password', coordinator = '$new_coordinator', address = '$new_address' WHERE faculty_id = $user_id";
  $update_result = mysqli_query($conn, $update_query);
  
  if ($update_result) {
    // Redirect to profile page or display success message
    header('Location: profpage.php');
    exit();
  } else {
    // Handle update error
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="css/manage_account.css" />
  <link rel="stylesheet" href="css/all.min.css" />
  <link rel="stylesheet" href="css/fontawesome.min.css" />
  <script src="js/jquery-3.4.1.min.js"></script>
  <title>CSD Faculty</title>
  
  <script>
	$(document).ready(function(){
		$(".profile .icon_wrap").click(function(){
		  $(this).parent().toggleClass("active");
		  $(".notifications").removeClass("active");
		});

		$(".notifications .icon_wrap").click(function(){
		  $(this).parent().toggleClass("active");
		   $(".profile").removeClass("active");
		});

		$(".show_all .link").click(function(){
		  $(".notifications").removeClass("active");
		  $(".popup").show();
		});

		$(".close").click(function(){
		  $(".popup").hide();
		});
	});
  </script>

</head>
<body>

<nav>  
  <div class="wrapper">
    <nav class="navbar">
      <div class="navbar_left">
        <div class="nav__logo">
          <a href="#"><img src="imahe/FAST.png" alt="logo" /></a>
        </div>
      </div>
      <div class="navbar_center_text">
        <a href="profpage.php">Home</a>
        <a href="add_sched.php">Add Schedule</a>
        <a href="view_schedule.php">View Schedule</a>
      </div>

      <div class="navbar_right">
        <div class="notifications">

          
        </div>
         <div class="profile">
          <div class="icon_wrap">
            <img src="imahe/profile/icon.png" alt="profile_pic">
          </div>

          <div class="profile_dd">
            <ul class="profile_ul">
              <li class="profile_li">
                <a class="profile" href="#"><span class="picon"><i class="fas fa-user-alt"></i></span><?php echo $user_name; ?></a>
              </li>
              <li><a class="manage" href="manage_account.php"><span class="picon"><i class="fa-solid fa-gear"></i></span>Manage Account</a></li>
              <li><a class="logout" href="logout.php"><span class="picon"><i class="fas fa-sign-out-alt"></i></span>Logout</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </nav>
</nav>

<body>
  <h2>Manage Account</h2>
  <form method="POST" action="">
    <label for="new_name">Name:</label>
    <input type="text" id="new_name" name="new_name" required value="<?php echo $user_name; ?>"><br><br>
    
    <label for="new_contact_no">Contact Number:</label>
    <input type="text" id="new_contact_no" name="new_contact_no" value="<?php echo $contact_no; ?>"><br><br>
    
    <label for="new_email">Email:</label>
    <input type="email" id="new_email" name="new_email" required value="<?php echo $email; ?>"><br><br>
    
    <label for="new_password">New Password:</label>
    <input type="password" id="new_password" name="new_password" value="<?php echo $pass; ?>"><br><br>
    
    <label for="new_coordinator">Coordinator:</label>
    <input type="coordinator" id="new_coordinator" name="new_coordinator" value="<?php echo $coordinator; ?>"><br><br>

    <label for="new_address">Address:</label>
    <input type="address" id="new_address" name="new_address" value="<?php echo $address; ?>"><br><br>

    <button type="submit">Save Changes</button>
  </form>
</body>


</html>
