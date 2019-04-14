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

implementation
end.
				
