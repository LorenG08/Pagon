<?php
require "header.php";
?>

<header class="header" style="background-image: url('img/7.jpg'); filter: brightness(80%);">
    <div class="row">
        <div class="col-md-12 text-center">
            <a class="logo"><img src="img/UV Logo.jpg" alt="logo"></a>
        </div>
        <div class="col-md-12 text-center">
            <button type="button" onclick="window.location.href='reservation.php'" class="btn btn-outline-light btn-lg"><em>Make a Reservation Now!</em></button>
        </div>
    </div>
</header>




<!--about us section-->

<section id="aboutus">

 <div class="container">
   <h3 class="text-center"><br><br>Fine Dining sa Sugbo</h3>
   <div class="row">
<!--carousel-->
     <div class="col-sm"><br><br>
      	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
         <ol class="carousel-indicators">
           <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
           <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
           <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
         </ol>
        <div class="carousel-inner">
           <div class="carousel-item active">
             <img class="d-block w-100" src="img/3.jpg" alt="First slide">
           </div>
           <div class="carousel-item">
           <img class="d-block w-100" src="img/4.jpg" alt="Second slide">
           </div>
           <div class="carousel-item">
           <img class="d-block w-100" src="img/5.jpg" alt="Third slide">
           </div>
        </div>
         <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
           <span class="sr-only">Previous</span>
         </a>
         <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
           <span class="carousel-control-next-icon" aria-hidden="true"></span>
           <span class="sr-only">Next</span>
         </a>
       </div><br><br>
     </div>

<!--end of carousel-->

     <div class="col-sm">
    	<div class="arranging"><br><hr>
	<h4 class="text-center">What to Expect?</h4>
	<p><br>Fine Dining sa Sugbo can offer you authentic filipino cuisines on a fine dining setup. All assured that every ingredients are fresh and all the cuisines are freshly cooked within the day. We also offer the best customer catering in Cebu hassle free so our costumers can relax while they enjoy their food.<br><br><br></p><hr>
	</div>
     </div>
    </div><br>
  </div>
</section>
<!--end of about us section-->

<div class="header2" style="background-image: url('img/3.jpg'); filter: brightness(80%);">
</div>

<!----gallery -->
<div class id="gallery"><br>
    <div class="container">
    <h3 class="text-center"><br>Food Gallery<br><br></h3>
        <div class="d-flex flex-row flex-wrap justify-content-center">
           <div class="d-flex flex-column">
              <img src="img/lugaw.jpg" class="img-fluid">
              <img src="img/2.jpg" class="img-fluid">
           </div>
           <div class="d-flex flex-column">
              <img src="img/3.jpg" class="img-fluid">
              <img src="img/4.jpg" class="img-fluid">
           </div>
           <div class="d-flex flex-column">
               <img src="img/5.jpg" class="img-fluid">
               <img src="img/6.jpg" class="img-fluid">
           </div>
           <div class="d-flex flex-column">
               <img src="img/7.jpg" class="img-fluid">
               <img src="img/11.jpg" class="img-fluid">
           </div>
        </div>
    </div>
</div><br><br>
<!----end of gallery -->

<div class="container" id="reservation">
    <h3 class="text-center"><br><br>Reservation<br><br></h3>
    <img  src="img/16.jpg" class="img-fluid rounded">
    <button type="button" onclick="window.location.href='reservation.php'" class="btn btn-outline-dark btn-block btn-lg">Make a reservation Now!</button>
        
</div><br><br>

<div class="header2" style="background-image: url('img/11.jpg'); filter: brightness(80%);">
</div>

<!-- main page map section-->
<section class="map" id="footer">
    <div class="container">
    <h3 class="text-center"><br><br>Find us @!</h3><br>
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1957.8054608924456!2d123.90105055860899!3d10.298259911893126!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x33a99958c3ed7ef7%3A0x6d5196d8d905b0d9!2sUniversity%20of%20the%20Visayas%20-%20Main%20Campus!5e1!3m2!1sen!2sph!4v1715479006401!5m2!1sen!2sph" width="1110" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    
        <div class="row staff">
            <div class="col">
            <h4><strong>Opening Hours</strong></h4>
                       
                <div class="signup-form">
                    <form action="#footer" method="post">
                        <div class="form-group">
                            <label>Enter Date</label>
                            <input type="date" class="form-control" name="date" placeholder="Date" required="required">
                        </div>
                        <div class="form-group">
                            <button type="submit" name="check_schedule" class="btn btn-dark btn-block">Check Open Time</button>
                        </div>
                    </form>
                    
<?php

if(isset($_POST['check_schedule'])){
      
require 'includes/dbh.inc.php';
            
$date= $_POST['date'];
 
    $sql = "SELECT * FROM schedule WHERE date = '$date'";
    $result = $conn->query($sql);
    if ($result->num_rows == 1) {
        while($row = $result->fetch_assoc()) {
            echo"
                <table class='table table-sm table-striped table-dark text-center'>
                   <thead>
                    <tr>
                    <th scope='col'>Date</th>
                    <th scope='col'>Open Time</th>
                    <th scope='col'>Close Time</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>
                    <th scope='row'><em>". $date . "</em></th>
                    <td>".$row['open_time']."</td>
                    <td>".$row['close_time']."</td>
                    </tr>
                   </tbody>
                </table>";
                }
            }
        else{
         echo"
                <table class='table table-striped table-dark text-center'>
                   <thead>
                    <tr>
                    <th scope='col'>Date</th>
                    <th scope='col'>Open Time</th>
                    <th scope='col'>Close Time</th>
                    </tr>
                   </thead>
                   <tbody>
                    <tr>
                    <th scope='row'><em>". $date . "</em></th>
                    <td>12:00</td>
                    <td>00:00</td>
                    </tr>
                   </tbody>
                </table>";
            }
         
   //close connection
   mysqli_close($conn);
}
?>
                        
                </div><br>
            </div>

            <div class="col">
            <h4 class="text-right"><strong>Visit Us</strong></h4>
            <p class="text-right">Fine Dining sa Sugbo<br><i class="fa fa-map-marker"></i>&nbsp; Dionisio Jakosalem St, Cebu City, 6000 Cebu <br>Philippines <br><br>email: group2resto@gmail.com<br>phone: +639324168248</p>
            </div>

	</div>
    </div>
</section>
<!--end of main page map section-->


<?php
require "footer.php";
?>