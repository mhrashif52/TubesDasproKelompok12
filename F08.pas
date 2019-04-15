(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)

Unit LihatBukuHilang; 
(* Definisi *) 
(* Admin bisa menuliskan command untuk menampilkan laporan buku yang hilang. *)
{ Format : ID Buku | Judul Buku | Tanggal Pelaporan }
(* $ lihat_laporan
	Buku yang hilang :
	2220 | Malam yang indah | 01/05/2019
	2516 | Clean Code | 28/02/2018
	3333 | Akal Sehat | 04/03/2019 *)

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
	type
		Hilang = record
			Us : string;
			Id : integer;
			TLap : string;
	end;
	var 
		hil : array [1..999] of Hilang;
		all : array [1..999] of Data;
		//Nmax : integer;
		
	{ Deklarasi Fungsi/Prosedur }
		procedure LihatLap (com : string);
	
implementation
	procedure LihatLap (com : string);
	{ Melihat laporan buku-buku yang hilang}
	begin
		system.Assign(UserFile,'kehilangan.csv');
		system.Append(UserFile);
		system.Assign(UserFile,'buku.csv');
		system.Append(UserFile);
		writeln('Ketik "Lihat buku hilang" untuk melihat daftar buku yang hilang');
		readln(com);
		if (com = 'Lihat buku hilang') then
			begin
				writeln('Buku yang hilang :');
					for i := 1 to 999 do
						begin
							if (hil[i].id = all[i].ID) then
								begin
									writeln(all[i].ID,' | ',all[i].ju,' | ',hil[i].Tlap);
								end;
						end;
			end;
	end;
	
end.
