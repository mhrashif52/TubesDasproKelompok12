(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)

Unit F13; 
(* Definisi *) 
(* Program pertama kali akan menjalankan fungsi load *)
(*	Masukkan nama File Buku: buku.csv
	Masukkan nama File User: user.csv
	Masukkan nama File Peminjaman: peminjaman.csv
	Masukkan nama File Pengembalian: pengembalian.csv
	Masukkan nama File Buku Hilang: kehilangan.csv
	File perpustakaan berhasil dimuat! *)
	
interface
	uses Record_Perpus;
	
		
	var 
	
	// Standard Variable
	getfilebuku : string;
	getfileuser : string;
	getfilepeminjaman : string;
	getfilekembali : string;
	getfilehilang : string;



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
	arrDataPeminjaman : array [1..NMax] of DataPeminjaman;
	// End of Varibale to Read Peminjaman.csv

	// LOAD Var USERFILE
	arrDataAkun : array [1..NMax] of Akun;
	NeffAkun : integer;

    // Variable to Read user.csv
	fileuser : textfile;
    lenUser : integer;
	tipeDataUser : integer;
    fuser : file of char;
	// END OF Var LOAD USERFILE

	// Variable to Read Buku.csv
	filebuku : textfile;
	fbuku : file of char;
	k, l : integer;
	lenBuku : longint;
	tipeDataBuku : integer;
	arrDataBuku : array[1..NMax] of DataBuku;
	// End of Variable to Read Buku.csv

	LoadNeffData : NeffData;

	{ Deklarasi Fungsi/Prosedur }
		procedure getFileName;
		procedure LoadUser(getfileuser : string);
		procedure LoadBuku(getfilebuku : string);
		procedure LoadPeminjaman(getfilepeminjaman : string);
	
implementation
procedure getFileName;
begin
			write('Masukkan nama File Buku: ');
			readln(getfilebuku);
			
			write('Masukkan nama File User: ');
			readln(getfileuser);
			
			write('Masukkan nama File Peminjaman: ');
			readln(getfilepeminjaman);
			
			write('Masukkan nama File Pengembalian: ');
			readln(getfilekembali);
			
			write('Masukkan nama File Buku Hilang: ');
			readln(getfilehilang);
			
			write('File perpustakaan berhasil dimuat!');
end;

procedure LoadUser(getfileuser : string);
begin
			
// Algorithm to Load user.csv

system.Assign(fuser, getfileuser);
system.Reset(fuser);
lenUser := FileSize(fuser);
Close(fuser);
LoadNeffData.Akun := 0;

system.Assign(fileuser, getfileuser);
system.Reset(fileuser);

i := 1; // Untuk Index array arrDataAkun
j := 1; // Counting Read ke-berapa
tipeDataUser := 1;

readln(fileuser,readline);

read(fileuser,readchar);

repeat 

	case tipeDataUser of
	
	1 : 
		begin
		if  (readchar = ',') and (j <  lenUser)  then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 1) and (j <  lenUser)) do
		begin
			arrDataAkun[i].nama := arrDataAkun[i].nama + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
		
	2 : 
		begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 2) and (j <  lenUser) ) do
		begin
			arrDataAkun[i].alamat := arrDataAkun[i].alamat + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
	3 : 
		begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 3) and (j <  lenUser) ) do
		begin
		
			arrDataAkun[i].username := arrDataAkun[i].username + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;	
		
		end;
		
	4 : begin
		if (readchar = ',') and (j <  lenUser) then
		begin
			read(fileuser, readchar);
            j := j + 1;
			tipeDataUser := tipeDataUser + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 4) and (j <  lenUser)) do
		begin
		
			arrDataAkun[i].password := arrDataAkun[i].password+ readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
		
	5 : begin
		if (readchar = ',') and (j <  lenUser) then 
		begin
			tipeDataUser := 1;
			i := i + 1;
			LoadNeffData.Akun := LoadNeffData.Akun + 1;
			readln(fileuser, readchar); // Next Line (Untuk Menghindari 'new line' dalam Array
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		while ( (readchar <> ',') and (tipeDataUser = 5) and (j <  lenUser)) do
		begin
			arrDataAkun[i].role := arrDataAkun[i].role + readchar;
			read(fileuser, readchar);
            j := j + 1;
		end;
		
		end;
	
	end; // End of Case tipeDataUser
	
until (j >= lenUser);

Close(fileuser);

// End of Algorithm to Load user.csv
end;

procedure LoadPeminjaman(getfilepeminjaman : string);
begin
// Algorithm to Move Copy Data from peminjaman.csv to arrDataPeminjaman

system.Assign(f, getfilepeminjaman);
system.Reset(f);
lenPeminjaman := FileSize(f);
Close(f);
LoadNeffData.Peminjaman := 0;
i := 1;
j := 1;

tipeDataPeminjaman := 1;
newLineYearCounter := 0;
dmyCounter := 1;

system.Assign(filepeminjaman, getfilepeminjaman);
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
			LoadNeffData.Peminjaman := LoadNeffData.Peminjaman + 1;
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

end; // End of Algorithm to load Peminjaman.csv



procedure loadBuku(getfilebuku : string);
begin
// Algorithm to Read Buku.csv

system.Assign(fbuku, getfilebuku);
system.Reset(fbuku);
lenBuku := FileSize(fbuku);
Close(fbuku);
LoadNeffData.Buku := 0;
k := 1; // Untuk Index array arrDataBuku
l := 1; // Untuk menandai pembacaan char keberapa pada file buku
tipeDataBuku := 1;


system.Assign(filebuku, getfilebuku);
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
			LoadNeffData.Buku := LoadNeffData.Buku + 1;
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

		
		end;
	
	end; // End of Case tipeDataBuku
	
until (l >= lenBuku);

Close(filebuku);

end; // End of Algorithm to load Buku.csv


end.
