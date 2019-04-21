unit F11;

interface

uses Record_Perpus,F13;

const
	NMax = 10000;

var

	readchar : Char;
	readline : string;
	
	// Variable to Read Buku.csv
	filebuku : textfile;
	fbuku : file of char;
	k, l : integer;
	lenBuku : longint;
	tipeDataBuku : integer;
	
	m, n : integer;
	

procedure RiwayatPengembalian(username : string);
	
	
implementation

procedure RiwayatPengembalian(username : string);
begin	
	// Menulis Riwayat
	for m := 1 to LoadNeffData.Kembali do
	begin
		if (username = arrDataKembali[m].username) then
		begin
			for n := 1 to LoadNeffData.Buku do
			begin
				if (arrDataBuku[n].idBuku = arrDataKembali[m].idBuku) then
				begin
					writeln(arrDataKembali[m].tanggalKembali.day,'/',arrDataKembali[m].tanggalKembali.month,'/',
					arrDataKembali[m].tanggalKembali.year,' | ',arrDataBuku[n].idBuku,' | ',arrDataBuku[n].judul);
				end;
			end;
		end;
	end;
	
	writeln('');
	writeln('');
	
end;
	
end.
	
