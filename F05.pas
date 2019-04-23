unit F05;
{Program untuk melakukan peminjaman buku, Untuk melakukan peminjaman 
* pengunjung harus login terlebih dahulu. Dapat diasumsikan id buku dan 
* day yang dimasukkan valid. Namun, bisa saja buku yang ingin 
* dipinjam sedang habis (out of stock). }

{KAMUS}
interface

uses Record_Perpus,F13;


procedure PinjamBuku(username : string);

procedure gantiHari7(dateNow, dateBatas : string);
procedure gantiBulan(dateNow, dateBatas : string);
procedure gantiTahun(dateNow, dateBatas : string);

procedure updatePeminjaman;

implementation


procedure gantiTahun(dateNow, dateBatas : string);
begin
    if (dateNow[10] = '9') then
    begin
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];

        dateBatas[10] := '0';
        dateBatas[9] := char ( integer(dateNow[9]) + 1  );
    end else
    begin
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];

        dateBatas[9] := dateNow[9];
        dateBatas[10] := char( integer(dateNow[10]) + 1  );

    end;

end;

procedure gantiBulan(dateNow, dateBatas : string);
begin
    if (dateNow[5] = '9') then
    begin
        dateBatas[5] := '0';
        dateBatas[4] := '1';
        // Tahun sama
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];
        dateBatas[9] := dateNow[9];
        dateBatas[10] := dateNow[10];
    end else if (dateNow[4] = '1') and (dateNow[5] = '2') then
    begin
        dateBatas[4] := '0';
        dateBatas[5] := '1';
        gantiTahun(dateNow, dateBatas);
    end else
    begin
        dateBatas[4] := dateNow[4];
        dateBatas[5] := char( integer(dateNow[5]) + 1 );
        // Tahun sama
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];
        dateBatas[9] := dateNow[9];
        dateBatas[10] := dateNow[10];
    end;

end;

procedure gantiHari7(dateNow, dateBatas : string);
begin
    if (dateNow[1] = '3') then
    begin
        dateBatas[1] := '0';
        dateBatas[2] := '7';
        gantiBulan(dateNow, dateBatas);
    end else if ( integer(dateNow[2]) >= 51 ) then
    begin
        dateBatas[1] := char( integer(dateNow[1]) + 1  );
        dateBatas[2] := char( integer(dateNow[1]) - 3);


        dateBatas[4] := dateNow[4];
        dateBatas[5] := dateNow[5];
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];
        dateBatas[9] := dateNow[9];
        dateBatas[10] := dateNow[10];
    end;

end;




procedure PinjamBuku(username : string);
var
    idBuku : string;
    dateNow : string;
    i : integer;
    bookTitle : string;
    jumlahSebelum : string;
    jumlahSatuanBuku : char;
    jumlahPuluhanBuku : char;
    jumlahSekarang : string;
    statusPeminjaman : boolean;
    dateBatas : string;

begin
    
    write('Masukkan id buku yang ingin dipinjam: ');
    readln(idBuku);
    write('Masukkan tanggal hari ini: ');
    readln(dateNow);

    statusPeminjaman := True; // Initial State : Peminjaman Berhasil

    for i:=1 to LoadNeffData.buku do
    begin
        if (arrDataBuku[i].idBuku = idBuku) then
        begin
            bookTitle := arrDataBuku[i].judul;
            jumlahSebelum := arrDataBuku[i].jumlah;

            // Checking How Many Books are left in the Library

            if (integer(jumlahSebelum[1]) >= 48) and (integer(jumlahSebelum[1]) <= 57 ) and (integer(jumlahSebelum[2]) >= 48) and (integer(jumlahSebelum[2]) <= 57 ) then
            begin
                if ( (integer(jumlahSebelum[2]) - 48) = 0) then
				begin
					jumlahPuluhanBuku := char(integer(jumlahSebelum[1]) - 1);
                    jumlahSatuanBuku := '9';
                    arrDataBuku[i].jumlah := jumlahPuluhanBuku + jumlahSatuanBuku;
                    jumlahSekarang := arrDataBuku[i].jumlah;
                end else
                begin
                    jumlahPuluhanBuku := char(integer(jumlahSebelum[1]));
                    jumlahSatuanBuku := char(integer(jumlahSebelum[2]) - 1);
                    arrDataBuku[i].jumlah := jumlahPuluhanBuku + jumlahSatuanBuku;
                    jumlahSekarang := arrDataBuku[i].jumlah;
                end;

            end else
            begin
                if (jumlahSebelum = '0') then
                begin
                    writeln('Buku ', bookTitle, ' sedang habis!' );
                    writeln('Coba lain kali!');
                    statusPeminjaman := False; // Peminjaman gagal karena stock habis
                end else
                begin
                    jumlahSatuanBuku := char(integer(jumlahSebelum[1]) - 1);
                    arrDataBuku[i].jumlah := jumlahSatuanBuku;
                    jumlahSekarang := arrDataBuku[i].jumlah;
                end;
            end; // End of Checking amount of books



        end; // End of arrDataBuku.idBuku = idBuku

    end; // End of Looping in arrDataBuku


    // Input Data Peminjaman ke dalam array arrDataPeminjaman
    if (statusPeminjaman) then
    begin
        writeln('Tersisa ', jumlahSekarang, ' buku ', bookTitle);
        writeln('Terima kasih sudah meminjam!');
        LoadNeffData.Peminjaman := LoadNeffData.Peminjaman + 1;
        arrDataPeminjaman[LoadNeffData.Peminjaman].username := username;
        arrDataPeminjaman[LoadNeffData.Peminjaman].idBuku := idBuku;
        arrDataPeminjaman[LoadNeffData.Peminjaman].datePinjam.day := dateNow[1] + dateNow [2];
        arrDataPeminjaman[LoadNeffData.Peminjaman].datePinjam.month:= dateNow[4] + dateNow [5];
        arrDataPeminjaman[LoadNeffData.Peminjaman].datePinjam.year := dateNow[7] + dateNow [8] + dateNow[9] + dateNow[10];
        arrDataPeminjaman[LoadNeffData.Peminjaman].status := 'belum';


        {
        Dec   |   Char
        48    |     0
        49    |     1
        50    |     2
        51    |     3
        52    |     4
        53    |     5
        54    |     6
        55    |     7
        56    |     8
        57    |     9
        }

        // Menentukan batas kembali, anggap max tanggal adalah 30
        dateBatas := '00/00/0000';

        if (dateNow[1] = '3') then
    begin
        dateBatas[1] := '0';
        dateBatas[2] := '7';
        
		// Ganti Bulan
		if (dateNow[5] = '9') then
		begin
			dateBatas[5] := '0';
			dateBatas[4] := '1';
			// Tahun sama
			dateBatas[7] := dateNow[7];
			dateBatas[8] := dateNow[8];
			dateBatas[9] := dateNow[9];
			dateBatas[10] := dateNow[10];
		end else if (dateNow[4] = '1') and (dateNow[5] = '2') then
		begin
			dateBatas[4] := '0';
			dateBatas[5] := '1';
			// Ganti Tahun
			if (dateNow[10] = '9') then
			begin
				dateBatas[7] := dateNow[7];
				dateBatas[8] := dateNow[8];

				dateBatas[10] := '0';
				dateBatas[9] := char ( integer(dateNow[9]) + 1  );
			end else
			begin
				dateBatas[7] := dateNow[7];
				dateBatas[8] := dateNow[8];

				dateBatas[9] := dateNow[9];
				dateBatas[10] := char( integer(dateNow[10]) + 1  );

			end;

			// End of Ganti Tahun
		end else
		begin
			dateBatas[4] := dateNow[4];
			dateBatas[5] := char( integer(dateNow[5]) + 1 );
			// Tahun sama
			dateBatas[7] := dateNow[7];
			dateBatas[8] := dateNow[8];
			dateBatas[9] := dateNow[9];
			dateBatas[10] := dateNow[10];
		end;

		// End of Ganti Bulan


    end else if ( integer(dateNow[2]) >= 51 ) and (dateNow[1] <> '2') then
    begin
        dateBatas[1] := char( integer(dateNow[1]) + 1  );
        dateBatas[2] := char( integer(dateNow[2]) - 3);


        dateBatas[4] := dateNow[4];
        dateBatas[5] := dateNow[5];
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];
        dateBatas[9] := dateNow[9];
        dateBatas[10] := dateNow[10];
    end else if ( integer(dateNow[2]) >= 51 ) and (dateNow[1] = '2') then
	begin

        if ( integer(dateNow[2]) > 51 ) then
        begin
		    dateBatas[1] := '0';
		    dateBatas[2] := char( integer(dateNow[2]) - 3);
		
		// Ganti Bulan
		if (dateNow[5] = '9') then
		begin
			dateBatas[5] := '0';
			dateBatas[4] := '1';
			// Tahun sama
			dateBatas[7] := dateNow[7];
			dateBatas[8] := dateNow[8];
			dateBatas[9] := dateNow[9];
			dateBatas[10] := dateNow[10];
		end else if (dateNow[4] = '1') and (dateNow[5] = '2') then
		begin
			dateBatas[4] := '0';
			dateBatas[5] := '1';
			// Ganti Tahun
			if (dateNow[10] = '9') then
			begin
				dateBatas[7] := dateNow[7];
				dateBatas[8] := dateNow[8];

				dateBatas[10] := '0';
				dateBatas[9] := char ( integer(dateNow[9]) + 1  );
			end else
			begin
				dateBatas[7] := dateNow[7];
				dateBatas[8] := dateNow[8];

				dateBatas[9] := dateNow[9];
				dateBatas[10] := char( integer(dateNow[10]) + 1  );

			end;

			// End of Ganti Tahun
		end else
		begin
			dateBatas[4] := dateNow[4];
			dateBatas[5] := char( integer(dateNow[5]) + 1 );
			// Tahun sama
			dateBatas[7] := dateNow[7];
			dateBatas[8] := dateNow[8];
			dateBatas[9] := dateNow[9];
			dateBatas[10] := dateNow[10];
		end;

		// End of Ganti Bulan

        end else 
        begin
            dateBatas[1] := '3';
		    dateBatas[2] := char( integer(dateNow[2]) - 3);
            dateBatas[4] := dateNow[4];
			dateBatas[5] := dateNow[5];
			dateBatas[7] := dateNow[7];
			dateBatas[8] := dateNow[8];
			dateBatas[9] := dateNow[9];
			dateBatas[10] := dateNow[10];
        end;

	end else
	begin
		dateBatas[1] := dateNow[1];
        dateBatas[2] := char( integer(dateNow[2]) + 7);


        dateBatas[4] := dateNow[4];
        dateBatas[5] := dateNow[5];
        dateBatas[7] := dateNow[7];
        dateBatas[8] := dateNow[8];
        dateBatas[9] := dateNow[9];
        dateBatas[10] := dateNow[10];

	end;

        arrDataPeminjaman[LoadNeffData.Peminjaman].batasKembali.day := dateBatas[1] + dateBatas[2];
        arrDataPeminjaman[LoadNeffData.Peminjaman].batasKembali.month := dateBatas[4] + dateBatas[5];
        arrDataPeminjaman[LoadNeffData.Peminjaman].batasKembali.year := dateBatas[7] + dateBatas[8] + dateBatas[9] + dateBatas[10];

    end; // End of statusPeminjaman. Else, tidak melakukan perubahan pada array arrDataPeminjaman


end; // End of Procedure PinjamBuku

	
procedure updatePeminjaman;

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
