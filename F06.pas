unit F06;

interface

uses Record_Perpus,F13;

const
	NMax = 10000;

var
	
	// Variable to Read Char or Line from csv file
	readchar : Char;
	readline : string;
	
	FileBuku : textfile;
	jumlahSebelum : string;
	jumlahSesudah : string;
	satuanJumlahBuku : char;
	puluhanJumlahBuku : char;
	ratusanJumlahBuku : char;
	ribuanJumlahBuku : char;

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
	
procedure UpdatePengembalian;	
	
implementation

procedure Pengembalian(username : string; id : string);
begin
	
	notFound := True;

	for m := 1 to LoadNeffData.Buku do
	begin
		if (id = arrDataBuku[m].idBuku) then
		begin
			bookTitleFromID := arrDataBuku[m].judul;
			jumlahSebelum := arrDataBuku[m].jumlah;

			// Perubahan Jumlah Buku yang ada di Perpus pada File Buku.csv
				
			if (integer(jumlahSebelum[1]) >= 48) and (integer(jumlahSebelum[1]) <= 57 ) and (integer(jumlahSebelum[2]) >= 48) and (integer(jumlahSebelum[2]) <= 57 ) then
			begin

				if ( (integer(jumlahSebelum[2]) - 48) = 9) then
				begin
					if (jumlahSebelum[1] = '9' ) then
					begin
						ratusanJumlahBuku := char(49);
						puluhanJumlahBuku := char(48); 
						satuanJumlahBuku := char(48);
						arrDataBuku[m].jumlah := ratusanJumlahBuku + puluhanJumlahBuku + satuanJumlahBuku;
						jumlahSesudah := arrDataBuku[m].jumlah;
					end else if (jumlahSebelum[2] = '9') then
					begin
						puluhanJumlahBuku := char ( integer(jumlahSebelum[1]) + 1 );
						satuanJumlahBuku := char(48);
						arrDataBuku[m].jumlah := puluhanJumlahBuku + satuanJumlahBuku;
						jumlahSesudah := arrDataBuku[m].jumlah;
					end else
					begin
						puluhanJumlahBuku := char ( integer(jumlahSebelum[1])  );
						satuanJumlahBuku := char ( integer(jumlahSebelum[2]) + 1  );
						arrDataBuku[m].jumlah := puluhanJumlahBuku + satuanJumlahBuku;
						jumlahSesudah := arrDataBuku[m].jumlah;
					end;
					
					
				end else
				begin
					puluhanJumlahBuku := char( integer(jumlahSebelum[1]) );
					satuanJumlahBuku := char( integer(jumlahSebelum[2]) + 1  );
					arrDataBuku[m].jumlah := puluhanJumlahBuku + satuanJumlahBuku;
					jumlahSesudah := arrDataBuku[m].jumlah;
				end;
			
			end else if (integer(jumlahSebelum[1]) >= 48) and (integer(jumlahSebelum[1]) <= 57 ) then
			begin

				if ( (integer(jumlahSebelum[1]) - 48) = 9) then
				begin
					puluhanJumlahBuku := char(49);
					satuanJumlahBuku := char(48);
					arrDataBuku[m].jumlah := puluhanJumlahBuku + satuanJumlahBuku;
					jumlahSesudah := arrDataBuku[m].jumlah;
				end else
				begin
					satuanJumlahBuku := char( (integer(jumlahSebelum[1]) + 1) );
					arrDataBuku[m].jumlah := satuanJumlahBuku;
					jumlahSesudah := arrDataBuku[m].jumlah;
				end;
			end;
		end;
	end;

	m := 1;





	while (notFound and (m <= LoadNeffData.Peminjaman)) do
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

	pesan := 'Terima kasih sudah meminjam.';
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

	writeln('');
	
end; // End of Procedure Pengembalian


procedure UpdatePengembalian;

var
	FilePeminjaman : text;
	counter : integer;
	updatePeminjaman : string;
	updateBuku : string;

begin
	assign(FilePeminjaman,'peminjaman.csv');
	rewrite(FilePeminjaman);
	updatePeminjaman := 'Username' + ',' + 'ID_Buku' + ',' + 'Tanggal_Peminjaman' + ',' +
	'Tanggal_Batas_Peminjaman' + ',' + 'Status_Pengembalian' + ',';
	writeln(FilePeminjaman,updatePeminjaman);
	counter := 1;
	while (arrDataPeminjaman[counter].idBuku <> '') do
	begin
		updatePeminjaman := arrDataPeminjaman[counter].username + ',' + arrDataPeminjaman[counter].idBuku + ',' +
		arrDataPeminjaman[counter].datePinjam.day + '/' +
		arrDataPeminjaman[counter].datePinjam.month + '/' + arrDataPeminjaman[counter].datePinjam.year + ',' +
		arrDataPeminjaman[counter].batasKembali.day + '/' + arrDataPeminjaman[counter].batasKembali.month + '/' +
		arrDataPeminjaman[counter].batasKembali.year + ',' + arrDataPeminjaman[counter].status + ',';
		writeln(FilePeminjaman,updatePeminjaman);
		counter := counter + 1;
	end;
	close(FilePeminjaman);


	// Re-Write File Buku.csv
	assign(FileBuku,'buku.csv');
	rewrite(FileBuku);
	updateBuku := 'ID_Buku,Judul_Buku,Author,Jumlah_Buku,Tahun_Penerbit,Kategori,';
	writeln(FileBuku,updateBuku);
	counter := 1;
	while (arrDataBuku[counter].judul <> '') do
	begin
		updateBuku := arrDataBuku[counter].idBuku + ',' + arrDataBuku[counter].judul + ',' + arrDataBuku[counter].author + ',' +
		arrDataBuku[counter].jumlah + ',' + arrDataBuku[counter].tahunterbit + ',' + arrDataBuku[counter].kategori + ',';
		writeln(FileBuku,updateBuku);
		counter := counter + 1;
	end;
	close(FileBuku);
	

end; // End of Procedure Pengembalian

end.
	
