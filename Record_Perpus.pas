unit Record_Perpus;
{Unit yang berguna untuk menyatukan seluruh record yang dibutuhkan}

interface
	type 
		Akun = record
				nama, alamat, username, password, role : string;
				end;
		Tanggal = record
				hari, bulan, tahun : string;
				end;

		Date = record
			day : string;
			month : string;
			year : string;
			end;
			
		DataHilang = record
			username : string;
			idBuku_Hilang : string;
			Tanggal_Laporan : string;
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
		nefDataHilang : integer;
		usernameLogin : string;
implementation
end.
				
