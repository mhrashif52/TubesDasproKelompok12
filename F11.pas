unit F11;

interface

const
	NMax = 10000;

type
	Date = record
	day : string;
	month : string;
	year : string;
end;

	DataPeminjaman = record
	idBuku : string;
	username : string;
	judul : string;
	datePinjam : Date;
	batasKembali : Date;

end;

	DataBuku = record
	idBuku : string;
	judul : string;
	author : string;
	jumlah : string;
	tahunterbit : string;
	kategori : string;
end;

var
	arrDataPeminjaman : array [1..NMax] of DataPeminjaman;
	arrDataBuku : array [1..NMax] of DataBuku;
	
	readchar : Char;
	readline : string;
	
	// Variables to Read Pengembalian.csv
	filepengembalian : textfile;
	fkembali : file of char;
	i, j, dmyCounter : integer;
	lenKembali : longint;
	tipeDataKembali : integer;
	newLineYearCounter : integer;
	
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

// Algorithm to Read Pengembalian.csv

// Mencari Banyak Characters pada file Pengembalian
system.Assign(fkembali, 'pengembalian.csv');
system.Reset(fkembali);
lenKembali := FileSize(fkembali);
Close(fkembali);
// Akhir dari Mencari banyak characters

i := 1; // Untuk Index array arrDataPeminjaman
j := 1; // Untuk mendeteksi pembacaan char keberapa pada file filepengembalian
tipeDataKembali := 1;
newLineYearCounter := 0;
dmyCounter := 1;

system.Assign(filepengembalian, 'pengembalian.csv');
system.Reset(filepengembalian);

readln(filepengembalian,readline); // Skip line pertama

read(filepengembalian, readchar);

repeat 

	case tipeDataKembali of
	
	1 : begin
		if ( (readchar = ',') and (j < lenKembali) ) then
		begin
			read(filepengembalian, readchar);
			j := j + 1;
			tipeDataKembali := tipeDataKembali + 1;
		end;
		
		while ( (readchar <> ',') and (j < lenKembali) and (tipeDataKembali = 1) ) do
		begin
		
			arrDataPeminjaman[i].username := arrDataPeminjaman[i].username + readchar;
			read(filepengembalian, readchar);
			j := j + 1;
		end;
		
		end;
		
	2 : begin
		if ( (readchar = ',') and (j < lenKembali) ) then
		begin
			read(filepengembalian, readchar);
			j := j + 1;
			tipeDataKembali := tipeDataKembali + 1;
		end;
		
		while ( (readchar <> ',') and (j < lenKembali) and (tipeDataKembali = 2) ) do
		begin
		
			arrDataPeminjaman[i].idBuku := arrDataPeminjaman[i].idBuku + readchar;
			read(filepengembalian, readchar);
			j := j + 1;
		end;
		
		end;
		
	3 : begin
		
		if ( (readchar = '/') ) then
		begin
			dmyCounter := dmyCounter + 1;
			read(filepengembalian,readchar);
			j := j + 1;
		end;
		
		while ( (readchar <> ',') and (readchar <> '/') and (j < lenKembali) and (tipeDataKembali = 3) ) do
		begin
			
			if (dmyCounter = 1) then
			begin
				arrDataPeminjaman[i].batasKembali.day := arrDataPeminjaman[i].batasKembali.day + readchar;
				read(filepengembalian, readchar);
				j := j + 1;
			end else if (dmyCounter = 2) then
			begin
				arrDataPeminjaman[i].batasKembali.month := arrDataPeminjaman[i].batasKembali.month + readchar;
				read(filepengembalian, readchar);
				j := j + 1;
			end else
			begin
				arrDataPeminjaman[i].batasKembali.year := arrDataPeminjaman[i].batasKembali.year + readchar;
				newLineYearCounter := newLineYearCounter + 1;
				if (newLineYearCounter = 4) then
				begin
					newLineYearCounter := 0;
					tipeDataKembali := 1;
					dmyCounter := 1;
					i := i + 1;
				end;
				read(filepengembalian, readchar);
				j := j + 1;
			end;
		end;
		
		if ( (readchar = ',') and (j < lenKembali) ) then
		begin
			readln(filepengembalian, readchar); // Next Line (Untuk Menghindari 'new line' dalam Array
			read(filepengembalian, readchar);
			j := j + 1;
			tipeDataKembali := 1;
		end;
		
		end;
	
	end;
until (j >= lenKembali);
		
Close(filepengembalian);

// Algorithm to Read Buku.csv

system.Assign(fbuku, 'buku.csv');
system.Reset(fbuku);
lenBuku := FileSize(fbuku);
Close(fbuku);
k := 1; // Untuk Index array arrDataBuku
l := 1; // Untuk menandai pembacaan char keberapa pada file buku
tipeDataBuku := 1;


system.Assign(filebuku, 'buku.csv');
system.Reset(filebuku);

readln(filebuku,readline);

read(filebuku,readchar);

repeat 

	case tipeDataBuku of
	
	1 : 
		begin
		if ( (readchar = ',') and (l < lenBuku) ) then
		begin
			read(filebuku, readchar);
			l := l + 1;
			tipeDataBuku := tipeDataBuku + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 1) ) do
		begin
		
			arrDataBuku[k].idBuku := arrDataBuku[k].idBuku + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		end;
		
	2 : 
		begin
		if ( (readchar = ',') and (l < lenBuku) ) then
		begin
			read(filebuku, readchar);
			l := l + 1;
			tipeDataBuku := tipeDataBuku + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 2) ) do
		begin
		
			arrDataBuku[k].judul := arrDataBuku[k].judul + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		end;
	3 : 
		begin
		if ( (readchar = ',') and (l < lenBuku) ) then
		begin
			read(filebuku, readchar);
			l := l + 1;
			tipeDataBuku := tipeDataBuku + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 3) ) do
		begin
		
			arrDataBuku[k].author := arrDataBuku[k].author + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;	
		
		end;
		
	4 : begin
		if ( (readchar = ',') and (l < lenBuku) ) then
		begin
			read(filebuku, readchar);
			l := l + 1;
			tipeDataBuku := tipeDataBuku + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 4) ) do
		begin
		
			arrDataBuku[k].jumlah := arrDataBuku[k].jumlah + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		end;
		
	5 : begin
		if ( (readchar = ',') and (l < lenBuku) ) then
		begin
			read(filebuku, readchar);
			l := l + 1;
			tipeDataBuku := tipeDataBuku + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 5) ) do
		begin
		
			arrDataBuku[k].tahunterbit := arrDataBuku[k].tahunterbit + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		end;
	
	6 : begin
		if ( (readchar = ',') and (l < lenBuku) ) then // The Problem is here,  just realized that ',' is not the separator between two lines in csv. Must add other parameter or something.
		begin
			tipeDataBuku := 1;
			k := k + 1;
			readln(filebuku, readchar); // Next Line (Untuk Menghindari 'new line' dalam Array
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		while ( (readchar <> ',') and (l < lenBuku) and (tipeDataBuku = 6) ) do
		begin
			arrDataBuku[k].kategori := arrDataBuku[k].kategori + readchar;
			read(filebuku, readchar);
			l := l + 1;
		end;
		
		{readln(filebuku,readline);
		arrDataBuku[k].kategori := readline;
		l := l + length(arrDataBuku[k].kategori);
		tipeDataBuku := 1;
		readln(filebuku,readchar);
		l := l + 1;}
		
		
		end;
	
	end; // End of Case tipeDataBuku
	
until (l >= lenBuku);

Close(filebuku);
	
	// Menulis Riwayat
	for m := 1 to i-1 do
	begin
		if (username = arrDataPeminjaman[m].username) then
		begin
			for n := 1 to k-1 do
			begin
				if (arrDataBuku[n].idBuku = arrDataPeminjaman[m].idBuku) then
				begin
					writeln(arrDataPeminjaman[m].batasKembali.day,'/',arrDataPeminjaman[m].batasKembali.month,'/',
					arrDataPeminjaman[m].batasKembali.year,' | ',arrDataBuku[n].idBuku,' | ',arrDataBuku[n].judul);
				end;
			end;
		end;
	end;
	
	writeln('');
	writeln('');
	
	// Check The Unit
	
	{writeln('Data Peminjaman');
	for n := 1 to i-1 do
	begin
		writeln('Username 			  : ', arrDataPeminjaman[n].username);
		writeln('ID Buku 			  : ', arrDataPeminjaman[n].idBuku);
		writeln('Tanggal Pengembalian : ', arrDataPeminjaman[n].batasKembali.day,'/',arrDataPeminjaman[n].batasKembali.month,'/',arrDataPeminjaman[n].batasKembali.year);
		writeln('');
	end;
	
	
	
	writeln('');
	writeln('Data Buku');
	for m := 1 to k-1 do
	begin
		writeln('ID Buku    			: ', arrDataBuku[m].idBuku);
		writeln('Judul Buku 			: ', arrDataBuku[m].judul);
		writeln('Author                 : ', arrDataBuku[m].author);
		writeln('Jumlah di Perpustakaan : ', arrDataBuku[m].jumlah);
		writeln('Tahun Terbit 			: ', arrDataBuku[m].tahunterbit);
		writeln('Kategori				: ', arrDataBuku[m].kategori);
		writeln('');
	end;	}
	
end;
	
end.
	
