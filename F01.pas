unit F1;

interface

type
	user = record
		nama : string;
		alamat : string;
		username : string;
		password : string;
	end;
	

var
	// Variables to Write
	userfile : text;
	textline : string;
	role : string;
	
procedure registerAkun (var InputUser : user);


implementation

procedure registerAkun (Var InputUser : user);
begin

setLength(textline, 1000000);

write('Masukkan nama pengunjung: ');
readln(InputUser.nama);
write('Masukkan alamat pengunjung: ');
readln(InputUser.alamat);
write('Masukkan username pengunjung: ');
readln(InputUser.username);
write('Masukkan password pengunjung: ');
readln(InputUser.password);
role := 'pengunjung';

		
textline := InputUser.nama + ',' + InputUser.alamat + ',' +
	InputUser.username + ',' + InputUser.password + ',' + role + ',';

system.Assign(userfile, 'user.csv');
system.Append(userfile);
writeln(userfile,textline);

Close(userfile);
end; // Akhir dari Procedure registerAkun

end. // Akhir dari Unit Register