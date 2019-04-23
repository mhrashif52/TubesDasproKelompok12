Unit F15;
{Mencari data diri anggota perpustakaan dilakukan validasi terlebih 
* apakah username terdaftar ke dalam database perpustakaan }

interface
uses F13, record_perpus;
{type
	DataUser = Record
		Username : String;
		Nama : String;
		Alamat : String;
	end;}
var
	//data_user : Akun;
	InUsername : String;
	//TabDataUser : Array [1..1000000] of Akun;
	i : Integer;
	
	procedure CariDataDiri (var InUsername : string);

{ ALGORITMA }
implementation
procedure CariDataDiri (var InUsername : string);
begin
	{i := 1;
	repeat
		read(CariUser, data_user);
		TabDataUser[i].Username := data_user.Username;
		TabDataUser[i].Nama := data_user.Nama;
		TabDataUser[i].Alamat := data_user.Alamat;
		i := i + 1;
	until (eof(CariUser));
	Write('Masukkan Username: ');
	readln(InUsername);}
	for i := 1 to 10000 do;
		begin
			if (InUsername = arrDataAkun[i].Username) then
				begin
					writeln('Nama Anggota: ', arrDataAkun[i].Nama);
					writeln('Alamat Anggota: ', arrDataAkun[i].Alamat);
			end else if (InUsername <> arrDataAkun[i].Username) then
				begin
					writeln('Pengguna tidak ditemukan');
				end;
		end;
end;
end.
