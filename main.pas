Program Tubes;

uses Record_Perpus,F01,F02,F11,F06,F13,F14;

var

	doAction : integer;
	UsernameRiwayat : string; // Username untuk melihat riwayat username (Unit F11)
	quitProgram : boolean;
	SaveOrNot : char;

begin

	getFileName;
	LoadUser(getfileuser);
	LoadBuku(getfilebuku);
	LoadPeminjaman(getfilepeminjaman);
	LoadKembali(getfilekembali);
	LoadHilang(getfilehilang);

	usernameLogin := 'nologin';
	userLoginStatus := 'nologin';
	quitProgram := False;
	
	writeln('');
	writeln('');
	
	{writeln(LoadNeffData.Akun,LoadNeffData.Buku,LoadNeffData.Hilang);
	writeln(arrDataAkun[1].username);
	writeln(arrDataBuku[1].judul);
	writeln(arrDataPeminjaman[1].idBuku);
	writeln(arrDataKembali[1].username);
	writeln(arrDataHilang[1].username); } // Testing Array

	loginAkun(arrDataAkun);

	writeln('');
	writeln('');

	while (userLoginStatus = 'pengunjung') and (quitProgram = False) do
	begin
		writeln('1 - Pencarian Buku berdasarkan Kategori');
		writeln('2 - Pencarian Buku berdasarkan tahun');
		writeln('3 - Peminjaman Buku');
		writeln('4 - Pengembalian Buku');
		writeln('5 - Melaporkan Buku Hilang');
		writeln('6 - Save');
		writeln('7 - Exit Program');
		writeln('');
		write('Masukkan pilihan: ');
		readln(doAction);

		case doAction of

		1 : begin 
				//procedure 03

			end;
		
		2 : begin
				//procedure 04
			end;

		3 : begin
				//procedure 05
			end;

		4 : begin
				write('Masukkan id buku yang dikembalikan: ');
				readln(idBuku);
				Pengembalian(usernameLogin,idBuku);
			end;
		5 : begin
				//procedure 07
				laporHilang(arrDataHilang);
			end;
		6 : begin
				//procedure 14
				save;
			end;
		
		7 : begin
				write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
				readln(SaveOrNot);
				if (SaveOrNot = 'Y') or (SaveOrNot = 'y') then
				begin
					UpdatePengembalian;
				end;
				quitProgram := True;
			end;
		
		end; // End of case doAction for userlogin = pengunjung

	end; // End of While for userlogin = pengunjung

	while (userLoginStatus = 'admin') and (quitProgram = False) do
	begin
		writeln('1  - Pencarian Buku berdasarkan Kategori');
		writeln('2  - Pencarian Buku berdasarkan tahun');
		writeln('3  - Peminjaman Buku');
		writeln('4  - Pengembalian Buku');
		writeln('5  - Melaporkan Buku Hilang');
		writeln('6  - Melihat laporan buku yang hilang');
		writeln('7  - Menambahkan Buku');
		writeln('8  - Melakukan Penambahan jumlah buku ke sistem');
		writeln('9  - Melihat Riwayat Peminjaman');
		writeln('10 - Statistik');
		writeln('11 - Pencarian Anggota');
		writeln('12 - Register Akun');
		writeln('13 - Save');
		writeln('14 - Exit Program');
		writeln('');
		write('Masukkan pilihan: ');
		readln(doAction);

		case doAction of

		1 : begin 
				//procedure 03

			end;
		
		2 : begin
				//procedure 04
			end;

		3 : begin
				//procedure 05
			end;

		4 : begin
				write('Masukkan id buku yang dikembalikan: ');
				readln(idBuku);
				Pengembalian(usernameLogin,idBuku);
			end;
		5 : begin
				//procedure 07
				laporHilang(arrDataHilang);
			end;
		
		6 : begin
				//procedure 08
			end;
		
		7 : begin
				//procedure 09
			end;

		8 : begin
				//procedure 10
			end;

		9 : begin
				write('Masukkan username pengunjung: ');
				readln(UsernameRiwayat);
				RiwayatPengembalian(UsernameRiwayat);
			end;
		
		10 : begin
				//procedure 12
			end;

		11 : begin
				//procedure 13
			end;

		12 : begin
				registerAkun;
			end;
		
		13 : begin
				//Procedure 14
				save;
			end;

		14 : begin
				write('Apakah anda mau melakukan penyimpanan file yang sudah dilakukan (Y/N) ? ');
				readln(SaveOrNot);
				if (SaveOrNot = 'Y') or (SaveOrNot = 'y') then
				begin
					UpdatePengembalian;
					updateRegisterAkun(InputAkun);
				end;
				quitProgram := True;
			end;

		end; // End of Case doAction for userlogin = admin

	end; // End of While for userlogin = admin
	
end.
