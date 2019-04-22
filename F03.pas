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
	type
		Data = record
			ID : integer;
			Ju : string;
			Au : string;
			Jm : integer;
			Tp : string;
			Kat : string;
	end;
	var 
		buku, arrnew : array [1..10000] of Data;
		i, j : integer;
		stop : boolean;
		Kat : string;
		//Nmax : integer;
	
	{ Deklarasi Fungsi/Prosedur }
	procedure ValidKat (var kat : string);
	procedure UrutLeksikografis (var T : array of Data);
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
	
	procedure UrutLeksikografis (var T : array of Data);
	{ Mengurutkan keluaran pencarian secara urut seperti pada kamus }
		{Kamus Lokal}
		var
		i,j,k, temp1, panjang : integer;
		Temp2, Temp3 : string;	
		TdkSama : boolean;
		{ ALGORITMA }
		begin
		j := 0;
		for k := 1 to 10000 do
			begin
				for j := 1 to 10000 do
					begin
						TdkSama := False;
						if (length(T[j].ju) > length(T[j+1].ju)) then
							begin
								panjang := length(T[j+1].ju);
						end else
							begin
								panjang := length(T[j].ju);
						end;
						i := 1;
						while (TdkSama = False) and (i < panjang) do
							begin
								if (integer(T[j].ju[i]) > integer(T[j+1].ju[i])) then
									begin
										i := i + 1;
								end else if (integer(T[j].ju[i])) = integer(T[j+1].ju[i]) then
									begin
										temp1 := T[j].id;
										temp2 := T[j].ju;
										temp3 := T[j].au;
										T[j].id := T[j+1].id;
										T[j].ju := T[j+1].ju;
										T[j].au := T[j+1].au;
										T[j+1].id := temp1;
										T[j+1].ju := temp2;
										T[j+1].au := temp3;
										TdkSama := True;
								end else
									begin
										TdkSama := True;
									end;
							end;
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
				for i := 1 to 10000 do
					begin
						if (buku[i].kat = kat) then
							begin
								buku[i].ID := arrnew[j].ID;
								buku[i].Ju := arrnew[j].Ju;
								buku[i].Au := arrnew[j].Au;
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
						UrutLeksikografis(arrnew);
				end else
					begin
						writeln('Tidak ada buku dalam kategori ini.');
					end;
		end;
end.

