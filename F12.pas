unit F12;
{Unit yang digunakan untuk menunjukkan statistik yang ada pada perpustakaan}
{Unit ini dipanggil di program utama saat user ber role 'Admin' memanggil command 'Statistik'
dan akan memunculkan statistik pengguna dan buku}

interface
	uses Record_Perpus;
	procedure Statistik(var arrDataBuku : array of DataBuku; arrDataAkun : array of akun);
	{Procedure ini memanggil Array databuku dan Array akun dan menghitung total setiap kategori dan total semuanya}

implementation
	procedure Statistik(var arrDataBuku : array of DataBuku; arrDataAkun : array of akun);
		const
			NMax = 10000;
			
		var
			i : integer; {Variabel Untuk loop}
			
			admin,pengunjung,total_pengguna : integer; {Variabel penghitungan Pengguna}
			sastra,sains,manga,sejarah,programming,total_buku : integer; {Variabel penghitungan Buku}
			
		begin
			{Data Banyak Pengguna awal}
			admin := 0;
			pengunjung := 0;
			total_pengguna := 0;
			
			{Data Banyak Buku awal}
			sastra := 0;
			sains := 0;
			manga := 0;
			sejarah := 0;
			programming := 0;
			total_buku := 0;
			
			for i:= 1 to (NMax-1) do
				begin
					{Penghitungan Data Akun}
					if (arrDataAkun[i].role = 'admin') then
						begin
							admin := admin + 1;
							total_pengguna := total_pengguna + 1;
						end
					else if(arrDataAkun[i].role = 'pengunjung') then
						begin
							pengunjung := pengunjung + 1;
							total_pengguna := total_pengguna + 1;
						end;
					{Penghitungan Data Buku}	
					if (arrDataBuku[i].kategori = 'sastra') then
						begin
							sastra := sastra + 1;
							total_buku := total_buku + 1;
						end
					else if (arrDataBuku[i].kategori = 'sains') then
						begin
							total_buku := total_buku + 1;
							sains := sains + 1;
						end
					else if (arrDataBuku[i].kategori = 'manga') then
						begin
							total_buku := total_buku + 1;
							manga := manga + 1;
						end
					else if (arrDataBuku[i].kategori = 'sejarah') then
						begin
							total_buku := total_buku + 1;
							sejarah := sejarah + 1;
						end
					else if (arrDataBuku[i].kategori = 'programming') then
						begin
							total_buku := total_buku + 1;
							programming := programming + 1;
						end;
				end;
			
			{Penulisan Data}			
			writeln('Pengguna:');
			writeln('Admin | ',admin);
			writeln('Pengunjung | ',pengunjung);
			writeln('Total | ',total_pengguna);
			writeln('Buku:');
			writeln('sastra | ',sastra);
			writeln('sains | ',sains);
			writeln('manga | ',manga);
			writeln('sejarah | ',sejarah);
			writeln('programming | ',programming);
			writeln('Total | ',total_buku);
		end;
end.
