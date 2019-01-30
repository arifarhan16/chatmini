#!/usr/bin/perl
sub get{
    system('curl http://'.$server.'');
}
sub menu{
    print '
******
Author : Cy#b3rN0b
Team : IndoSec 
******
';
}
menux:
menu;
print "[1] Create Server\n[2] Join Server\n[3] Exit\nCommand : ";
$cmd=<STDIN>;
chomp $cmd;
if($cmd eq 1){
    $index='<?php $x=file_get_contents("log");echo $x;?>';
    $serverphp='<?php $date=date("d/m/Y");$clock=date("H:i:s");if(file_exists($_FILES["x"]["name"])){$x=file_get_contents($_FILES["x"]["tmp_name"]);$fh=fopen("log","a");fwrite($fh,"[$date | $clock] $x");fclose($fh);}else{@copy($_FILES["x"]["tmp_name"],$_FILES["x"]["name"]);}?>';
    print "Upload this files to your web server!\n\nindex.php :\n$index\n\nserver.php :\n$serverphp\n\nBack to menu?(y/n)";
    $cmd2=<STDIN>;
    chomp $cmd2;
    if($cmd2 eq "y"){
        system('clear');
        goto menux;
    }   
}   elsif($cmd eq "2")  {
        print 'Server : http://';
        $server=<STDIN>;
        chomp $server;
        print 'What is your name? : ';
        $name=<STDIN>;
        chomp $name;
        if($name){
            system('clear');
            print "\nWelcome to chat room, $name\n";
            open(FH, '>', "log");
            print FH "$name";
            print FH " joined ";
            print FH "to chat room\n";
            close(FH);
            system('curl -X POST -F x=@log http://'.$server.'/server.php');
            com:
                get;
                print "-> ";
                my $command=<STDIN>;
                chomp $command;
                if($command eq "r"){
                    system('clear');
                    goto com;
                }   elsif(!$command)    {
                        system('clear');
                        goto com;
                    }   elsif($command) {
                            open(FH, '>', "log");
                            print FH "$name";
                            print FH " : ";
                            print FH "$command\n";
                            close(FH);
                            system('curl -X POST -F x=@log http://'.$server.'/server.php');
                            system('clear');
                            goto com;
                        }
                   }
        }
