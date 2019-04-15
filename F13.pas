(* Kelompok: 12 *)
(* Kelas: 03 *)
(* Tanggal : 08 - 04 - 2019 *)

Unit LoadFile; 
(* Definisi *) 
(* Program pertama kali akan menjalankan fungsi load *)
(*	Masukkan nama File Buku: buku.csv
	Masukkan nama File User: user.csv
	Masukkan nama File Peminjaman: peminjaman.csv
	Masukkan nama File Pengembalian: pengembalian.csv
	Masukkan nama File Buku Hilang: kehilangan.csv
	File perpustakaan berhasil dimuat! *)
	
interface
	type
		Tanggal = record
			DD : integer;
			MM : integer;
			YY : integer;
	end;
	type
		Data = record
			ID : integer;
			Ju : string;
			Au : string;
			Jm : integer;
			Tp : Tanggal;
			Kat : string;
	end;
	type
		User = record
			Na : string;
			Al : string;
			Us : string;
			Pw : string;
			Ro : string;
	end;
	type
		HistPin = record
			Us : string;
			Id : integer;
			Tpin : string;
			Tkem : string;
			Sta : string;
	end;
	type
		HistKem = record
			Us : string;
			Id : integer;
			Tkem : string;
	end;
	type
		Hilang = record
			Us : string;
			Id : integer;
			TLap : string;
	end;
	
		
	var 
		;

	{ Deklarasi Fungsi/Prosedur }
		procedure LoadFile (exe : string);
	
implementation
	procedure LoadFile ( );
		begin
			write('Masukkan nama File Buku: ');
			readln(buku);
			system.Assign(UserFile,buku);
			system.Append(UserFile);
			
			write('Masukkan nama File User: ');
			readln(user);
			system.Assign(UserFile,user);
			system.Append(UserFile);
			
			write('Masukkan nama File Peminjaman: ');
			readln(pinjam);
			system.Assign(UserFile,pinjam);
			system.Append(UserFile);
			
			write('Masukkan nama File Pengembalian: ');
			readln(kembali);
			system.Assign(UserFile,kembali);
			system.Append(UserFile);
			
			write('Masukkan nama File Buku Hilang: ');
			readln(hilang);
			system.Assign(UserFile,hilang);
			system.Append(UserFile);
			
			write('File perpustakaan berhasil dimuat!');
		end;
	
