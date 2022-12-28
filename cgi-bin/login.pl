#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;


my $q = CGI->new;
my $usuario = $q->param('user');
my $contrasena = $q->param('contra');
print $q->header('text/html');


print "<DOCTYPE html>\n";
print "<html><head><title>Nueva Pagina</title></head>\n";
print "<body>\n";


my $user = 'alumno';
my $password = 'pweb1';
my $dsn = "DBI:MariaDB:database=pweb1;host=127.0.0.1";
my $dbh = DBI->connect($dsn, $user, $password) or die("No se pudo conectar!");;
my $sth=$dbh->prepare("SELECT * FROM Usuarios WHERE usuario=? AND contra=?");
$sth->execute($usuario, $contrasena);
my $body;
while ( my @row=$sth->fetchrow_array ){
  $body = @row[0];
}


$sth->finish;
$dbh->disconnect;
if (!($body eq "")){
print "<h2> Bienvenido $body</h2>";

print "<a href= 'http://192.168.0.24/~alumno/trabajo_final_grupal/index.html'>
<input type='button' value='Ver Pagina'></a>";
}
else{
print "<h2> Los credenciales no coinciden con alguna cuenta existente</h2>";
print "<a href= 'http://192.168.0.24/~alumno/trabajo_final_grupal/login.html'>
<input type='button' value='Volver a intentarlo'></a>";
}
print "<body<</html>";
