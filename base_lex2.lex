// Specification JFlex
import java_cup.runtime.Symbol;
 
%%
%unicode
%cup
%line
%column

%{
	public int getYyLine(){
		return yyline+1;
	}
	public int getYyColumn(){
		return yycolumn+1;
	}
	public String getYyText(){
		return yytext();
	}
%}

// qqs exemples de macros...
chiffre = [0-9]
entier = {chiffre}+
argVide = "_"
point = "."
virgule = ","
egal = "="
doublegal = "=="
deuxpoints = ":"
ptvirgule = ";"
ouvertureParent = "("
fermetureParent = ")"
ouvertureAccolade = "{"
fermetureAccolade = "}"
nomVariables = [a-z]+[0-9]
apDeclaEclairage = "eclairage"
apDeclaVolet = "volet"
apDeclaFenetre = "fenetre"
apDeclaChauffage = "chauffage"
apDeclaAlarme = "alarme"
apDeclaAutre = "autre_appareil(".*")".*
apDeclaEnsemble = "definir".+
inDeclaInterrupteur = "interrupteur"
inDeclaMobile = "mobile"
inDeclaTelephone = "telephone"
inDeclaTablette = "tablette"
inDeclaTelecommande = "telecommande"
pourtout = "pourtout"
faire = "faire"
fait = "fait"
si = "si"
alors = "alors"
sinon = "sinon"
fsi = "fsi"
print = "message(\"".*"\")"
exeScenario = "executer_scenario".+
comAssoc = "associer"
comProg = "programmer"
debutBalise = "<"
finBalise = "</"
fermetureBalise = ">"
baliseInit = "PROGRAMME_DOMUS"
baliseAppareils = "DECLARATION_APPAREILS"
baliseInterfaces ="DECLARATION_INTERFACES"
baliseScenarii = "DECLARATION_SCENARII"
baliseScenario = "SCENARIO".[^>]+
commentaire = "//".*
baliseCommandes = "DECLARATION_COMMANDES"
texte = [A-Za-z]+

%%
// qqs exemples de rËgles lexicales lÈgales...
{entier} { return new Symbol(sym.ENTIER, new Integer(yytext())); }
//{ident} { return new Symbol(sym.IDENT, yytext()); }
{argVide} { return new Symbol(sym.ARGVIDE, yytext()); }
{point} { return new Symbol(sym.POINT, yytext()); }
{virgule} { return new Symbol(sym.VIRG, yytext()); }
{egal} { return new Symbol(sym.EGAL, yytext()); }
{doublegal} { return new Symbol(sym.DOUBLEGAL, yytext()); }
{deuxpoints} { return new Symbol(sym.DEUXPOINTS, yytext()); }
{ptvirgule} { return new Symbol(sym.PTVIRGULE, yytext()); }
{ouvertureParent} { return new Symbol(sym.PAROUVRE, yytext()); }
{fermetureParent} { return new Symbol(sym.PARFERME, yytext()); }
{ouvertureAccolade} { return new Symbol(sym.ACCOUVRE, yytext()); }
{fermetureAccolade} { return new Symbol(sym.ACCFERME, yytext()); }
{nomVariables} { return new Symbol(sym.NOMVAR, yytext()); }
{apDeclaEclairage} { return new Symbol(sym.APDECLAECLAIRAGE, yytext()); }
{apDeclaVolet} { return new Symbol(sym.APDECLAVOLET, yytext()); }
{apDeclaFenetre} { return new Symbol(sym.APDECLAFENETRE, yytext()); }
{apDeclaChauffage} { return new Symbol(sym.APDECLACHAUFFAGE, yytext()); }
{apDeclaAlarme} { return new Symbol(sym.APDECLAALARME, yytext()); }
{apDeclaAutre} { return new Symbol(sym.APDECLAAUTRE, yytext()); }
{apDeclaEnsemble} { return new Symbol(sym.APDECLAENSEMBLE, yytext()); }
{inDeclaInterrupteur} { return new Symbol(sym.INDECLAINTERRUPTEUR, yytext()); }
{inDeclaMobile} { return new Symbol(sym.INDECLAMOBILE, yytext()); }
{inDeclaTelephone} { return new Symbol(sym.INDECLATELEPHONE, yytext()); }
{inDeclaTablette} { return new Symbol(sym.INDECLATABLETTE, yytext()); }
{inDeclaTelecommande} { return new Symbol(sym.INDECLATELECOMMANDE, yytext()); }
{pourtout} { return new Symbol(sym.FORALL, yytext()); }
{faire} { return new Symbol(sym.DO, yytext()); }
{fait} { return new Symbol(sym.DONE, yytext()); }
{si} { return new Symbol(sym.IF, yytext()); }
{alors} { return new Symbol(sym.THEN, yytext()); }
{sinon} { return new Symbol(sym.ELSE, yytext()); }
{fsi} { return new Symbol(sym.ENDIF, yytext()); }
{print} { return new Symbol(sym.PRINT, yytext()); }
{commentaire} { return new Symbol(sym.COMMENT, yytext()); }
{exeScenario} { return new Symbol(sym.EXESCENARIO, yytext()); }
{comAssoc} { return new Symbol(sym.COMASSOC, yytext()); }
{comProg} { return new Symbol(sym.COMPROG, yytext()); }
{debutBalise} { return new Symbol(sym.BALISEOUVRANTE, yytext()); }
{finBalise} { return new Symbol(sym.BALISEFERMANTE, yytext()); }
{fermetureBalise} { return new Symbol(sym.FINBALISE, yytext()); }
{baliseInit} { return new Symbol(sym.BALISEINIT, yytext()); }
{baliseAppareils} { return new Symbol(sym.BALISEAPPAREIL, yytext()); }
{baliseInterfaces} { return new Symbol(sym.BALISEINTERFACE, yytext()); }
{baliseScenarii} { return new Symbol(sym.BALISESCENARII, yytext()); }
{baliseScenario} { return new Symbol(sym.BALISESCENARIO, yytext()); }
{baliseCommandes} { return new Symbol(sym.BALISECOMMANDE, yytext()); }
{texte} { return new Symbol(sym.TEXT, yytext()); }

\n {}
// exemple de rËgle de dÈtection d'erreurs lexicales...
\s { }
.  {System.out.println(" Erreur ligne "+(yyline+1)+" colonne "+(yycolumn+1)+" : "+yytext()+" => caract√®re inconnu ! "); } 
