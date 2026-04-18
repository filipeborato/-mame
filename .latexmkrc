$pdf_mode = 5;           # 5 = xelatex
$xelatex = 'xelatex -interaction=nonstopmode -file-line-error -synctex=1 %O %S';
$bibtex_use = 2;         # sempre rodar bibtex quando houver \bibliography
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml bcf fdb_latexmk fls';
