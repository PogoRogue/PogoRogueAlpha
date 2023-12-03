// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_Linebreak(str,maxLength,maxWordLength){
	///scr_linebreak(string,maxLength,maxWordLength)
	//Takes a string and automatically inserts linebreaks into it after a certain amount of characters.
	//string = string to automatically linebreak
	//maxLength = maximum length a line can be before breaking
	//maxWordLength = maximum length a word can be before the script gives up and starts a new line
 
	insert = 0;
	go = 0;
	prev = 0;
	text = str;
	repeat(string_length(text)) {
	    if insert > maxLength {
	        while(1) {
	            str = string_char_at(text,go-prev);
	            if str != " " {
	                prev += 1;
	            }
	            else {
	                break;
	            }
	            if prev > maxWordLength {
	                prev = 0;
	                break;
	            }
	        }
	        text = string_insert("\n",text,go-prev+1);
	        insert = 0;
	    }
	    insert += 1;
	    go += 1;
	    if string_char_at(text,go) = "\n" {
	       insert = 0;
	    }
	}
 
	return text;
}