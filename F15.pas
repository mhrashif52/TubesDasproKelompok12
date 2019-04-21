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
		TabDataBk[i].Username := data_user.Username;
		TabDataBk[i].Nama := data_user.Nama;
		TabDataBk[i].Alamat := data_user.Alamat;
		i := i + 1;
	until (eof(PinjamBuku));
	Write('Masukkan Username: ');
	readln(InUsername);
	while (InUsername = TabDataBk[i].Username) do
	writeln('Nama Anggota: ', TabDataBk[i].Nama);
	writeln('Alamat Anggota: ', TabDataBk[i].Alamat);
end.
