Unit F14;
{Unit yang berguna untuk menyimpan sesuai dengan nama file yang ada}

interface
	uses Record_Perpus,F13;
	
	var
		// Standard Variable
		NamaFilePeminjaman, NamaFileBuku, NamaFileUser, NamaFilePengembalian, NamaFileKehilangan : string;
		counter : integer;
		
		// Variabel textfile
		FilePeminjaman,FileBuku,FilePengembalian,FileKehilangan,FileUser : text;
	
	procedure getFileNameSave;
	{	Masukkan nama File Buku: buku.csv
		Masukkan nama File User: user.csv
		Masukkan nama File Peminjaman: peminjaman.csv
		Masukkan nama File Pengembalian: pengembalian.csv
		Masukkan nama File Buku Hilang: kehilangan.csv
		Data berhasil disimpan!
	}
		
	procedure SaveDataPeminjaman(var NamaFilePeminjaman : string);
	procedure SaveDataBuku(var NamaFileBuku : string);
	procedure SaveDataUser (var NamaFileUser : string);
	procedure SaveDataPengembalian (var NamaFilePengembalian : string);
	procedure SaveDataKehilangan(var NamaFileKehilangan : string);

implementation
	procedure getFileNameSave;
		begin
			write('Masukkan nama File Buku: ');
			readln(NamaFileBuku);
					
			write('Masukkan nama File User: ');
			readln(NamaFileUser);
					
			write('Masukkan nama File Peminjaman: ');
			readln(NamaFilePeminjaman);
					
			write('Masukkan nama File Pengembalian: ');
			readln(NamaFilePengembalian);
					
			write('Masukkan nama File Buku Hilang: ');
			readln(NamaFileKehilangan);
					
			write('File perpustakaan berhasil dimuat!');
		end;
	
	procedure SaveDataPeminjaman(var NamaFilePeminjaman : string);
		var
			updatePeminjaman : string;
		begin
			//Re-Write File peminjaman		
			assign(FilePeminjaman,NamaFilePeminjaman);
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
		end;
	
	procedure SaveDataBuku(var NamaFileBuku : string);
		var
			updateBuku : string;
		begin
			// Re-Write File Buku.csv
			assign(FileBuku,NamaFileBuku);
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
		end;
			
	procedure SaveDataUser (var NamaFileUser : string);
		var
			updateUser : string;
		begin
			// Re-Write File user.csv
			assign(FileUser,NamaFileUser);
			rewrite(FileUser);
			updateUser := 'Nama,Alamat,Username,Password,Role,';
			writeln(FileUser,updateUser);
			counter := 1;
			while (arrDataAkun[counter].nama <> '') do
				begin
					updateUser := arrDataAkun[counter].nama + ',' + arrDataAkun[counter].alamat + ',' + arrDataAkun[counter].username + ',' +
					arrDataAkun[counter].password + ',' + arrDataAkun[counter].role + ',';
					writeln(FileUser,updateUser);
					counter := counter + 1;
				end;
			close(FileUser);
		end;
		
	procedure SaveDataPengembalian (var NamaFilePengembalian : string);
		var
			updatePengembalian : string;
			
		begin
			// Re-Write File Pengembalian
			assign(FilePengembalian,NamaFilePengembalian);
			rewrite(FilePengembalian);
			updatePengembalian := 'Username,ID_Buku,Tanggal_Pengembalian,';
			writeln(FilePengembalian,updatePengembalian);
			counter := 1;
			while (arrDataKembali[counter].username <> '') do
				begin
					updatePengembalian := arrDataKembali[counter].username + ',' + arrDataKembali[counter].idBuku + ',' + arrDataKembali[counter].TanggalKembali.day + '/' +
					arrDataKembali[counter].TanggalKembali.month + '/' + arrDataKembali[counter].TanggalKembali.year + ',';
					writeln(FilePengembalian,updatePengembalian);
					counter := counter + 1;
				end;
			close(FilePengembalian);
		end;	
						
	procedure SaveDataKehilangan(var NamaFileKehilangan : string);
		var
			updateKehilangan : string;
		begin
			// Re-Write File Kehilangan
			assign(FileKehilangan, NamaFileKehilangan);
			rewrite(FileKehilangan);
			updateKehilangan := 'Username,ID_Buku_Hilang,Tanggal_Laporan,';
			writeln(FileKehilangan,updateKehilangan);
			counter := 1;
			while (arrDataHilang[counter].username <> '') do
				begin
					updateKehilangan := arrDataHilang[counter].username + ',' + arrDataHilang[counter].idBuku + ',' + arrDataHilang[counter].tanggalLaporan.day + '/' +
					arrDataHilang[counter].tanggalLaporan.month + '/' + arrDataHilang[counter].tanggalLaporan.year + ',';
					writeln(FileKehilangan,updateKehilangan);
					counter := counter + 1;
				end;
			close(FileKehilangan);
		end; // End of Procedure Save

end. // End of Unit
