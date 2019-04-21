program tambah_jumlah_buku;
{ Melakukan penambahan jumlah buku sesuai dengan ID buku yang dimasukan }

{KAMUS}
type
	DataBuku = Record
		ID_Buku : Integer;
		Sisa_Buku : Integer;
		Nama_Buku : String;
	end;
var
	Tambah_Buku : Integer;
	InIDBuku : Integer;
	TambahBuku : file of DataBuku;
	data_buku : DataBuku;
	TabDataBk : array [1..1000000] of DataBuku;
	i : integer;
{ALGORITMA}
begin
	assign(TambahBuku, 'buku.csv');
	reset(TambahBuku);
	i := 1;
	repeat
		read(TambahBuku, data_buku);
		TabDataBk[i].ID_Buku := data_buku.ID_Buku;
		TabDataBk[i].Sisa_Buku := data_buku.Jumlah_Buku;
		TabDataBk[i].Nama_Buku := data_buku.Judul_Buku;
		i := i + 1;
	until (eof(PinjamBuku));
	write('Masukan ID Buku: ');
	readln(InIDBuku);
	write('Masukkan jumlah buku yang ditambahkan: ');
	readln(Tambah_Buku);
	while (InIDBuku = TabDataBk[i].ID_Buku) do
	begin
	TabDataBk[i].Sisa_Buku := TabDataBk[i].Sisa_Buku + Tambah_Buku;
	end;
	writeln('Pembaharuan jumlah buku berhasil dilakukan, total buku', TabDataBk[i].Nama_Buku, 'di perpustakan menjadi ', TabDataBk[i].Sisa_Buku)
end.
	
	
