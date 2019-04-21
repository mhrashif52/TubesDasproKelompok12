unit Record_Perpus;
{Unit yang berguna untuk menyatukan seluruh record yang dibutuhkan}

interface
	type 
		Akun = record
				nama, alamat, username, password, role : string;
				end;
		Buku = record
				id_buku, tahun_penerbit, jumlah_buku : integer;
				judul_buku, pengarang, kategori : string;
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
			end;

		DataBuku = record
			idBuku : string;
			judul : string;
			author : string;
			jumlah : string;
			tahunterbit : string;
			kategori : string;
			end;
implementation
end.
				
