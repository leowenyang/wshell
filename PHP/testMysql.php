<?php
try {
  $pdo = new PDO("mysql:host=localhost;dbname=mysql", 'root', 'root');
  $rs = $pdo->query("select * from user");
  $result_arr = $rs->fetchAll();
  print_r($result_arr);
  $pdo = null;
} catch (PDOException $e) {
    print "Error!".$e->getMessage();
}
