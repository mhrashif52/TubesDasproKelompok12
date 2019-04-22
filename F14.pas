Unit F14;
{Unit yang berguna untuk menyimpan sesuai dengan nama file yang ada}

interface
	uses Record_Perpus;
	procedure Save(var arrDataPeminjaman : array of DataPeminjaman; arrDataBuku : array of DataBuku; arrDataKehilangan : array of DataHilang; arrDataAkun : array of Akun; arrDataPengembalian : array of DataKembali);
	{	Masukkan nama File Buku: buku.csv
		Masukkan nama File User: user.csv
		Masukkan nama File Peminjaman: peminjaman.csv
		Masukkan nama File Pengembalian: pengembalian.csv
		Masukkan nama File Buku Hilang: kehilangan.csv
		Data berhasil disimpan!
	}
	
	
implementation
	procedure Save(var arrDataPeminjaman : array of DataPeminjaman; arrDataBuku : array of DataBuku; arrDataKehilangan : array of DataHilang; arrDataAkun : array of Akun; arrDataPengembalian : array of DataKembali);
		var
			FilePeminjaman,FileBuku,FilePengembalian,FileKehilangan,FileUser : textfile;
			NamaFilePeminjaman, NamaFileBuku, NamaFileUser, NamaFilePengembalian, NamaFileKehilangan : string; // Mengambil Nama File
			
			counter : integer;
			updatePeminjaman : string;
			updateBuku : string;
			updateUser : string;
			updatePengembalian : string;
			updateKehilangan : string;

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
			
			// Re-Write File Pengembalian
			assign(FilePengembalian,NamaFilePengembalian);
			rewrite(FilePengembalian);
			updatePengembalian := 'Username,ID_Buku,Tanggal_Pengembalian,';
			writeln(FilePengembalian,updatePengembalian);
			counter := 1;
			while (arrDataPengembalian[counter].username <> '') do
				begin
					updatePengembalian := arrDataPengembalian[counter].username + ',' + arrDataPengembalian[counter].idBuku + ',' + arrDataPengembalian[counter].TanggalKembali.day + '/' +
					arrDataPengembalian[counter].TanggalKembali.month + '/' + arrDataPengembalian[counter].TanggalKembali.year + ',';
					writeln(FilePengembalian,updatePengembalian);
					counter := counter + 1;
				end;
			close(FilePengembalian);
			
						
			// Re-Write File Kehilangan
			assign(FileKehilangan, NamaFileKehilangan);
			rewrite(FileKehilangan);
			updateKehilangan := 'Username,ID_Buku_Hilang,Tanggal_Laporan,';
			writeln(FileKehilangan,updateKehilangan);
			counter := 1;
			while (arrDataKehilangan[counter].username <> '') do
				begin
					updateKehilangan := arrDataKehilangan[counter].username + ',' + arrDataKehilangan[counter].idBuku + ',' + arrDataKehilangan[counter].tanggalLaporan.day + '/' +
					arrDataKehilangan[counter].tanggalLaporan.month + '/' + arrDataKehilangan[counter].tanggalLaporan.year + ',';
					writeln(FileKehilangan,updateKehilangan);
					counter := counter + 1;
				end;
			close(FileKehilangan);
		end; // End of Procedure Save

end. // End of Unit
