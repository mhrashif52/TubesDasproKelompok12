(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)

//Unit carikategori;
Program carikategori;
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

//interface
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
		//Nmax : integer;
	
	{ Deklarasi Fungsi/Prosedur }
	//	procedure ValidKat (kat : string);
		//procedure CariKat (kat : string);
		
//implementation
	procedure ValidKat (kat : string);
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
		i : integer; { indeks untuk traversal tabel }
		Pass : integer; { tahapan pengurutan }
		Temp : integer; { penampung nilai sementara, untuk pergeseran }
		//arr : array [1..10000] of integer;
		begin
			
		
		end;
		
		
		
	{ ALGORITMA }
		begin
			for Pass := 65 to 90 do
				begin
					Temp := T[pass].ju[1]; { Simpan harga T[Pass] sebelum pergeseran }
					{ Sisipkan elemen ke Pass dalam T[1..Pass-1] sambil menggeser:}
					i := Pass-1;
					while (Temp < T[i].ju[1]) and (i > 1) do
						begin
							T[i+1].ju[1] := T[i].ju[1]; { Geser }
							i := i – 1; { Berikutnya }
						end;
					{ Temp >= T[i] (tempat yg tepat) or i = 1 (sisipkan sbg elmt pertama) }
					if (Temp >= T[i]) then
						T[i+1] := Temp { Menemukan tempat yg tepat }
					else
						begin
							T[i+1] := T[i];
							T[i] := Temp; { sisipkan sbg elemen pertama }
						end; { T[1..Pass] terurut membesar: T[1]<=T[2]<=T[3]<=...<=T[Pass] }
				end;
					{ Seluruh tabel terurut, karena Pass = N: T[1]<=T[2]<=...<=T[N] }

		end;

	procedure CariKat (var kat : string);
	{ Mencari buku sesuai kategori };
		var
			count : integer;
		begin
			count := 0;
			ValidKat(kat);
			writeln('Hasil Pencarian');
				for i := 1 to 10000 do
					begin
						if (buku[i].kat = kat) then
							begin
								for j := 1 to 10000 do
									begin
										buku[i] := arrnew[j];
									end;
								count := count + 1;
								//writeln(buku.ID[i], ' | ', buku.Ju, ' | ', buku.Au);
						end else
							begin
								count := count;
								writeln('Tidak ada buku dalam kategori ini.');
							end;
					end;
				if (count > 0) then
					begin
						UrutLeksikografis(arrnew.ju[1]);
					end;
		end;

Carikat(buku);
