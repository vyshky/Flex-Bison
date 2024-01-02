start /B /WAIT /D "./strparser/" win_flex.exe -i --outfile="lexer.cpp.flex.cpp" --wincompat "lexer.cpp.l"
pause
exit

commets
start - выполнить, запустить консоль
/B - выполнить в текущей консоли, не открывая новоей окно
/WAIT - подождать пока откроется
/D - директория


-i - Не учитывать регистр
--outfile - имя файла после компиляции лексера
--wincompat  - Cовместимость с windows
file.l - передаем лексер файл