(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)

Unit F03;
//Program carikategori;
(* Definisi *) 
(* Pengunjung dan admin dapat melakukan pencarian buku berdasarkan kategori. Terdapat lima
kategori buku sastra, sains, manga, sejarah, dan programming. Hasil pencarian yang
ditampilkan adalah ID buku, judul buku, dan penulis buku yang diurutkan berdasarkan judul
secara leksikografis (pengurutan seperti kamus). *) 
{ Format output: ID Buku | Judul Buku | Penulis Buku }
(* 	Masukkan kategori: programming
	Hasil pencarian:
	2516 | Clean Code | Robert C. Martin *)
(* 	Masukkan kategori: Programming
	Kategori Programming tidak valid.
	Masukkan kategori: programming
	Hasil pencarian:
	Tidak ada buku dalam kategori ini.*)

interface
uses F13, record_perpus;
	var 
		buku, arrnew : array [1..NMax] of DataBuku;
		i, j : integer;
		stop : boolean;
		Kat : string;
		//Nmax : integer;
	
	{ Deklarasi Fungsi/Prosedur }
	procedure ValidKat (var kat : string);
	procedure UrutLeksikografis (var T : array of DataBuku; cou : integer);
	procedure CariKat (var kat : string);
		
implementation
	procedure ValidKat (var kat : string);
	{ Kategori yang dimasukkan belum tentu valid, jadi lakukan input 
	hingga kategori valid (merupakan salah satu dari 5 kategori.}
		begin
			stop := false;
			repeat
				write('Masukkan kategori: ');
				readln(kat);
				if (kat = 'programming') or (kat = 'sastra') or (kat = 'manga') or (kat = 'sejarah') or (kat = 'sains') then
					begin
						stop := true;
				end else 
					begin
						writeln('Kategori Programming tidak valid'); 
					end;
			until stop; 
		end;
	
	procedure UrutLeksikografis (var T : array of DataBuku; cou : integer);
	{ Mengurutkan keluaran pencarian secara urut seperti pada kamus }
		{Kamus Lokal}
		var
		i,j,k,len : integer;
		tempoid,tempoju, tempoau, tempo1,tempo2, tempo3 : string;	
		Cek : boolean;
		{ ALGORITMA }
		begin
		i := 0;
		for k := 1 to cou do
			begin
				for i := 1 to cou do
					begin
						Cek := False;  //Cek diinisiasi false
						if (length(T[i].judul) > length(T[i+1].judul)) then
							begin
								len := length(T[i+1].judul);
						end else if (length(T[i].judul) = length(T[i+1].judul)) then
							begin
								len := length(T[i].judul);
								tempoid := T[i].idBuku;
								T[i].idBuku := T[i+1].idBuku;
								T[i+1].idBuku := tempoid;
								tempoju := T[i].judul;
								T[i].judul := T[i+1].judul;
								T[i+1].judul := tempoju;
								tempoau := T[i].author;
								T[i].author := T[i+1].author;
								T[i+1].author := tempoau;
						end else
							begin
								len := length(T[i].judul);
						end;
						j := 1;
						repeat
								if (integer(T[i].judul[j]) = integer(T[i+1].judul[j])) then
									begin
										j := j + 1;
								end else if (integer(T[i].judul[j])) > integer(T[i+1].judul[j]) then
									begin
										tempo1 := T[i].idBuku;
										T[i].idBuku := T[i+1].idBuku;
										T[i+1].idBuku := tempo1;
										tempo2 := T[i].judul;
										T[i].judul := T[i+1].judul;
										T[i+1].judul := tempo2;
										tempo3 := T[i].author;
										T[i].author := T[i+1].author;
										T[i+1].author := tempo3;
										Cek := True;
									end else
										begin
											Cek := True;
										end;
						 until ((Cek = True) or (j >= len));
					end;
			end;	
		end;

	procedure CariKat (var kat : string);
	{ Mencari buku sesuai kategori }
		var
			count : integer;
		begin
			j := 0;
			count := 0;
			ValidKat(kat);
			writeln('Hasil Pencarian');
				for i := 1 to LoadNeffData.Buku do
					begin
						if (arrDataBuku[i].kategori = kat) then
							begin
								arrDataBuku[i].idBuku := arrnew[j].idBuku;
								arrDataBuku[i].judul := arrnew[j].judul;
								arrDataBuku[i].author := arrnew[j].author;
								j := j + 1;
								count := count + 1;
								//writeln(buku.ID[i], ' | ', buku.Ju, ' | ', buku.Au);
						end else
							begin
								count := count;
							end;
					end;
				if (count > 0) then
					begin
						UrutLeksikografis(arrnew,count);
				end else
					begin
						writeln('Tidak ada buku dalam kategori ini.');
					end;
		end;
end.

