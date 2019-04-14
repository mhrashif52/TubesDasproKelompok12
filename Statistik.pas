unit Statistik;
{Unit yang digunakan untuk menunjukkan statistik yang ada pada perpustakaan}

interface
	uses Record_Perpus;
	procedure Statistik();

implementation
	procedure Statistik();
		begin
			writeln('Pengguna:');
			writeln('Admin | ');
			writeln('Pengunjung | ');
			writeln('Total | ');
			writeln('Buku:');
			writeln('sastra | ');
			writeln('sains | ');
			writeln('manga | ');
			writeln('sejarah | ');
			writeln('programming | ');
			writeln('Total | ');
		end;
end.
