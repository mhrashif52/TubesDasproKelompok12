unit F06;

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
	status : string;

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

	// Variable of Arrays	
	arrDataPeminjaman : array [1..NMax] of DataPeminjaman;
	arrDataBuku : array [1..NMax] of DataBuku;
	
	// Variable to Read Char or Line from csv file
	readchar : Char;
	readline : string;
	
	// Variables to Read Peminjaman.csv
	filepeminjaman : textfile;
	f : file of char;
	i, j, dmyCounter : integer;
	lenPeminjaman : longint;
	tipeDataPeminjaman : integer;
	newLineYearCounter : integer;
	
	// Variable to Read Buku.csv
	filebuku : textfile;
	fbuku : file of char;
	k, l : integer;
	lenBuku : longint;
	tipeDataBuku : integer;

	// Variable to Connect Between two Arrays
	notFound : boolean;
	m : integer;
	bookTitleFromID : string;

	// Variable to Determine whether someone is late or not
	dateNow : string;
	dateNowDay : integer;
	dateNowMonth : integer;
	dateNowYear : integer;
	batasDay : integer;
	batasMonth : integer;
	batasYear : integer;
	strBatasDay : string;
	strBatasMonth : string;
	strBatasYear : string;
	pesan : string;
	pesanTelat : string;
	

procedure Pengembalian(username : string; id : string);
	
	
implementation

procedure Pengembalian(username : string; id : string);
begin

system.Assign(f, 'peminjaman.csv');
system.Reset(f);
lenPeminjaman := FileSize(f);
Close(f);
i := 1;
j := 1;

tipeDataPeminjaman := 1;
newLineYearCounter := 0;
dmyCounter := 1;

system.Assign(filepeminjaman, 'peminjaman.csv');
system.Reset(filepeminjaman);

readln(filepeminjaman,readline);

read(filepeminjaman, readchar);

repeat 

	case tipeDataPeminjaman of
	
	1 : begin
	
		if ( (readchar = ',') and (j < lenPeminjaman) ) then
		begin
			read(filepeminjaman, readchar);
			j := j + 1;
			tipeDataPeminjaman := tipeDataPeminjaman + 1;
		end;
		
		while ( (readchar <> ',') and (j < lenPeminjaman) and (tipeDataPeminjaman = 1) ) do
		begin
		
			arrDataPeminjaman[i].username := arrDataPeminjaman[i].username + readchar;
			read(filepeminjaman, readchar);
			j := j + 1;
		end;
	
		end;
		
	2 : begin
	
		if ( (readchar = ',') and (j < lenPeminjaman) ) then
		begin
			read(filepeminjaman, readchar);
			j := j + 1;
			tipeDataPeminjaman := tipeDataPeminjaman + 1;
		end;
		
		while ( (readchar <> ',') and (j < lenPeminjaman) and (tipeDataPeminjaman = 2) ) do
		begin
		
			arrDataPeminjaman[i].idBuku := arrDataPeminjaman[i].idBuku + readchar;
			read(filepeminjaman, readchar);
			j := j + 1;
		end;
		
		end;
		
	3 : begin
		
		if ( (readchar = '/') ) then
		begin
			dmyCounter := dmyCounter + 1;
			read(filepeminjaman,readchar);
			j := j + 1;
		end;
		
		while ( (readchar <> ',') and (readchar <> '/') and (j < lenPeminjaman) and (tipeDataPeminjaman = 3) ) do
		begin
			
			if (dmyCounter = 1) then
			begin
				arrDataPeminjaman[i].datePinjam.day := arrDataPeminjaman[i].datePinjam.day + readchar;
				read(filepeminjaman, readchar);
				j := j + 1;
			end else if (dmyCounter = 2) then
			begin
				arrDataPeminjaman[i].datePinjam.month := arrDataPeminjaman[i].datePinjam.month + readchar;
				read(filepeminjaman, readchar);
				j := j + 1;
			end else
			begin
				arrDataPeminjaman[i].datePinjam.year := arrDataPeminjaman[i].datePinjam.year + readchar;
				newLineYearCounter := newLineYearCounter + 1;
				if (newLineYearCounter = 4) then
				begin
					newLineYearCounter := 0;
					dmyCounter := 1;
				end;
				read(filepeminjaman, readchar);
				j := j + 1;
			end;
		end;
		
		if ( (readchar = ',') and (j < lenPeminjaman) ) then
		begin
			read(filepeminjaman, readchar);
			j := j + 1;
			tipeDataPeminjaman := tipeDataPeminjaman + 1;
		end;
		
		end;
		
	4 : begin
		
		if ( (readchar = '/') ) then
		begin
			dmyCounter := dmyCounter + 1;
			read(filepeminjaman,readchar);
			j := j + 1;
		end;
		
		while ( (readchar <> ',') and (readchar <> '/') and (j < lenPeminjaman) and (tipeDataPeminjaman = 4) ) do
		begin
			
			if (dmyCounter = 1) then
			begin
				arrDataPeminjaman[i].batasKembali.day := arrDataPeminjaman[i].batasKembali.day + readchar;
				read(filepeminjaman, readchar);
				j := j + 1;
			end else if (dmyCounter = 2) then
			begin
				arrDataPeminjaman[i].batasKembali.month := arrDataPeminjaman[i].batasKembali.month + readchar;
				read(filepeminjaman, readchar);
				j := j + 1;
			end else
			begin
				arrDataPeminjaman[i].batasKembali.year := arrDataPeminjaman[i].batasKembali.year + readchar;
				newLineYearCounter := newLineYearCounter + 1;
				if (newLineYearCounter = 4) then
				begin
					newLineYearCounter := 0;
					dmyCounter := 1;
				end;
				read(filepeminjaman, readchar);
				j := j + 1;
			end;
		end;
		
		if ( (readchar = ',') and (j < lenPeminjaman) ) then
		begin
			read(filepeminjaman, readchar);
			j := j + 1;
			tipeDataPeminjaman := tipeDataPeminjaman + 1;
		end;
		

		end;
	
	5 : begin
	
		if ( (readchar = ',') and (j < lenPeminjaman) ) then
		begin
			readln(filepeminjaman, readchar);
			read(filepeminjaman, readchar);
			j := j + 1;
			i := i + 1;
			tipeDataPeminjaman := 1;
		end;
		
		while ( (readchar <> ',') and (j < lenPeminjaman) and (tipeDataPeminjaman = 5) ) do
		begin
		
			arrDataPeminjaman[i].status := arrDataPeminjaman[i].status + readchar;
			read(filepeminjaman, readchar);
			j := j + 1;
		end;
		
		end;
		
	
	end; // End of Case tipeDataPeminjaman
until (j >= lenPeminjaman);
		
Close(filepeminjaman);


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
		if ( (readchar = ',') and (l < lenBuku) ) then 
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

	{writeln(arrDataPeminjaman[1].username);
	writeln(arrDataPeminjaman[1].idBuku);
	writeln(arrDataPeminjaman[1].datePinjam.day);
	writeln(arrDataPeminjaman[1].batasKembali.day);
	writeln('');
	writeln(arrDataPeminjaman[2].username);} // Testing the Array of Database
	
	notFound := True;

	for m := 1 to k do
	begin
		if (id = arrDataBuku[m].idBuku) then
		begin
			bookTitleFromID := arrDataBuku[m].judul;
		end;
	end;


	m := 1;

	while (notFound and (m <= i)) do
	begin

	if (arrDataPeminjaman[m].username = username) and (arrDataPeminjaman[m].idBuku = id) and (arrDataPeminjaman[m].status = 'belum') then
	begin
		writeln('Data Peminjaman : ');
		writeln('Username : ', username);
		writeln('Judul Buku : ', bookTitleFromID);
		writeln('Tanggal Peminjaman : ', arrDataPeminjaman[m].datePinjam.day,'/',arrDataPeminjaman[m].datePinjam.month,
		'/', arrDataPeminjaman[m].datePinjam.year);
		writeln('Tanggal Batas Pengembalian : ', arrDataPeminjaman[m].batasKembali.day,'/',arrDataPeminjaman[m].batasKembali.month,
		'/', arrDataPeminjaman[m].batasKembali.year);

		arrDataPeminjaman[m].status := 'sudah';
		notFound := False;
		strBatasDay := arrDataPeminjaman[m].batasKembali.day;
		strBatasMonth := arrDataPeminjaman[m].batasKembali.month;
		strBatasYear := arrDataPeminjaman[m].batasKembali.year;
	end;
	m := m + 1;

	end; // End of While (notFound)

	if (notFound) then
	begin
		writeln('Data Peminjaman Tidak Ditemukan');
	end else
	begin
	writeln('');
	write('Masukan tanggal hari ini : ');
	readln(dateNow); // 12/45/789-10
	end;

	// Date Analysis with ASCII [String to Int]
	batasDay := (integer(strBatasDay[1]) - 48) * 10 + (integer(strBatasDay[2]) - 48);
	batasMonth := (integer(strBatasMonth[1]) - 48) * 10 + (integer(strBatasMonth[2]) - 48);
	batasYear := (integer(strBatasYear[1]) - 48) * 1000 + (integer(strBatasYear[2]) - 48) * 100 + 
	(integer(strBatasYear[3]) - 48) * 10 + (integer(strBatasYear[4]) - 48);

	dateNowDay := (integer(dateNow[1]) - 48) * 10 + (integer(dateNow[2]) - 48);
	dateNowMonth := (integer(dateNow[4]) - 48) * 10 + (integer(dateNow[5]) - 48);
	dateNowYear := (integer(dateNow[7]) - 48) * 1000 + (integer(dateNow[8]) - 48) * 100 + (integer(dateNow[9]) - 48) * 10 +
	(integer(dateNow[10]) - 48);

	pesan := 'Terima kasih sudah meminjam';
	pesanTelat := 'Anda terlambat mengembalikan buku.';

	if not(notFound) then
	begin
		if ( dateNowYear > batasYear ) then
		begin
			writeln(pesanTelat);
		end else if (dateNowYear <> batasYear) then
		begin
			writeln(pesan);
		end else
		begin
			if ( dateNowMonth > batasMonth) then
			begin
				writeln(pesanTelat);
			end else if ( dateNowMonth < batasMonth ) then
			begin
				writeln(pesan);
			end else
			begin
				if ( dateNowDay > batasDay ) then
				begin
					writeln(pesanTelat);
				end else
				begin
					writeln(pesan);
				end;
			end;
		end;
	end;

	
end; // End of Procedure Pengembalian

end.
	