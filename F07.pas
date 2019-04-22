unit F07;
{Unit yang berguna untuk melaporkan berkas hilang}

interface
	uses Record_Perpus, F13;
	procedure laporHilang(var arrDataHilang : array of DataHilang);
	
implementation
	procedure laporHilang(var arrDataHilang : array of DataHilang);
		var
			JudulBuku_Dummy : string;
			tanggalTemp : string;
			
		begin
			LoadNeffData.Hilang := LoadNeffData.Hilang + 1;
			arrDataHilang[LoadNeffData.Hilang].username := usernameLogin;
			write('Masukkan id buku: ');
			readln(arrDataHilang[LoadNeffData.Hilang].idBuku);
			write('Masukkan judul buku: ');
			readln(JudulBuku_Dummy);
			write('Masukkan tanggal pelaporan: ');
			readln(tanggalTemp);
			arrDataHilang[LoadNeffData.Hilang].tanggalLaporan.day := tanggalTemp[1] + tanggalTemp[2];
			arrDataHilang[LoadNeffData.Hilang].tanggalLaporan.month := tanggalTemp[4] + tanggalTemp[5];
			arrDataHilang[LoadNeffData.Hilang].tanggalLaporan.year := tanggalTemp[7] + tanggalTemp[8] + tanggalTemp[9] + tanggalTemp[10];
			writeln('');
			writeln('Laporan berhasil diterima.');
		end;
end.
