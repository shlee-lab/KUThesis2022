% -*- TeX:UTF-8 -*-
%%  고려대학교 석·박사 학위논문 LaTeX 템플릿
%%
%%         버전: 3.0
%%
%%         작성자: 이수현
%%               - email : d.constructuralism@gmail.com
%%               - homepage : http://tinyurl.com/suhyeonlee
%%               - git : https://github.com/hyeonleee/KUThesis2022
%%
%%         제작 일자 : 2022. 12. 25
%%         업데이트  : 2022. 12. 25
%%
%%
%%         참고자료: 1. KAIST Thesis Templete for LaTeX version 0.4 
%%                 2. KU Thesis Template for Latex version 2.11 (제작자: 장진희, https://github.com/KUNPL/KUThesis)
%%
%%               
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  여러분의 참여가 이 템플릿을 더욱 완벽하게 만들 수 있습니다. 
%%
%%          
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{KUThesis}

%% 옵션 선언을 위한 변수 선언
\newif\if@isDoctor
\newif\if@isFinal
\newif\if@isPdfdoc
\newif\if@isDebug
\newif\if@isTwosides
\newif\if@isLongDeptName
\newif\if@isTOCHeader
\newif\if@isContentHeader
\newif\if@isBibHeader
\newif\if@isKrabst
\newif\if@isKrack
\newif\if@isAsym
\newif\if@isLibrary


%% 새 옵션 모음 - doctor|master, final|draft
\DeclareOption{doctor}       {\@isDoctortrue}
\DeclareOption{master}       {\@isDoctorfalse}
\DeclareOption{final}        {\@isFinaltrue}
\DeclareOption{pdfdoc}       {\@isPdfdoctrue}
\DeclareOption{debug}        {\@isDebugtrue}
\DeclareOption{twosides}     {\@isTwosidestrue}
\DeclareOption{oneside}      {\@isTwosidesfalse}
\DeclareOption{krabst}       {\@isKrabsttrue}
\DeclareOption{krack}        {\@isKracktrue}
\DeclareOption{asym}         {\@isAsymtrue}
\DeclareOption{library}      {\@isLibrarytrue}


%% leqno,fleqn,openbib 옵션은 그대로 report 클래스에 전달
\DeclareOption{leqno}  {\PassOptionsToClass{leqno}  {report}}
\DeclareOption{fleqn}  {\PassOptionsToClass{fleqn}  {report}}
\DeclareOption{openbib}{\PassOptionsToClass{openbib}{report}}

%% doctor,draft,twoside가 기본값
\@isDoctortrue
\@isFinalfalse
\@isTwosidestrue
\@isLongDeptNamefalse
\@isTOCHeaderfalse
\@isContentHeaderfalse
\@isBibHeaderfalse
\@isKrabstfalse
\@isKrackfalse
\@isAsymfalse
\@isLibraryfalse
\ProcessOptions

%% 11pt,onecolumn,oneside 옵션으로 report 클래스 불러오기
\if@isTwosides
  \LoadClass[11pt,onecolumn,twoside,openright]{report}
\else
  \LoadClass[11pt,onecolumn,oneside]{report}
\fi


%% 여백 체크용 디버그 옵션
\if@isDebug
  \usepackage[a4,frame,center]{crop}
\fi

%% Table of contents, List of figures, List of tables를 Table of Contents에 추가
\usepackage{tocbibind}

%% 편집용지 설정 (4x6 배판 - 190x260 mm2)
\if@isAsym
  \usepackage[inner = 25mm ,       outer = 15mm,
                top = 30mm,       bottom = 30mm,
         paperwidth = 190mm, paperheight = 260mm]{geometry}
\else
  \usepackage[inner = 20mm ,       outer = 20mm,
                top = 30mm,       bottom = 30mm,
         paperwidth = 190mm, paperheight = 260mm]{geometry}
\fi

%% 들여쓰기
\usepackage{indentfirst}
\setlength\parindent{0em}

%% Figure와 Caption사이 거리 조정
\setlength{\abovecaptionskip}{10pt} % 캡션 위 거리
\setlength{\belowcaptionskip}{0pt}  % 캡션 아래 거리

%% bibliography
\usepackage[square,numbers]{natbib}
\bibliographystyle{ieeetr}

\RequirePackage{ifthen}       % 추가 패키지 설정
\RequirePackage[strict]{changepage}
\RequirePackage{emptypage}
\RequirePackage{graphicx} % xcolor
\RequirePackage[toc,page]{appendix}
\RequirePackage{amsmath,amssymb,textcomp,bm}
\RequirePackage[pagewise]{lineno}
\RequirePackage{fix-cm}
\RequirePackage[cjk]{kotex}
\RequirePackage[nomessages]{fp}
\RequirePackage{fancyhdr}
\RequirePackage{pdfpages}
\RequirePackage{multirow}



%% Caption의 줄간격 설정
\RequirePackage{caption,setspace}
\captionsetup[table]{font={stretch=\@captionLineSpacing}}
\captionsetup[figure]{font={stretch=\@captionLineSpacing}}

%% PDF 파일로 문서를 만들었을 때 링크 활성화
\if@isPdfdoc
  \RequirePackage[unicode,%
       pageanchor=false,%
           pdftex=true,%
        bookmarks=true,%
       colorlinks=true%
    ]{hyperref}
\else
\fi



\newcounter{dummy}
\RequirePackage{etoolbox}
\AfterEndPreamble{                       % \begin{document}와 함께 실행
  \checkparameters                         % 문서 변수가 올바른지 점검
  \if@isLibrary                        % 도서관 제출용에는 빈 페이지가 들어가면 안됨
    \let\cleardoublepage\clearpage
  \fi
  \newgeometry{       left = 40mm,
                     right = 30mm,
                       top = 30mm,
                    bottom = 30mm}        % 여백 다른 페이지용 여백
  \makefrontcover                          % 앞표지 생성
  \makeEngtitle                               % 속표지 생성
  \if@isFinal                              % final 옵션이 지정되어 있으면
    \newgeometry{       left = 40mm,
                       right = 30mm,
                         top = 40mm,
                      bottom = 30mm}        % 여백 다른 페이지용 여백
    \makeapproval                          % 제출승인서, 심사완료검인 생성
  \else
    \linenumbers
  \fi 
  \restoregeometry                         % 여백 되돌림
  \refstepcounter{dummy}
  \makeabstract                            % 초록 페이지 생성
  \if@isFinal
    \refstepcounter{dummy}
    \if@isKrabst
      \makekrabstract
    \fi
    \makeacknowledgement
  \fi
  %\pagenumbering{roman}                   % 2020년 2월 졸업논문 제출시 과학도서관 지적사항
  %\setcounter{page}{1}                    % 
  \makecontents

  \pagenumbering{arabic}
  \setcounter{page}{1}

  \renewcommand{\arraystretch}{1.3}
}

\AtEndDocument{                             % \end{document}와 함께 실행
  \bibliography{library.bib}
  \addevenpage
}


%\RequirePackage{xcolor}

%% 고려대학교 공식 영문명칭
\newcommand{\@koreauniv}{Korea University}

%% 소속 대학원 이름 표기 (기본값: 일반 대학원)
\newcommand{\graduateSchool}[3] {
    \newcommand{\@departmentNameKor}{#1}
    \newcommand{\@departmentNameEng}{#2}
    \newcommand{\@graduateSchoolName}{#3}
}
\@onlypreamble{\graduateSchool}

% @command title 논문 제목
\renewcommand{\title}[3] {
  \ifnum#1=3
    \newcommand{\@titleSize}{19pt}
    \newcommand{\@univSize}{18pt}
  \else
    \ifnum#1=2
      \newcommand{\@titleSize}{21pt}
      \newcommand{\@univSize}{18pt}
    \else
      \ifnum#1=0
        \newcommand{\@titleSize}{30pt}
      \else
        \newcommand{\@titleSize}{28pt}
      \fi
      \newcommand{\@univSize}{20pt}
    \fi
  \fi
  \newcommand{\@titleEng}{#2}
  \newcommand{\@titleKor}{#3}
}
\@onlypreamble{\title}

% @command author 저자 이름
% @param family_name, given_name 성, 이름을 구분해서 입력
% @options [default: (none)]
% - korean: 한글이름 | chinese: 한문이름 | english: 영문이름
\renewcommand{\author}[4][chinese] {%
    \ifthenelse{\equal{#1}{chinese}}
        {\newcommand{\@authorChnF}{#2}
         \newcommand{\@authorChnS}{#3}
         \newcommand{\@authorChnT}{#4}
         \ifthenelse{\equal{#4}{}}{
           \newcommand{\@authorChn}{#2#3}
         }{
           \newcommand{\@authorChn}{#2#3#4}
         }{}%
         \ifthenelse{\equal{#4}{}}{
           \newcommand{\@authorChnSpace}{#2\ #3}
         }{
           \newcommand{\@authorChnSpace}{#2\ #3\ #4}
         }}{}%
    \ifthenelse{\equal{#1}{english}}
        {\newcommand{\@authorEngFN}{#2}
         \newcommand{\@authorEngGN}{#3}
         \ifthenelse{\equal{#4}{}}{
           \newcommand{\@authorEng}{#3\ #2}
         }{
           \newcommand{\@authorEng}{#3\ #4\ #2}
         }}{}%
    \ifthenelse{\equal{#1}{korean}}
        {
        \ifthenelse{\equal{#4}{}}{
           \newcommand{\@authorKorSpace}{#2\ #3}
           \newcommand{\@authorKor}{#2#3}
         }{
           \newcommand{\@authorKorSpace}{#2\ #3\ #4}
           \newcommand{\@authorKor}{#2#3#4}
         }
         }{}%
}
\@onlypreamble{\author}

% 현재는 주 지도교수만 지원
% @command advisor 지도교수 이름 (복수가능)
% @options [default: major]
% - major: 주 지도교수  | coopr: 부 지도교수 (공동지도교수 경우)
\newcommand{\advisor}[3]{%
  \newcommand{\@advisorMajorKor}{#1}  % 한글이름 저장
  \newcommand{\@advisorMajorChn}{#2}  % 영문이름 저장
  \newcommand{\@advisorMajorEng}{#3}  % 영문이름 저장
}
\@onlypreamble{\advisor}

\if@isDoctor
  \newcommand{\@degreeChn}{博}
  \newcommand{\@degreeEng}{Doctor}
  \newcommand{\@degreeKor}{박}
  \newcommand{\@degreeFullName}{Doctor of Philosophy}
  \newcommand{\@paperKind}{Dissertation} % 미국계열과 영국계열에 따라 박사학위, 석사학위, 학사학위 논문을 Dissertation / Thesis 호칭이 달라지나 일반대학원 양식에 따라 박사는 Dissertation, 석사는 Thesis 로 한다
  \newcommand{\@paperKindLower}{dissertation}
\else
  \newcommand{\@degreeChn}{碩}
  \newcommand{\@degreeEng}{Master}
  \newcommand{\@degreeKor}{석}
  \newcommand{\@degreeFullName}{Master of Arts}
  \newcommand{\@paperKind}{Thesis} % 미국계열과 영국계열에 따라 박사학위, 석사학위, 학사학위 논문을 Dissertation / Thesis 호칭이 달라지나 일반대학원 양식에 따라 박사는 Dissertation, 석사는 Thesis 로 한다
  \newcommand{\@paperKindLower}{thesis}
\fi

% @command department 
%
\newcommand{\department}[2] {%
    \ifthenelse{\equal{#1}{PH}}
        {\newcommand{\@deptNameEng}{Physics}
         \newcommand{\@deptNameChn}{物\ 理\ 學\ 科}
         \newcommand{\@deptNameKor}{물리학과}
         \newcommand{\@deptNameShort}{物理學}
         \newcommand{\@degreeName}{理學}} {}
    \ifthenelse{\equal{#1}{CRCE}}
        {\newcommand{\@deptNameEng}{Computer and Radio Communications Engineering}
         \newcommand{\@deptNameChn}{컴\ 퓨\ 터\ $\cdot$\ 電\ 波\ 通\ 信\ 工\ 學\ 科}
         \newcommand{\@deptNameKor}{컴퓨터$\cdot$전파통신공학과}
         \newcommand{\@deptNameShort}{컴퓨터$\cdot$電波通信工學}
         \newcommand{\@degreeName}{컴퓨터$\cdot$電波通信工學}
         \@isLongDeptNametrue} {}
    \ifthenelse{\equal{#1}{CSE}}
        {\newcommand{\@deptNameEng}{Computer Science Engineering}
         \newcommand{\@deptNameChn}{컴\ 퓨\ 터\ 學\ 科}
         \newcommand{\@deptNameKor}{컴퓨터학과}
         \newcommand{\@deptNameShort}{컴퓨터學}
         \newcommand{\@degreeName}{컴퓨터學}} {}
    \ifthenelse{\equal{#1}{IS}}
        {\newcommand{\@deptNameEng}{Information Security}
         \newcommand{\@deptNameChn}{정\ 보\ 보\ 호\ 學\ 科}
         \newcommand{\@deptNameKor}{정\ 보\ 보\ 호\ 학\ 과}
         %\newcommand{\@deptNameKor}{정보보호학과}
         \newcommand{\@deptNameShort}{정보보호학}
         \newcommand{\@degreeName}{정보보호學}} {}
}
\@onlypreamble{\department}

% @command referee 심사위원 (석사과정 3인, 박사과정 5인)
\newcommand{\referee}[2][1] {%
    \ifthenelse{\equal{#1}{1}}{\newcommand{\@refereeChief} {#2}} {}%
    \ifthenelse{\equal{#1}{2}}{\newcommand{\@refereeSecond}{#2}} {}%
    \ifthenelse{\equal{#1}{3}}{\newcommand{\@refereeThird} {#2}} {}%
    \ifthenelse{\equal{#1}{4}}{\newcommand{\@refereeFourth}{#2}} {}%
    \ifthenelse{\equal{#1}{5}}{\newcommand{\@refereeFifth} {#2}} {}%
}
\@onlypreamble{\referee}

% @command graduateDate 졸업년월
\newcommand{\graduateDate}[2]{
  \newcommand{\@graduateYear}{#1}
  \newcommand{\@graduateMonth}{#2}
}
\@onlypreamble{\graduateDate}

% @command submitDate 제출일자
\newcommand{\submitDate}[3]{
  \newcommand{\@submitYear}{#1}
  \newcommand{\@submitMonth}{#2}
  \newcommand{\@submitDay}{#3}
}
\@onlypreamble{\submitDate}

% @command approvalDate 인준일자
\newcommand{\approvalDate}[3]{
  \newcommand{\@approvalYear}{#1}
  \newcommand{\@approvalMonth}{#2}
  \ifthenelse{\equal{#2}{1}}
  {
    \newcommand{\@approvalMonthEng}{January}
  }{}
  \ifthenelse{\equal{#2}{2}}
  {
    \newcommand{\@approvalMonthEng}{February}
  }{}
  \ifthenelse{\equal{#2}{3}}
  {
    \newcommand{\@approvalMonthEng}{March}
  }{}
  \ifthenelse{\equal{#2}{4}}
  {
    \newcommand{\@approvalMonthEng}{April}
  }{}
  \ifthenelse{\equal{#2}{5}}
  {
    \newcommand{\@approvalMonthEng}{May}
  }{}
  \ifthenelse{\equal{#2}{6}}
  {
    \newcommand{\@approvalMonthEng}{June}
  }{}
  \ifthenelse{\equal{#2}{7}}
  {
    \newcommand{\@approvalMonthEng}{July}
  }{}
  \ifthenelse{\equal{#2}{8}}
  {
    \newcommand{\@approvalMonthEng}{August}
  }{}
  \ifthenelse{\equal{#2}{9}}
  {
    \newcommand{\@approvalMonthEng}{September}
  }{}
  \ifthenelse{\equal{#2}{10}}
  {
    \newcommand{\@approvalMonthEng}{October}
  }{}
  \ifthenelse{\equal{#2}{11}}
  {
    \newcommand{\@approvalMonthEng}{November}
  }{}
  \ifthenelse{\equal{#2}{12}}
  {
    \newcommand{\@approvalMonthEng}{December}
  }{}
  \newcommand{\@approvalDay}{#3}
}
\@onlypreamble{\approvalDate}

% @command abstractLineSpacing 초록 줄간격
\newcommand{\abstractLineSpacing}[1]{
  \FPeval{\@abstractLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\abstractLineSpacing}

% @command krAbstractLineSpacing 국문초록 줄간격
\newcommand{\krAbstractLineSpacing}[1]{
  \FPeval{\@krAbstractLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\krAbstractLineSpacing}

% @command TOCLineSpacing 목차 줄간격
\newcommand{\TOCLineSpacing}[1]{
  \FPeval{\@TOCLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\TOCLineSpacing}

% @command contentLineSpacing 본문 줄간격
\newcommand{\contentLineSpacing}[1]{
  \FPeval{\@lineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\contentLineSpacing}

% @command acknowledgementLineSpacing 감사의글 줄간격
\newcommand{\acknowledgementLineSpacing}[1]{
  \FPeval{\@acknowledgementLineRatio}{#1/100.0/1.236} 
}
\@onlypreamble{\acknowledgementLineSpacing}

% @command captionLineSpacing 캡션 줄간격
\newcommand{\captionLineSpacing}[1]{
  \FPeval{\@captionLineSpacing}{#1/100.0/1.236} 
}
\@onlypreamble{\captionLineSpacing}

% @command addTOCHeader TOC, LOF, LIT에 헤더 추가
\newcommand{\addTOCHeader} {
  \@isTOCHeadertrue
}
\@onlypreamble{\addTOCHeader}

% @command addContentHeader 본문에 헤더 추가
\newcommand{\addContentHeader} {
  \@isContentHeadertrue
}
\@onlypreamble{\addContentHeader}

% @command addBibHeader 참고문헌에 헤더 추가
\newcommand{\addBibHeader} {
  \@isBibHeadertrue
}
\@onlypreamble{\addBibHeader}

% @command 본문 추가
\newcommand{\addContents}[1]{
  \setlength\parindent{5mm}
  \if@isContentHeader
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[LE]{\nouppercase\leftmark}
    \fancyhead[RO]{\nouppercase\rightmark}
    \fancyfoot[CE,CO]{\thepage}
  \fi
  \renewcommand{\baselinestretch}{\@lineRatio}
  \selectfont{\input{#1}}
  \setlength\parindent{0mm}
}

%%
%% 필요한 정보 중에 누락된 것이 없는지 점검
%%
\newcommand{\checkparameters}{%
    \@ifundefined{@titleEng}{%
        \ClassError{KUThesis}{The English title is not found}{}}{}
    \@ifundefined{@titleKor}{%
        \ClassError{KUThesis}{The English title is not found}{}}{}
    \@ifundefined{@authorKorSpace}{%
        \ClassError{KUThesis}{The Korean name of the author is not found}{}}{}
    \@ifundefined{@authorChn}{%
        \ClassError{KUThesis}{The Chinese name of the author is not found}{}}{}
    \@ifundefined{@authorEng}{%
        \ClassError{KUThesis}{The English name of the author is not found}{}}{}
    \@ifundefined{@advisorMajorKor}{%
        \ClassError{KUThesis}{The Korean name of the major advisor is not found}{}}{}
    \@ifundefined{@advisorMajorEng}{%
        \ClassError{KUThesis}{The English name of the major advisor is not found}{}}{}
    \@ifundefined{@advisorMajorChn}{%
        \ClassError{KUThesis}{The Chinese name of the major advisor is not found}{}}{}
}

%%
%% 영문 날짜 표기
%%
\newcommand{\@dateUSenglish}[2]{%  % 미국식 날짜 표기
    \newcommand{\@year}{#1}%
    \newcommand{\@month}{#2}%
    \ifcase\@month \or
        January \or February \or March \or April \or May \or June \or
        July \or August \or September \or October \or November \or December \fi
    \@year
}

%%
%% 빈 페이지 생성
%%
\newcommand{\emptypage}{
  \newpage
  \thispagestyle{empty}
  \hbox{ }
  \newpage
}

%%
%% 양면 출력일 때 홀수 페이질 경우 빈 페이지 추가
%%
\newcommand{\addevenpage}{
    \if@isLibrary
%% 도서관 제출용에는 빈 페이지가 들어가면 안됨
    \else
        \if@isTwosides
            \checkoddpage
            \ifoddpage
            \emptypage
        \fi
        \else
            \newpage
        \fi
    \fi
}

%%
%% 앞표지 생성
%%
\newcommand{\makefrontcover}{%
    \newpage
    \renewcommand{\baselinestretch}{1.3}%
    \thispagestyle{empty}
    \begin{minipage}[t][12mm][t]{112mm}
        \begin{center}
            \if@isDoctor
              \fontsize{16pt}{16pt}\selectfont\bf{Doctoral Dissertation}
            \else
              \fontsize{16pt}{16pt}\selectfont\bf{Master's Thesis}
            \fi            
        \end{center}
    \end{minipage}\\[30mm]
    \hspace*{-15mm}\begin{minipage}[t][50mm][t]{142mm}
        \begin{center}
            \fontsize{\@titleSize}{\@titleSize}\selectfont{\bf \@titleEng}
        \end{center}
    \end{minipage}\vfill
    \begin{minipage}[b][85mm][b]{112mm}
        \begin{center}
            %\fontsize{16pt}{16pt}\selectfont{\bf by}
            %\\[5mm]
            \fontsize{16pt}{16pt}\selectfont{\bf \@authorEng}
            \\[5mm]
            \fontsize{16pt}{16pt}\selectfont{\bf Department of \@departmentNameEng}
            \if@isLongDeptName
              \\[8mm]
            \else
              \\[15mm]
            \fi
            \fontsize{18pt}{18pt}\selectfont{\bf \@graduateSchoolName} 
            \\[5mm]
            \fontsize{\@univSize}{\@univSize}\selectfont{\bf \@koreauniv}
            \\[10mm]
            \fontsize{14pt}{14pt}\selectfont{\bf
            \@dateUSenglish{\@graduateYear}{\@graduateMonth}}
        \end{center}
    \end{minipage}
    \addevenpage
}

%%
%% 속표지 생성
%%
\newcommand{\makeKortitle}{%
    \newpage
    \renewcommand{\baselinestretch}{1.3}%
    \thispagestyle{empty}
    \hspace*{-15mm}\begin{minipage}[t][16pt][t]{142mm}
      \begin{center}
        \fontsize{16pt}{16pt}\selectfont\bf{\@advisorMajorKor\ 교수지도}
        \\[5mm]
        \fontsize{16pt}{16pt}\selectfont\bf{\@degreeKor\ 사\ 학\ 위\ 논\ 문}
        \\[30mm]
        \fontsize{\@titleSize}{\@titleSize}\selectfont{\bf \@titleEng}
      \end{center}
    \end{minipage}\vfill
    \begin{minipage}[b][110mm][b]{112mm}
      \begin{center}
        \if@isLongDeptName
          \fontsize{15pt}{15pt}\selectfont{\bf 이 논문을 \@deptNameShort}\\
          \fontsize{15pt}{15pt}\selectfont{\bf {\@degreeKor}사학위 논문으로 제출함}
          \\[25mm]
        \else
          \fontsize{15pt}{15pt}\selectfont{\bf 이 논문을 \@deptNameShort{ }{\@degreeKor}사학위 논문으로 제출함}
          \\[30mm]
        \fi
        \fontsize{14pt}{14pt}\selectfont{\bf {\@submitYear}년\ {\@submitMonth}월}
        \\[30mm]
        \fontsize{\@univSize}{\@univSize}\selectfont{\bf 고\ 려\ 대\ 학\ 교\ 대\ 학\ 원}
        \\[5mm]
        \fontsize{16pt}{16pt}\selectfont{\bf {\@deptNameKor}}
        \\[10mm]
        \fontsize{16pt}{16pt}\selectfont{\bf {\@authorKorSpace}}
        \fontsize{14pt}{14pt}\selectfont{\bf \hspace{10mm} (印)}
      \end{center}
    \end{minipage}
    \addevenpage
}

% 영어 속표지
\newcommand{\makeEngtitle}{%
    \newpage
    \renewcommand{\baselinestretch}{1.3}%
    \thispagestyle{empty}
    \if@isLibrary
        \hspace*{-7mm}
    \else
        \hspace*{-15mm}
    \fi
    \begin{minipage}[t][0pt][t]{142mm}
      \begin{center}
        \fontsize{21pt}{21pt}\selectfont\bf{\@titleEng}
        \\[30mm]
      \end{center}
    \end{minipage}\vfill
    \begin{center}
    \if@isLibrary
        \hspace*{7mm}
    \else
        \hspace*{-13mm}
    \fi
    \begin{minipage}[b][150mm][c]{112mm} %112
        \begin{center}
            \fontsize{16pt}{16pt}\selectfont{ by}
            \\[1mm]
            \fontsize{16pt}{16pt}\selectfont{ {\@authorEng}}
            \\[10mm]
            \fontsize{16pt}{16pt}\selectfont{\underline{\hspace{6cm}}}
            \\[7mm]
            \fontsize{16pt}{16pt}\selectfont{under the supervision of \\ Professor {\@advisorMajorEng}}
            \\[5mm]
            \fontsize{16pt}{16pt}\selectfont{A {\@paperKindLower} submitted in partial fulfillment of the requirements for the degree of \\ {\@degreeFullName}}
            \\[10mm]
            \fontsize{16pt}{16pt}\selectfont{\bf Department of \@departmentNameEng}
            \if@isLongDeptName
              \\[8mm]
            \else
              \\[15mm]
            \fi
            \fontsize{18pt}{18pt}\selectfont{\bf \@graduateSchoolName }
            \\[5mm]
            \fontsize{\@univSize}{\@univSize}\selectfont{\bf \@koreauniv}
            \\[10mm]
            \fontsize{14pt}{14pt}\selectfont{\bf
            \@dateUSenglish{\@submitYear}{\@submitMonth}}
        \end{center}
    \end{minipage}
    \end{center}
    \addevenpage
}

%%
%% 학위논문 심사완료 검인서 생성
%%
\newcommand{\approvalScan}[1]{%
  \newcommand{\@scanFile}{#1}
}

\newcommand{\makeapproval}{%
  \@ifundefined{@scanFile}
  {
    \newpage
    \thispagestyle{empty}
    \renewcommand{\baselinestretch}{1.2}
    \begin{minipage}[t][20mm][t]{112mm}
      \begin{center}
        \fontsize{16pt}{16pt}\selectfont{The {\@paperKindLower} of {\@authorEng} has been approved by the {\@paperKindLower} committee in partial fulfillment of the requirements for the degree of {\@degreeFullName}}
        \\[15mm]
        
        \fontsize{14pt}{14pt}\selectfont{ {\@approvalMonthEng}\ {\@approvalYear}}
        \\[20mm]
        \underline{\hspace{7cm}}
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\hspace{20mm} Committee Chair: {\@refereeChief}} \raggedright
        \fontsize{14pt}{14pt}
        \\[10mm]
        \underline{\hspace{7cm}} \centering
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\hspace{20mm} Committee Member: {\@refereeSecond}} \raggedright
        \fontsize{14pt}{14pt}
        \\[10mm]
        \underline{\hspace{7cm}} \centering
        \\[1.5mm]
        \fontsize{14pt}{14pt}\selectfont{\hspace{20mm} Committee Member: {\@refereeThird}} \raggedright
        \fontsize{14pt}{14pt}
        \\[10mm]        
        
        \if@isDoctor
          \underline{\hspace{7cm}} \centering
          \\[1.5mm]
          \fontsize{14pt}{14pt}\selectfont{\hspace{20mm} Committee Member: {\@refereeFourth}} \raggedright
          \\[10mm]
          \underline{\hspace{7cm}} \centering
          \\[1.5mm]
          \fontsize{14pt}{14pt}\selectfont{\hspace{20mm} Committee Member: {\@refereeFifth}} \raggedright
        \else\fi
      \end{center}
    \end{minipage}
    \addevenpage
  }{
    \includepdf{\@scanFile}
    \if@isTwosides
      \emptypage
    \fi
  }
}

%%
%% 초록 페이지 생성
%%
\newcommand{\makeabstract}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{toc}{chapter}{Abstract}
  \pagenumbering{roman}
  \vspace*{\fill}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\bf Abstract}
  \end{center}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@abstractLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{abstract/abstract}}
  \setlength\parindent{0mm}
  \vspace*{\fill}
  \addevenpage
}

%%
%% 한국어 초록 페이지 생성
%%
\newcommand{\makekrabstract}{%
  \newpage
  \thispagestyle{empty}
  \addcontentsline{}{chapter}{국문초록}
  %\pagenumbering{gobble}
  \begin{center}
    \fontsize{16pt}{16pt}\selectfont{\textbf{국 문 초 록} \\ \, \\ \@titleKor}
  \end{center}

  \fontsize{13pt}{13pt}\selectfont
  \begin{center}
  \@authorKorSpace \\
  \@departmentNameKor \\
  지도교수: {\@advisorMajorKor}
  \end{center}
  \vspace*{0.1cm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@krAbstractLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{abstract/abstract-kr}}
  \setlength\parindent{0mm}
  \vspace*{\fill}
  \addevenpage
}

%%
%% 목차 일괄 생성
%%
\newcommand{\makecontents}{%            % TOC, LOT, LOF 생성
  \if@isTOCHeader
    \pagestyle{fancy}
    \fancyhf{}
    \fancyhead[LE]{\nouppercase\leftmark}
    \fancyhead[RO]{\nouppercase\leftmark}
    \fancyfoot[CE,CO]{\thepage}
  \fi
  \renewcommand{\baselinestretch}{\@TOCLineRatio}\selectfont
  \tableofcontents
  \addevenpage
  \listoffigures
  \addevenpage
  \listoftables
  \addevenpage
  \clearpage
}

%%
%% 감사의 글 페이지 생성
%%
\newcommand{\makeacknowledgement}{%
  \newpage
  \thispagestyle{empty}
  \if@isKrack
    \addcontentsline{toc}{chapter}{감사의글}
  \else
    \addcontentsline{toc}{chapter}{Acknowledgement}
  \fi
  %\pagenumbering{gobble}
  \begin{center}
    \if@isKrack
      \fontsize{16pt}{16pt}\selectfont{\bf 감사의글}
    \else
      \fontsize{16pt}{16pt}\selectfont{\bf Acknowledgement}
    \fi
  \end{center}
  \vspace{5mm}

  \setlength\parindent{5mm}
  \renewcommand{\baselinestretch}{\@acknowledgementLineRatio}\selectfont
  \fontsize{11pt}{12pt}\selectfont{\indent\input{acknowledgement}}
  \setlength\parindent{0mm}
  \addevenpage
}



