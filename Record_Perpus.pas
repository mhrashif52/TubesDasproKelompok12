unit Record_Perpus;
{Unit yang berguna untuk menyatukan seluruh record yang dibutuhkan}

interface

const
	NMax = 10000;

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

		DataPeminjaman = record
			idBuku : string;
			username : string;
			judul : string;
			datePinjam : Date;
			batasKembali : Date;
			status : string;
			end;

		DataKembali = record
			username : string;
			idBuku : string;
			tanggalKembali : Date;
		end;

		DataHilang = record
			username : string;
			idBuku : string;
			tanggalLaporan : Date;
		end;

		DataBuku = record
			idBuku : string;
			judul : string;
			author : string;
			jumlah : string;
			tahunterbit : string;
			kategori : string;
			end;
		
		NeffData = record
			Akun : integer;
			Buku : integer;
			Peminjaman : integer;
			Kembali : integer;
			Hilang : integer;
		end;

var
	arrDataPeminjaman : array [1..NMax] of DataPeminjaman;
	arrDataBuku : array [1..NMax] of DataBuku;
	arrNewBook : array[1..NMax] of BukuBaru;
	
	usernameLogin : string; // Username 
	userLoginStatus : string; // 'admin' atau 'pengunjung'
	username : string;
	idBuku : string;
	InputAkun : Akun;
	InputBukuBaru : BukuBaru;
	NeffAkunBaru : integer;
	NeffBukuBaru : integer;

implementation
begin
	NeffAkunBaru := 0;
	NeffBukuBaru := 0;

end.
