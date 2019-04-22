unit F07;
{Unit yang berguna untuk melaporkan berkas hilang}

interface
	uses Record_Perpus, F13;
	procedure laporHilang(var arrDataHilang : array of DataHilang);
	
implementation
	procedure laporHilang(var arrDataHilang : array of DataHilang);
		var
			JudulBuku_Dummy : string;
			
		begin
			LoadNeffData.Hilang := LoadNeffData.Hilang + 1;
			arrDataHilang[LoadNeffData.Hilang].username := usernameLogin;
			write('Masukkan id buku: ');
			readln(arrDataHilang[LoadNeffData.Hilang].idBuku_Hilang);
			write('Masukkan judul buku: ');
			readln(JudulBuku_Dummy);
			write('Masukkan tanggal pelaporan: ');
			readln(arrDataHilang[LoadNeffData.Hilang].Tanggal_Laporan);
			writeln('');
			writeln('Laporan berhasil diterima.');
		end;
end.
