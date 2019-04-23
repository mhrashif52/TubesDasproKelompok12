(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)


Unit F08; 
(* Definisi *) 
(* Admin bisa menuliskan command untuk menampilkan laporan buku yang hilang. *)
{ Format : ID Buku | Judul Buku | Tanggal Pelaporan }
(* $ lihat_laporan
	Buku yang hilang :
	2220 | Malam yang indah | 01/05/2019
	2516 | Clean Code | 28/02/2018
	3333 | Akal Sehat | 04/03/2019 *)

interface
uses F13, record_perpus;

	var 
		i, j : integer;
		
	{ Deklarasi Fungsi/Prosedur }
		procedure LihatLap (var com : string);
	
implementation
	procedure LihatLap (var com : string);
	{ Melihat laporan buku-buku yang hilang}
	begin	
		if (com = 'Lihat buku hilang') then
			begin
				writeln('Buku yang hilang :');
					for i := 1 to LoadNeffData.Hilang do
					begin
						for j := 1 to LoadNeffData.Buku do
						begin
							if (arrDataHilang[i].idBuku = arrDataBuku[j].idBuku) then
							begin
								writeln(arrDataBuku[i].idBuku,' | ',arrDataBuku[i].judul,' | ',arrDataHilang[i].tanggalLaporan.day, '/',arrDataHilang[i].tanggalLaporan.month,'/',arrDataHilang[i].tanggalLaporan.year);
							end;
						end;
					end;
			end;
	end;
	
end.
