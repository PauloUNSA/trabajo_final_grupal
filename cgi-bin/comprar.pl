#!/usr/bin/perl
   use strict;
   use warnings;
   use DBI;
   use CGI;
   use utf8;
print "Content-type: text/html\n\n";
print <<HTML;
<!DOCTYPE html>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="../css/estilo.css">
    <title>Carrito de Compras</title>
</head>
<body>
    <div class="contenedor-resultado" style="width: 1000px;padding-bottom:35px;">
    <div class="tabla-resultados">

    <div id="contenedor">
      <nav>
        <ul>
          <li><input type="button" onclick="location.href='#' " value=" Carrito "/></li>
          <li><input type="button" onclick="location.href='../index.html'" value=" Inicio "/></li>
          <li><input type="button" onclick="location.href='../comp.html'" value=" Computadoras "/></li>
          <li><input type="button" onclick="location.href='../cell.html'" value=" Celulares "/></li>
          <li><input type="button" onclick="location.href='../lap.html'" value=" Laptops "/></li>
          <li><input type="button" onclick="location.href='../login.html'" value=" Login "/></li>
          <img src="../img/logo.png" width="60" height="60" alt="" ></li>
        </ul>
      </nav>
    </div>
</body>
HTML
my $q =CGI->new;
my $Id=1;
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=127.0.0.1";

my $dbh = DBI ->connect($dsn,$user,$password) or die ("No se pudo conectar");
my $sth = $dbh->prepare("select Nombre,Precio from productosVendidos ");
#Este Id va a ser el que identrifique al usuario 
$sth->execute();
print <<HTML;
<table id="customers">
  <tr>
      <th>Producto</th>
      <th>Precio</th>
HTML
while(my @row=$sth->fetchrow_array){
    
    print <<HTML;
     <link rel="stylesheet" type="text/css" href="../css/estiloCompra.css">
  </tr>
  <tr>
      <td>$row[0]</td>
      <td>$row[1]</td>
  </tr>
HTML
  }

$sth ->finish;
$dbh->disconnect;
