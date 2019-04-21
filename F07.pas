unit F07;
{Unit yang berguna untuk melaporkan berkas hilang}

interface
	uses Record_Perpus;
	procedure laporHilang(var arrDataHilang : array of DataHilang);
	
implementation
	procedure laporHilang(var arrDataHilang : array of DataHilang);
		var
			JudulBuku_Dummy : string;
			
		begin
			nefDataHilang := nefDataHilang + 1;
			arrDataHilang[nefDataHilang].username := usernameLogin;
			write('Masukkan id buku: ');
			readln(arrDataHilang[nefDataHilang].idBuku_Hilang);
			write('Masukkan judul buku: ');
			readln(JudulBuku_Dummy);
			write('Masukkan tanggal pelaporan: ');
			readln(arrDataHilang[nefDataHilang].Tanggal_Laporan);
			writeln('');
			writeln('Laporan berhasil diterima.');
		end;
end.
