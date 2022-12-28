#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;


my $q = CGI->new;
my $usuario = $q->param('user');
my $contrasena = $q->param('contra');
my $nombre = $q->param('nombre');
my $apellido = $q->param('apellido');
print $q->header('text/html');

print "<DOCTYPE html>\n";
print "<html><head><title>Nueva Pagina</title></head>\n";
print "<body>\n";


my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=127.0.0.1";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;
my $sth=$dbh->prepare("INSERT INTO Usuarios(usuario, contra, nombre, apellido)VALUES(?,?,?,?)");
$sth->execute($usuario, $contrasena, $nombre, $apellido);

$sth->finish;
$dbh->disconnect;



print "<h1> Usuario creado satisfactoriamente</h1>";
print "<h2>Gracias por crearse una cuenta en nuestra web: <em><strong>$nombre $apellido</strong></em></h2>";
print "<p>Ahora inicie sesion en su nueva cuenta</p>";
print "<a href= 'http://192.168.0.24/~alumno/trabajo_final_grupal/login.html'>
<input type='button' value='Iniciar sesion'></a>";

print "<body<</html>";
