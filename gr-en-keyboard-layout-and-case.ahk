#NoEnv
#SingleInstance Force
SetBatchLines, -1
SendMode Input
SetWorkingDir %A_ScriptDir%

; ---------------------------
; Change Language (F10)
; ---------------------------

; Λεξικά μετατροπών
el2en := {"α":"a", "Α":"A", "β":"b", "Β":"B", "γ":"g", "Γ":"G", "δ":"d", "Δ":"D"
        , "ε":"e", "Ε":"E", "ζ":"z", "Ζ":"Z", "η":"h", "Η":"H", "θ":"u", "Θ":"U"
        , "ι":"i", "Ι":"I", "κ":"k", "Κ":"K", "λ":"l", "Λ":"L", "μ":"m", "Μ":"M"
        , "ν":"n", "Ν":"N", "ξ":"j", "Ξ":"J", "ο":"o", "Ο":"O", "π":"p", "Π":"P"
        , "ρ":"r", "Ρ":"R", "σ":"s", "Σ":"S", "τ":"t", "Τ":"T", "υ":"y", "Υ":"Y"
        , "φ":"f", "Φ":"F", "χ":"x", "Χ":"X", "ψ":"c", "Ψ":"C", "ω":"v", "Ω":"V"
        , "΄":";", "¨":":"}
		 
; Αντίστροφο λεξικό (Αγγλικά -> Ελληνικά)
en2el := {"a":"α", "A":"Α", "b":"β", "B":"Β", "g":"γ", "G":"Γ", "d":"δ", "D":"Δ"
        , "e":"ε", "E":"Ε", "z":"ζ", "Z":"Ζ", "h":"η", "H":"Η", "u":"θ", "U":"Θ"
        , "i":"ι", "I":"Ι", "k":"κ", "K":"Κ", "l":"λ", "L":"Λ", "m":"μ", "M":"Μ"
        , "n":"ν", "N":"Ν", "j":"ξ", "J":"Ξ", "o":"ο", "O":"Ο", "p":"π", "P":"Π"
        , "r":"ρ", "R":"Ρ", "s":"σ", "S":"Σ", "t":"τ", "T":"Τ", "y":"υ", "Y":"Υ"
        , "f":"φ", "F":"Φ", "x":"χ", "X":"Χ", "c":"ψ", "C":"Ψ", "v":"ω", "V":"Ω"
        , ";":"΄"}
		


; Συνάρτηση διόρθωσης κειμένου
fixText(text) {
    global el2en, en2el
    result := ""
	prevChar := ""  ; Αρχικοποίηση του prevChar ως κενό
	nextChar := ""  ; Αρχικοποίηση για το επόμενο γράμμα
	skipNext := false ; Σημαία για παράκαμψη του επόμενου χαρακτήρα
	
	Loop, Parse, text
    {
        char := A_LoopField
		



		if (skipNext) {
        skipNext := false ; Καθαρίζει τη σημαία
        continue ; Παρακάμπτει την τρέχουσα επανάληψη και πάει στο επόμενο γράμμα
		}
		
	
		if (A_Index < StrLen(text)) {  ; Ελέγχει αν δεν είναι το τελευταίο γράμμα
            nextChar := SubStr(text, A_Index + 1, 1)  ; Παίρνει το επόμενο γράμμα
        } else {
			nextChar := ""  ; Εάν είναι το τελευταίο γράμμα, το επόμενο γράμμα είναι κενό
		}
		
		
		

		; Διορθώνουμε αρχικά τον τονισμό
		if (char = ";" && Asc(nextChar) = 97) {  ; "a" έχει Asc 97
			result .= Chr(940)  ; ά
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 101) {  ; "e" έχει Asc 101
			result .= Chr(941)  ; έ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 104) {  ; "h" έχει Asc 104
			result .= Chr(942)  ; ή
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 105) {  ; "i" έχει Asc 105
			result .= Chr(943)  ; ί
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 111) {  ; "o" έχει Asc 111
			result .= Chr(972)  ; ό
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 121) {  ; "y" έχει Asc 121
			result .= Chr(973)  ; ύ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 118) {  ; "v" έχει Asc 118
			result .= Chr(974)  ; ώ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 65) {  ; "A" έχει Asc 65
			result .= Chr(902)  ; ʼ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 69) {  ; "E" έχει Asc 69
			result .= Chr(904)  ; Έ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 72) {  ; "H" έχει Asc 72
			result .= Chr(905)  ; Ή
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 73) {  ; "I" έχει Asc 73
			result .= Chr(906)  ; Ί
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 79) {  ; "O" έχει Asc 79
			result .= Chr(908)  ; Ό
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 89) {  ; "Y" έχει Asc 89
			result .= Chr(910)  ; Ύ
			skipNext := true
		} else if (char = ";" && Asc(nextChar) = 86) {  ; "V" έχει Asc 86
			result .= Chr(911)  ; Ώ
			skipNext := true
		} else if (char = Chr(940)) {  ; ά
			result .= ";a"
		} else if (char = Chr(941)) {  ; έ
			result .= ";e"
		} else if (char = Chr(942)) {  ; ή
			result .= ";h"
		} else if (char = Chr(943)) {  ; ί
			result .= ";i"
		} else if (char = Chr(972)) {  ; ό
			result .= ";o"
		} else if (char = Chr(973)) {  ; ύ
			result .= ";y"
		} else if (char = Chr(974)) {  ; ώ
			result .= ";v"
		} else if (char = Chr(902)) {  ; Ά
			result .= ";A"
		} else if (char = Chr(904)) {  ; Έ
			result .= ";E"
		} else if (char = Chr(905)) {  ; Ή
			result .= ";H"
		} else if (char = Chr(906)) {  ; Ί
			result .= ";I"
		} else if (char = Chr(908)) {  ; Ό
			result .= ";O"
		} else if (char = Chr(910)) {  ; Ύ
			result .= ";Y"
		} else if (char = Chr(911)) {  ; Ώ
			result .= ";V"
		}



		
		
 ; Εκτύπωση για debugging
 ; MsgBox, prevChar: %prevChar%`ncurrentChar: %char%`nnextChar: %nextChar%

       ; Ειδικός χειρισμός για "!", "#", "^", "+", "{", "}", "enter", ":", "q", "Q", "w", "W", "ς", ";"
	   
	   
	      else if Asc(char) = 33  ; ! έχει Asc 33 - Το εξαφανίζει λόγω ότι είναι δεσμευμένο σύμβολο και αναπαριστάνει το Alt κουμπί
        {
            SendRaw !

        }
          else if Asc(char) = 35  ; # έχει Asc 35 - Το εξαφανίζει λόγω ότι είναι δεσμευμένο σύμβολο και αναπαριστάνει το Win κουμπί
        {
            SendRaw #
        }
          else if Asc(char) = 94  ; ^ έχει Asc 94 - Το εξαφανίζει λόγω ότι είναι δεσμευμένο σύμβολο και αναπαριστάνει το Ctrl κουμπί
        {
            SendRaw ^
        }
          else if Asc(char) = 43  ; + έχει Asc 43 - Το εξαφανίζει λόγω ότι είναι δεσμευμένο σύμβολο και αναπαριστάνει το Shift κουμπί
        {
            SendRaw + 
        }
          else if Asc(char) = 123  ; { έχει Asc 123 - Το εξαφανίζει λόγω ότι χρησιμοποιείται γενικότερα για special characters & key names
        {
            SendRaw {
        }
          else if Asc(char) = 125  ; } έχει Asc 125 - Το εξαφανίζει λόγω ότι χρησιμοποιείται γενικότερα για special characters & key names
        {
            SendRaw }
        } else if Asc(char) = 13  { ; 13 είναι το Asc του Enter - Για αδιευκρίνιστο λόγο στο "enter" προσθέτει με γεωμετρική πρόοδο του 2 "enter" παραπάνω
            result .= Chr(13)  ;      Προσθέτει ένα Enter στο αποτέλεσμα
			skipNext := true
        } else if (char = ":") {  ; Για αδιευκρίνιστο λόγο δεν λειτουργεί η μετατροπή ως ":":"¨" μέσα στο λεξικό (εκτός εάν το βάλουμε στο el2en) οπότε το εισάγουμε εδώ 
            result .= "¨"		
		} else if (char = "q" || char = "Q") {  ; Για αδιευκρίνιστο λόγο δεν λειτουργούν οι μετατροπές "q":";" & "Q":";" μέσα στο λεξικό οπότε τα εισάγουμε εδώ
            result .= ";"
        } else if (char = "w" || char = "W") {  ; Για αδιευκρίνιστο λόγο δεν λειτουργούν οι μετατροπές "w":"ς" & "W":"ς" μέσα στο λεξικό οπότε τα εισάγουμε εδώ
            result .= "ς"
        } else if (char = "ς") {
     		if (prevChar = "" || prevChar = "." || prevChar = "!" || prevChar = "?" || prevChar = "'" || prevChar = """" || prevChar = "«" || (Asc(nextChar) >= 913 && Asc(nextChar) <= 937)) {
                result .= "W"  ; Αν είναι το πρώτο γράμμα ή προηγείται τελεία ή θαυμαστικό ή ερωτηματικό ή μονά/διπλά/γωνιώδη εισαγωγικά ή το επόμενο είναι κεφαλαίο τότε κεφαλαίο W
            } else {
                result .= "w"  ; Αλλιώς μικρό w
            }
        } else if (char = ";") {			
            if (prevChar = "" || prevChar = "." || prevChar = "!" || prevChar = "?" || prevChar = "'" || prevChar = """" || prevChar = "«" || (Asc(nextChar) >= 913 && Asc(nextChar) <= 937)) {
                result .= "Q"  ; Αν είναι το πρώτο γράμμα ή προηγείται τελεία ή θαυμαστικό ή ερωτηματικό ή μονά/διπλά/γωνιώδη εισαγωγικά ή το επόμενο είναι κεφαλαίο τότε κεφαλαίο Q
            } else {
                result .= "q"  ; Αλλιώς μικρό q
            }
		
        } ; Μετατροπή Ελληνικά ? Αγγλικά
        else if (el2en.HasKey(char)) {
            result .= el2en[char]
        }
        ; Μετατροπή Αγγλικά ? Ελληνικά
        else if (en2el.HasKey(char)) {
            if char ~= "\p{Lu}" ; Αν είναι κεφαλαίο
                result .= en2el[char]
            else
                result .= Chr(Asc(en2el[char]) + 32)  ; Μετατρέπει σε πεζό
        } else {
            result .= char  ; Κρατάει το χαρακτήρα αν δεν υπάρχει αντιστοίχιση
        }
		
		; Ενημερώνει το prevChar μόνο αν δεν είναι κενό
		if (char != " ") {
			prevChar := char
		}
    }
    return result
}

; Hotkey F10: Διορθώνει το επιλεγμένο κείμενο
F10::
    Clipboard := ""  ; Καθαρίζει το πρόχειρο
    Send, ^c  ; Αντιγράφει το επιλεγμένο κείμενο
    ClipWait, 2  ; Περιμένει έως 2 δευτερόλεπτα για το κείμενο
    if (Clipboard != "")
    {
        fixedText := fixText(Clipboard)  ; Διορθώνει το κείμενο
        Sleep, 100  ; Αυξημένη καθυστέρηση για σταθερότητα
        ; Καθαρισμός πεδίου πριν την εισαγωγή
        ; Εισαγωγή κειμένου χαρακτήρα-χαρακτήρα
        Loop, Parse, fixedText
        {
            Send, %A_LoopField%
            Sleep, 10  ; Μικρή καθυστέρηση ανά χαρακτήρα
        }
    }
  

; ---------------------------
; Toggle Greek case (F8)
; ---------------------------
return
F8::
Clipboard := ""  ; Καθαρισμός πρόχειρου
Send, ^c        ; Αντιγραφή του επιλεγμένου κειμένου
ClipWait, 1     ; Αναμονή για να γεμίσει το πρόχειρο

if (Clipboard == "") {
    MsgBox, Δεν επιλέξατε κείμενο!
    return
}

output := ""
Loop, Parse, Clipboard
{
    char := A_LoopField
    unicode := Asc(char)

    ; Διατήρηση του "ς"
    if (unicode = 962) {  ; Αν είναι το "ς"
        output .= char
        continue
    }

    ; Μετατροπή των τονισμένων χαρακτήρων
    if (unicode = 940)  ; ά -> Ά
        output .= Chr(902)  ; Ά
    else if (unicode = 941)  ; έ -> Έ
        output .= Chr(904)  ; Έ
    else if (unicode = 942)  ; ή -> Ή
        output .= Chr(905)  ; Ή
    else if (unicode = 943)  ; ί -> Ί
        output .= Chr(906)  ; Ί
    else if (unicode = 972)  ; ό -> Ό
        output .= Chr(908)  ; Ό
    else if (unicode = 973)  ; ύ -> Ύ
        output .= Chr(910)  ; Ύ
    else if (unicode = 974)  ; ώ -> Ώ
        output .= Chr(911)  ; Ώ
    ; Αν το γράμμα είναι κεφαλαίο και τονισμένο
    else if (unicode = 902)  ; Ά -> ά
        output .= Chr(940)  ; ά
    else if (unicode = 904)  ; Έ -> έ
        output .= Chr(941)  ; έ
    else if (unicode = 905)  ; Ή -> ή
        output .= Chr(942)  ; ή
    else if (unicode = 906)  ; Ί -> ί
        output .= Chr(943)  ; ί
    else if (unicode = 908)  ; Ό -> ό
        output .= Chr(972)  ; ό
    else if (unicode = 910)  ; Ύ -> ύ
        output .= Chr(973)  ; ύ
    else if (unicode = 911)  ; Ώ -> ώ
        output .= Chr(974)  ; ώ
    else
        ; Απλή μετατροπή από πεζό σε κεφαλαίο ή αντίστροφα
        if char ~= "\p{Ll}"  ; Είναι πεζό
            output .= Chr(unicode - 32)
        else if char ~= "\p{Lu}"  ; Είναι κεφαλαίο
            output .= Chr(unicode + 32)
        else
            output .= char
}

Clipboard := output
Send, ^v        ; Επικόλληση του τροποποιημένου κειμένου
return

; https://symbl.cc/ - unicode letters code - Το Asc(char) είναι το HTML Code του καθε γράμματος