/// @description Check Line

//Check for empty or redundant spaces.
if dataCheck = "" || string_char_at(dataCheck,1) = "[" || string_char_at(dataCheck,1) = "~" || string_char_at(dataCheck,1) = "-" exit;

//Define keywords.
var keyword, keywordMax = 15, c;
keyword[00] = "Window Width:";
keyword[01] = "Window Height:";
keyword[02] = "Stay on Top:";
keyword[03] = "Movement Speed:";
keyword[04] = "Banner Folder:";
keyword[05] = "Theme Folder:";
keyword[06] = "Refresh Button:";
keyword[07] = "Refresh Delay:";
keyword[08] = "Default Text:";
keyword[09] = "Refresh Text:";
keyword[10] = "Background Color:";
keyword[11] = "Refresh Color:";
keyword[12] = "Font Color:";
keyword[13] = "Font Size:";
keyword[14] = "Font Bold:";
keyword[15] = "Font Italic:";
//REMEMBER TO INCREASE KEYWORD MAX BASED ON KEYWORD AMOUNT.
//HAD A PRETTY BAD EXPERIENCE WITH THIS.

//Check if current line matches any of them.
for (c=0;c<=keywordMax;c++) if dataCheck = keyword[c] break;

//If a keyword was found...
if c != -1 {
	//... move to next line and delete the first character...
	var ss = string_delete(file_text_read_string(file),1,1);
	file_text_readln(file);
	//... then assign what's left to its corresponding variable.
	switch (c) {
		case 00: room_width = max(real(string_digits(ss)),1);
			break;
		case 01: room_height = max(real(string_digits(ss)),1);
			break;
		case 02: window_set_topmost(real(ss));
			break;
		case 03: scrollSpeed = real(ss);
			break;
		case 04: folderBanner = ss;
			break;
		case 05: folderTheme = ss;
			break;
		case 06: //refreshKey = 
			break;
		case 07: refreshDelay = real(ss);
			break;
		case 08: stringDef = ss;
			break;
		case 09: stringRef = ss;
			break;
		case 10: colorBack = hex(ss);
			break;
		case 11: colorRef = hex(ss);
			break;
		case 12: colorFont = hex(ss);
			break;
		case 13: fontSize = real(ss);
			break;
		case 14: fontBold = real(string_digits(ss));
			break;
		case 15: fontItalic = real(string_digits(ss));
			break;
		}
	}