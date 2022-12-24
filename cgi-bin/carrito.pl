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

    <link rel="stylesheet" type="text/css" href="../estiloTabla.css">
    <title>Carrito de Compras</title>
</head>
<body>
    <div class="contenedor-resultado" style="width: 1000px;padding-bottom:35px;">
    <div class="tabla-resultados">
HTML

my $q =CGI->new;
  my $user = 'alumno';
  my $password = 'pweb1';
  my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.1.9";

  my $dbh = DBI ->connect($dsn,$user,$password) or die ("No se pudo conectar");


my $Id=$q->param("id");

formulario();


  my $sth = $dbh->prepare("SELECT Nombre,Precio FROM Productos WHERE Id=?" );

  $sth->execute($Id) or die "error";

 print <<HTML;
    <div class="columna cabecera">
      <div>Nombre</div>
      <div>Precio</div>
    </div>
HTML
my $nombre;
my $precio;
 while(my @row=$sth->fetchrow_array){
    print"<div class='columna'><div class='izquierdo'> $row[0] </div> \n <div> $row[1] </div></div>";
    $nombre=$row[0];
    $precio=$row[1];
  }
  $sth ->finish;
 my $user = 'alumno';
  my $password = 'pweb1';
  my $dsn = "DBI:MariaDB:database=pweb1;host=192.168.1.9";

  my $dbh = DBI ->connect($dsn,$user,$password) or die ("No se pudo conectar");
  my $sth = $dbh->prepare("INSERT INTO productosVendidos(Id, Nombre, Precio) VALUES (?,?,?)");
  #Este Id va a ser el que identrifique al usuario 
  $sth->execute("$Id","$nombre","$precio");
$dbh->disconnect;

sub formulario{


    print <<HTML;
        <div>
            <form action="carrito.pl" method="GET">
            </form>
        </div>
HTML
}
