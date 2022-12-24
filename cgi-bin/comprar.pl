#!"c:/Strawberry/perl/bin/perl.exe"
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
          <img src="./img/logo.png" width="60" height="60" alt="" ></li>
        </ul>
      </nav>
    </div>

HTML
my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.1.9";

my $dbh = DBI ->connect($dsn,$user,$password) or die ("No se pudo conectar");
my $sth = $dbh->prepare("Select Nombre,Precio from productosVendidos");
#Este Id va a ser el que identrifique al usuario 
while(my @row=$sth->fetchrow_array){
    print"<div class='columna'><div class='izquierdo'> $row[0] </div> \n <div> $row[1] </div></div>";
    
  }

$sth ->finish;
$dbh->disconnect;
