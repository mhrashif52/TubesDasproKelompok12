Unit F04;

interface

uses F13,record_perpus;

var
	buku, arrfind : array[1..NMax] of DataBuku;
	stop : boolean;
	t : string;
	k : char;
	i,j : integer;
	
	{ Deklarasi Prosedur }
	procedure findKat (var k : char);

implementation
	
	procedure findKat (var k : char);
		var
			count : integer;
			
		begin
				j := 0;
				i := 0;
				count := 0;
				write('Masukkan tahun: ');
				readln(t);
				write('Masukkan kategori: ');
				readln(k);
				writeln('Hasil Pencarian buku');
				for i := 1 to NMax do
					begin
						if (k = '=') and (arrDataBuku[i].tahunterbit = t)then 
							begin
								arrDataBuku[i].idBuku := arrfind[j].idBuku;
								arrDataBuku[i].judul :=  arrfind[j].judul;
								arrDataBuku[i].author := arrfind[j].author;
								j := j + 1;
								count := count + 1
						end else if ( k = '<') and (arrDataBuku[i].tahunterbit < t) then
							begin 
								arrDataBuku[i].idBuku := arrfind[j].idBuku;
								arrDataBuku[i].judul :=  arrfind[j].judul;
								arrDataBuku[i].author := arrfind[j].author;
								j := j + 1;
								count := count + 1
						end else if ( k = '>') and (arrDataBuku[i].tahunterbit > t) then
							begin 
								arrDataBuku[i].idBuku := arrfind[j].idBuku;
								arrDataBuku[i].judul :=  arrfind[j].judul;
								arrDataBuku[i].author := arrfind[j].author;
								j := j + 1;
								count := count + 1
								
						end else if ( k = '<=') and (arrDataBuku[i].tahunterbit <= t) then
							begin 
								arrDataBuku[i].idBuku := arrfind[j].idBuku;
								arrDataBuku[i].judul :=  arrfind[j].judul;
								arrDataBuku[i].author := arrfind[j].author;
								j := j + 1;
								count := count + 1
								
						end else if ( k = '>=') and (arrDataBuku[i].tahunterbit >= t) then
							begin 
								arrDataBuku[i].idBuku := arrfind[j].idBuku;
								arrDataBuku[i].judul :=  arrfind[j].judul;
								arrDataBuku[i].author := arrfind[j].author;
								j := j + 1;
								count := count + 1
						end else
							begin
								count := count;
							end;
					end;
					
				if(count > 0) then
					begin
					for i := 1 to NMax do
						begin
						writeln(arrfind[j].idBuku, ' | ', arrfind[j].judul,' | ', arrfind[j].author);
						end;
				end else
					begin
						writeln('Tidak ada buku dalam kategori ini');
					end;
	end;
end.
