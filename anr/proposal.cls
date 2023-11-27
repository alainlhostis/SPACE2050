%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unofficial class for ANR Project proposals
%%
%% v1.2.4 - 21/02/2023: updated content to match the 2023 version of the ANR template, thanks to Vincent Colotte.
%% v1.2.3 - 08/09/2021: adjusted footer and header, thanks to Adel Noureddine.
%% v1.2.2 - 21/11/2020: adjusted to allow lists in notes, thanks to Christophe Gravier.
%% v1.2.1 - 25/02/2020: modification to fit the changes in packages pgfgantt, thanks to Nicolas Marchand.
%% v1.2   - 02/03/2019: minor adjustments to match the 2019 version of the template.
%% v1.1   - 12/04/2018: minor adjustments in the class file.
%% v1     - 07/03/2018: first draft.
%%
%% Vincent Labatut 2018-23 
%% <vincent.labatut@univ-avignon.fr>
%% https://www.overleaf.com/latex/templates/unofficial-template-for-anr-proposals/yqgzsxkzrqkw
%% Creative Commons CC BY 4.0
%%
%% Please tell me if you find any error.
%% And if you use this model for your ANR project: 
%% I only take 8% of your accepted budget ;)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% init class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anr/proposal}
\LoadClass[a4paper,11pt,final]{article}	% based on the existing latex class
\errorcontextlines 10000				% uncomment only when debugging


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% encoding and stuff
\RequirePackage[english]{babel}				% language package
\RequirePackage[utf8]{inputenc}				% use source file containing diacritics
\RequirePackage[T1]{fontenc}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% font settings
\RequirePackage[babel=true, kerning=true]
				{microtype}					% typographical refinements
\RequirePackage{lmodern}					% uses better fonts (?)
\renewcommand{\familydefault}{\sfdefault}	% use a sans-serif font as in the official template
\RequirePackage{eurosym}					% euro symbol (€): very important!


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% image settings
\RequirePackage[pdftex]{graphicx}			% improves \includegraphics


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% space-related settings
\RequirePackage[top=2cm, 					% 2cm margins, as specified in the official MS Word template
	bottom=2cm,
    left=2cm, 
    right=2cm]{geometry}					% changes document margins
\RequirePackage{setspace}					% controls spacing between lines


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% misc
\RequirePackage[english]{varioref} 			% improves cross-refs
\RequirePackage{lipsum}						% filler text
\RequirePackage{multicol}					% 2-column mode


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% header/footer settings
\RequirePackage{lastpage}					% computes the number of pages
\RequirePackage{fancyhdr}					% changes headers and setters
% \RequirePackage{titling}					% better control over the title
\setlength{\headheight}{30.3pt}				% set header vertical size
% \setlength{\headsep}{1.25cm}				% set space between header and text NOTE play with this value if the header is too tall
\newcommand{\setHeaders}{					% macro initializing the headers and footers
	\pagestyle{fancy}
	\fancyhf{}
	\chead{
        \rowcolors{1}{headcolor!20}{headcolor!20}
        \setlength{\arrayrulewidth}{1pt}
        \begin{tabularx}{\linewidth}{p{0.18\linewidth}|p{0.36\linewidth}|p{0.18\linewidth}|p{0.175\linewidth}}
            \arrayrulecolor{white}\hline
            {\LARGE\textcolor{anrcolor}{AAPG\myacyear}} & \multicolumn{2}{l|}{\large\textbf{\myacronym}} & \myinstrument \\
            \arrayrulecolor{white}\hline
            Coordinated by & \myinvestigator & \myduration & \myfunding \\
            \arrayrulecolor{white}\hline
            \multicolumn{4}{X}{\mycommittee} \\
        \end{tabularx}}
	\cfoot{\textcolor{black}{\thepage\ / \pageref*{LastPage}}}
%	\renewcommand\headrule{					% color and thickness of the header rule
%    	{\color{black}\hrule width \hsize}}
    \renewcommand\headrule{}
	\renewcommand\footrule{					% color and thickness of the footer rule
    	{\color{black}\hrule width \hsize} \kern 1mm}
}
\setlength{\footskip}{20pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% color settings
\RequirePackage[table]{xcolor}					% defines custom colors
\RequirePackage{colortbl}                       % to change the color of the table lines
% \let\normalcolor\relax							% prevent automatic restoration to black
\definecolor{headcolor}{rgb}{0.18,0.45,0.71}	% color for section headers and hyperlinks
\definecolor{anrcolor} {rgb}{0.00,0.00,1.00}	% color for "ANR" (in the header)
\definecolor{partnercol1}{HTML}{e41a1c}			% partner colors (taken from colorbrewer2.org)
\definecolor{partnercol2}{HTML}{4daf4a}			% green
\definecolor{partnercol3}{HTML}{984ea3}			% purple
\definecolor{partnercol4}{HTML}{ff7f00}			% orange
\definecolor{partnercol5}{HTML}{f781bf}			% pink
\definecolor{partnercol6}{HTML}{377eb8}			% blue
\definecolor{partnercol7}{HTML}{a65628}			% brown
\definecolor{partnercol8}{HTML}{ffff33}			% yellow
% NOTE: you must define additional colors in the (unlikely) case where you have more than 8 partners


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% diagram settings
\RequirePackage{tikz}							% programmatically defines drawings
\usetikzlibrary{arrows}							% configures arrow tips
\usetikzlibrary{arrows.meta}					% necessary to draw graphs
\usetikzlibrary{positioning} 					% ease relative positioning
\RequirePackage{anr/pgfgantt-custom}		    % gantt diagrams
\newcommand\ganttbarbis[5]{\ganttbar{#1}{#3}{#4}\ganttbar[inline, bar/.append style={fill=#5}, bar label font=\footnotesize]{#2}{#3}{#4}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% hyperlinks settings
\RequirePackage[
		bookmarks=true, bookmarksnumbered=true, bookmarksopen=true,
		unicode=true, colorlinks=true, linktoc=all, %linktoc=page
		linkcolor=headcolor, citecolor=headcolor, filecolor=headcolor, urlcolor=headcolor,
		pdfstartview=FitH
]{hyperref}										% enables hyperlinks
\RequirePackage{url}							% properly displays urls


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% table settings
\RequirePackage{tabularx}						% wide tables
\RequirePackage{multirow}						% cells spanning several rows
\newcommand{\HRule}{\rule{\linewidth}{0.5mm}}	% thicker line for the tables


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mathematical settings
\RequirePackage{amsmath}						% extended mathematical functions
\RequirePackage{amsthm}							% even more advanced math functions
\RequirePackage{amssymb}  						% additional math symbols
\newtheorem{theorem}{Theorem}					% those are not really needed here, but whatever
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{fact}[theorem]{Fact}
\newtheorem{Hypothesis}[theorem]{Hypothesis}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{definition}[theorem]{Definition}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% bibliographic settings
\usepackage{doi}						% displays DOIs in the bibliography
\usepackage[autostyle]{csquotes}		% don't remember why I put this
\usepackage[maxcitenames=2,				% two authors max in the text (only for author-year)
	maxbibnames=99,						% list all authors in the reference list
	style=numeric,						% numeric style for reference list
%    citestyle=numeric-comp,				% numeric style for citations
%	style=authoryear,					% NOTE: if you want the author-year style instead,
%	citestyle=authoryear-comp,			% uncomment these 2 lines and comment both ones above
%	backref=true,						% includes a page backlink in the reference list
%	dashed=false,						% displays all author names (only for authoryear)
    backend=biber]						% uses biber to compile (instead of bibtex)
{biblatex}								% uses biblatex (instead of bibtex)
\renewcommand*{\bibfont}{\footnotesize} % NOTE: font size of the bibliographical section text



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% caption settings
\RequirePackage{caption}					% caption customisation
\captionsetup{
	labelfont={color=headcolor, bf, small},	% font(sf), color, bold, size of the caption label
    textfont={small},						% font(sf) and size of the caption text itself
    labelsep=period,						% separator between label and text
    margin=10mm								% left/right margins
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom equations
%	\makeatletter								% change equation numbers
\def\tagform@#1{\maketag@@@{(\color{headcolor}\textbf{#1}\normalcolor)\@@italiccorr}}
%	\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%
% bullet list
%\renewcommand{\FrenchLabelItem}{\textbullet}	% use bullets even in French
\usepackage{enumitem}							% gives more control over lists
\setlist{nolistsep}								% changes spacing between list items


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% macros used to set the project details
\def\title#1{\gdef\@title{#1}\gdef\mytitle{#1}} % full title of the project
\def\subtitle#1{\gdef\mysubtitle{#1}}           % subtitle of the project (optional)
\def\acronym#1{\gdef\myacronym{#1}}			    % acronym of the project
\def\committee#1{\gdef\mycommittee{#1}}		    % scientific evaluation committee
\def\instrument#1{\gdef\myinstrument{#1}}	    % funding instrument
\def\acyear#1{\gdef\myacyear{#1}}				% year of the call
\def\investigator#1{\gdef\myinvestigator{#1}}   % principal investigator
\def\duration#1{\gdef\myduration{#1}}           % duration of the project
\def\funding#1{\gdef\myfunding{#1}}             % requested funding


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% custom section headers
\renewcommand\thesection{\arabic{section}}	% reproduce the numbering of the word template
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
\RequirePackage{titlesec}
\titleformat{\section}
	{\color{headcolor}\normalfont\Large\bfseries}
    {\thesection}
    {1em}
    {}
\titleformat{\subsection}
	{\color{headcolor}\normalfont\large\bfseries}
    {\thesubsection}
    {1em}
    {}
\titleformat{\subsubsection}
	{\color{headcolor}\normalfont\normalsize\bfseries}
    {\thesubsubsection}
    {1em}
    {}
\newcommand{\sectionn}[1]{
	\phantomsection
	\addcontentsline{toc}{section}{#1}
	\section*{#1}
    }
\newcommand{\subsectionn}[1]{
	\phantomsection
	\addcontentsline{toc}{subsection}{#1}
	\subsection*{#1}
    }
\newcommand{\subsubsectionn}[1]{
	\phantomsection
	\addcontentsline{toc}{subsubsection}{#1}
	\subsubsection*{#1
    }
\setcounter{secnumdepth}{3}			% numbers subsubsections
\setcounter{tocdepth}{5}			% and includes them in the TOC 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% work packages and tasks
\newcounter{CntWP}					% WP counter
\setcounter{CntWP}{-1}				% NOTE: comment this line to number WPs starting from 1
\newcounter{CntT}[CntWP]			% task counter
\newcommand{\wpdef}[2]{				% defines new WPs
	\refstepcounter{CntWP}\label{#1}
    \par\vspace{0.5cm}
	\phantomsection
	\addcontentsline{toc}{subsubsection}{WP~\arabic{CntWP}.~#2}
    \noindent
    {\normalfont\normalsize\bfseries\textcolor{headcolor}{Work Package~\arabic{CntWP}:~#2}}\newline}
\newcommand{\tdef}[2]{				% defines new tasks
	\refstepcounter{CntT}\label{#1}
    \par\vspace{0.25cm}
	\phantomsection
	\addcontentsline{toc}{paragraph}{Task~\arabic{CntWP}.\arabic{CntT}.~#2}
    \noindent\hspace{0.5cm}
    {\normalfont\normalsize\bfseries\itshape\textcolor{headcolor}{Task~\arabic{CntWP}.\arabic{CntT}:~#2}}\newline}
\renewcommand*\theCntT{\theCntWP.\arabic{CntT}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% maketitle macro
\renewcommand{\maketitle}
{	\setHeaders									% sets up the headers and footers	
	\hypersetup{pdftitle={\mytitle}}			% adds title to PDF properties
    \begin{center}
    	\vspace*{-0.25cm}						% adds a bit of space before the title
        \huge\textbf{\mytitle}				    % places the title
        \ifdefined\mysubtitle
            \\\Large\textbf{\mysubtitle}		% places the subtitle
        \fi%
    \end{center}
    \global\@topnum\z@							% prevents floats from going above the title
}


% more packages ALH 2023
\usepackage{comment}
\usepackage[titles]{tocloft}
\renewcommand{\cftchapafterpnum}{\vspace{\cftbeforechapskip}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% to underline authors names of members of the consortium in the biblio ALH 2023
% based on: https://tex.stackexchange.com/questions/73136/make-specific-author-bold-using-biblatex/73246#73246
\usepackage{xpatch}
\makeatletter
\newbibmacro*{name:bold}[2]{%
  \edef\blx@tmp@name{\expandonce#1, \expandonce#2}%
  \def\do##1{\ifdefstring{\blx@tmp@name}{##1}{\bfseries\listbreak}{}}%
  \dolistloop{\boldnames}}
\newcommand*{\boldnames}{}
\makeatother

\xpretobibmacro{name:family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:given-family}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:family-given}{\begingroup\usebibmacro{name:bold}{#1}{#2}}{}{}
\xpretobibmacro{name:delim}{\begingroup\normalfont}{}{}

\xapptobibmacro{name:family}{\endgroup}{}{}
\xapptobibmacro{name:given-family}{\endgroup}{}{}
\xapptobibmacro{name:family-given}{\endgroup}{}{}
\xapptobibmacro{name:delim}{\endgroup}{}{}
