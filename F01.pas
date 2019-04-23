unit F01;

interface

uses Record_Perpus,F13;	

var
	// Variables to Write
	Akunfile : text;
	textline : string;
	role : string;
	arrNewAkun : array [1..NMax] of Akun;
	
procedure registerAkun;

procedure updateRegisterAkun(InputAkun : Akun);

implementation

procedure registerAkun;

begin

write('Masukkan nama pengunjung: ');
readln(InputAkun.nama);
write('Masukkan alamat pengunjung: ');
readln(InputAkun.alamat);
write('Masukkan username pengunjung: ');
readln(InputAkun.username);
write('Masukkan password pengunjung: ');
readln(InputAkun.password);
InputAkun.role := 'pengunjung';

NeffAkunBaru := NeffAkunBaru + 1;
arrNewAkun[NeffAkunBaru].nama := InputAkun.nama;
arrNewAkun[NeffAkunBaru].alamat := InputAkun.alamat;
arrNewAkun[NeffAkunBaru].username := InputAkun.username;
arrNewAkun[NeffAkunBaru].password := InputAkun.password;
arrNewAkun[NeffAkunBaru].role := InputAkun.role;



end;

procedure updateRegisterAkun(InputAkun : Akun);
var
	i : integer;
begin
system.Assign(Akunfile, 'user.csv');
system.Append(Akunfile);
for i:=1 to NeffAkunBaru do
begin
	textline := arrNewAkun[i].nama + ',' + arrNewAkun[i].alamat + ',' +
	arrNewAkun[i].username + ',' + arrNewAkun[i].password + ',' + arrNewAkun[i].role + ',';
	writeln(Akunfile,textline);
end;

Close(Akunfile);
end; // Akhir dari Procedure registerAkun

end. // Akhir dari Unit Register
