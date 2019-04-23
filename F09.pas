Unit F09;

interface

uses Record_Perpus;	

var
	Bukufile : text;
	textline : string;
	arrNewBook : array[1..NMax] of DataBuku;
	InputBukuBaru : DataBuku;
	
	
procedure registerBukuBaru;

procedure updateregisterBukuBaru(arrNewBook : array of DataBuku);


implementation

procedure registerBukuBaru;

begin
	writeln('Masukkan informasi buku yang ditambahkan:');
	write('Masukkan id buku: ');
	readln(InputBukuBaru.idBuku);
	write('Masukkan judul buku: '); 
	readln(InputBukuBaru.judul);
	write('Masukkan pengarang buku: ');
	readln(InputBukuBaru.author);
	write('Masukkan jumlah buku: ');
	readln(InputBukuBaru.jumlah);
	write('Masukkan tahun terbit buku: ');
	readln(InputBukuBaru.tahunterbit);
	write('Massukan kategori buku: ');
	readln(InputBukuBaru.kategori);
	
	NeffBukuBaru := NeffBukuBaru + 1;
	arrNewBook[NeffBukuBaru].idBuku := InputBukuBaru.idBuku;
	arrNewBook[NeffBukuBaru].judul := InputBukuBaru.judul;
	arrNewBook[NeffBukuBaru].author := InputBukuBaru.author;
	arrNewBook[NeffBukuBaru].jumlah := InputBukuBaru.jumlah;
	arrNewBook[NeffBukuBaru].tahunterbit := InputBukuBaru.tahunterbit;
	arrNewBook[NeffBukuBaru].kategori := InputBukuBaru.kategori;
end;

procedure updateregisterBukuBaru(arrNewBook : array of DataBuku);
var
	j : integer;
begin
	system.Assign(Bukufile, 'buku.csv');
	system.Append(Bukufile);
	for j := 1 to NeffBukuBaru do
	begin
		textLine := arrNewBook[j].idBuku + ',' + arrNewBook[j].judul + ',' + arrNewBook[j].author + ','+ arrNewBook[j].jumlah +
		',' + arrNewBook[j].tahunterbit + ',' + arrNewBook[j].kategori + ',' ;
		writeln(Bukufile,textline);
end;
writeln('Buku berhasil ditambakan');
Close(Bukufile);
end;

end.
	
