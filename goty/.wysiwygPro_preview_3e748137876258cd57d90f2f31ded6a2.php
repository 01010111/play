<?php
if ($_GET['randomId'] != "bmb7VhazGHvt0WHp_zJCclX2iQA3gvU3T3AkcmBsyzGq4emEiQE9FQBMHk_7MhoE") {
    echo "Access Denied";
    exit();
}

// display the HTML code:
echo stripslashes($_POST['wproPreviewHTML']);

?>  
