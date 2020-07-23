Git: https://github.com/ggolub1/home
Branch: feature/t2
passw: ggolub1/Cre8or11

Jenkins: Localhost:8080
User: gene
Passw: Ggolub1!

Jenkins job 'jenkins file testin'
runs Jenkins file at C:\gith\Jenkinsfile

as part of it, it runs:
"c:/Program Files/Microsoft SQL Server/Client SDK/ODBC/170/Tools/Binn/sqlcmd" -U gene -P gene -S . -d db1 -i C:\gith\326a\t4.txt
which is insert into sql server on l390.db1.dbo.version and version2 tables.

how to operate testing:
-----------------------

start sql server and ssms management studio


open browser for git.

open browser for Jenkins

open cygwin terminal
run: ksh -o vi
run: /c/users/gene_/profile.txt

now you can run 'Build' for the job jenkins file testin and watch how .bat file is execute
and rows are inserted into sql server.