program cari_anggota;
{Mencari data diri anggota perpustakaan dilakukan validasi terlebih 
* apakah username terdaftar ke dalam database perpustakaan }

{ KAMUS }
type
	DataUser = Record
		Username : String;
		Nama : String;
		Alamat : String;
	end;
var
	CariUser : file of DataUser;
	data_user : DataUser;
	InUsername : String;
	TabDataUser : Array [1..1000000] of DataUser;
	i : Integer;

{ ALGORITMA }
begin
	assign(CariUser, 'user.csv');
	reset(CariUser);
	i := 1;
	repeat
		read(CariUser, data_user);
		TabDataUser[i].Username := data_user.Username;
		TabDataUser[i].Nama := data_user.Nama;
		TabDataUser[i].Alamat := data_user.Alamat;
		i := i + 1;
	until (eof(CariUser));
	Write('Masukkan Username: ');
	readln(InUsername);
	if (InUsername = TabDataUser[i].Username) then
	begin
		writeln('Nama Anggota: ', TabDataUser[i].Nama);
		writeln('Alamat Anggota: ', TabDataUser[i].Alamat);
	end
	else if (InUsername <> TabDataUser[i].Username) then
	begin
		writeln('Pengguna tidak ditemukan');
	end
end.
