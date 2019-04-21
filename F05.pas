program pinjam_buku;
{Program untuk melakukan peminjaman buku, Untuk melakukan peminjaman 
* pengunjung harus login terlebih dahulu. Dapat diasumsikan id buku dan 
* tanggal yang dimasukkan valid. Namun, bisa saja buku yang ingin 
* dipinjam sedang habis (out of stock). }

{KAMUS}
type
	Waktu = Record
		Tanggal: Integer;
		Bulan : Integer;
		Tahun	: Integer;
	DataBuku : Record
		ID_Buku : Integer;
		Sisa_Buku : Integer;
		Nama_Buku : String;
	end;
end;
var
	PinjamBuku : file of DataBuku;
	data_buku : DataBuku;
	W : Waktu;
	InIDBuku : Integer;
	TabDataBk : array [1..1000000] of DataBuku;
	i : integer;
	stop : boolean;
	
{ALGORITMA}
begin
	assign(PinjamBuku, 'buku.csv');
	reset(PinjamBuku);
	i := 1;
	repeat
		read(PinjamBuku, data_buku);
		TabDataBk[i].ID_Buku := data_buku.ID_Buku;
		TabDataBk[i].Sisa_Buku := data_buku.Jumlah_Buku;
		TabDataBk[i].Nama_Buku := data_buku.Judul_Buku;
		i := i + 1;
	until (eof(PinjamBuku));
	stop := False;
	write('Masukkan id buku yang ingin dipinjam: ');
	readln(InIDBUKU);
	repeat
	write('Masukkan tanggal hari ini: ');
	read(Waktu.Tanggal);
	write('/');
	read(Waktu.Bulan);
	write('/');
	readln(Waktu.Tahun);
	if ((Waktu.Tanggal < 0 or Waktu.Tanggal > 31) or (Waktu.Bulan < 0 or Waktu.Bulan > 12) or (Waktu.Tahun < 0)) then
	begin
		writeln('Waktu yang anda masukkan tidak valid, coba isikan kembali');
		stop := false;
	end
	else if ((Waktu.Tanggal > 0 and Waktu.Tanggal < 31) and (Waktu.Bulan > 0 and Waktu.Bulan < 12) and (Waktu.Tahun > 0)) then
	begin
		stop := true;
	end
	until (stop);
	if (InIDBuku = TabDataBk[i].Nama_Buku) then
	begin
		if (TabDataBk[i].Sisa_Buku > 0) then
		begin
			Writeln('Buku', TabDataBk[i].Nama_Buku, 'berhasil dipinjam!');
			Writeln('Tersisa', TabDataBk[i].Sisa_Buku, 'buku',  TabDataBk[i].Nama_Buku);
			Writeln('Terima kasih sudah meminjam.');
		end
		else {Sisa_Buku <= 0} 
		begin
			Writeln('Buku', TabDataBk[i].Nama_Buku, 'sedang habis!');
			Writeln('Coba lain kali');
	end;
	else if (InIDBuku <> TabDataBk[i].Nama_Buku) then
	begin
		Writeln('Buku yang anda cari tidak ditemukan');
	end
	close (PinjamBuku);
end.
	
	

