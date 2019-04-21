unit Record_Perpus;
{Unit yang berguna untuk menyatukan seluruh record yang dibutuhkan}

interface
	type 
		Akun = record
				nama, alamat, username, password, role : string;
				NeffAkun : integer;
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
			NeffHilang : integer;
			end;

		DataPeminjaman = record
			idBuku : string;
			username : string;
			judul : string;
			datePinjam : Date;
			batasKembali : Date;
			status : string;
			NeffPeminjaman : integer;
			end;

		DataBuku = record
			idBuku : string;
			judul : string;
			author : string;
			jumlah : string;
			tahunterbit : string;
			kategori : string;
			NeffBuku : integer;
			end;
	
	var
		nefDataHilang : integer;
		usernameLogin : string;
		usernameLogin : string; // Username 
		userLoginStatus : string; // 'admin' atau 'pengunjung'
		username : string;
implementation
end.
				
