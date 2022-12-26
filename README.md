제작자
========

이수현
* 고려대학교 사이버국방학과 12학번 / 정보보호대학원 17학번 
* email : d.constructuralism@gmail.com
* hompage : http://tinyurl.com/suhyeonlee
* Reference :
  * 고려대 핵물리학연구실(nuclear.korea.ac.kr) 제작 구 학위논문 LaTeX 템플릿 (http://github.com/KUThesis)
  * 고려대학교 일반대학원 공지사항 (https://graduate.korea.ac.kr/community/notice_view.html?no=659)



컴파일 환경/방법
===========

이 클래스는 overleaf 에서 테스트가 완료되었습니다.

직접 컴파일 하실경우 아래 문구를 참조하시기 바랍니다.
> 직접 컴파일 하실 경우 TeXLive 2013 이후 버전에서 동작하며 이전 버전에서는 koTeX 를 따로 설치해야할 수 있습니다. 
> 유닉스 환경에서는 `make`, 윈도우에서는 `make.bat`을 실행시키면 자동으로 컴파일이 되어 `thesis.pdf`파일이 생성됩니다. 중간에 뭔가 꼬여 처음부터 컴파일을 해야 할 일이 있다면, 유닉스 환경에서는 `make clean`, 윈도에어서는 `clean.bat`을 이용해서 초기화 할 수 있습니다. 이 때 사용자가 작성한 파일들은 날아가지 않으나 항상 조심하는게 좋으니 **백업을 강력하게 권장합니다.**




프로젝트 구성요소
=======================

(**강조된 글씨는 필수 파일**입니다)
* **클래스 파일: KUThesis.cls**
* **메인 파일: thesis.tex**
* **영문 초록: abstract.tex**
* 한글 초록: abstract-kr.tex
* **감사의 글: acknowledgement.tex**
* **bibTex: library.bib**
* 더미 파일: sample.tex


헤더 사용방법
====================

* 'doctor - master': 박사인가 석사인가
* 'final': 최종본일 경우 추가
* 'twosides - oneside': 양면인가 단면인가
* 'krabst': 국문초록
* 'asym': 홀수쪽과 짝수쪽에 제본 여백을 5mm 주고 반대쪽 여백을 5mm 줄임. 대부분의 제본소에서는 중앙에 있는것을 선호함 (제본소 문의 바람)

* 예제
> \documentclass[doctor, final, twosides, krabst] 
> \documentclass[master,final,oneside]{KUThesis}
> \documentclass[doctor,oneside]{KUThesis}            % draft + oneside



수정이 필요한 부분
=====================

* 메인 파일(thesis.tex) 수정(**필수**)
  * 저자명 수정(기본값: 이학생 Haksaeng Lee)
  * 지도교수명 수정(기본값: 김교수 Kyosoo Kim)
  * 학위논문 심사위원 명단 수정(기본값: Second Kim, etc.)
  * 학위논문명 수정
  * 소속학과(기본값: Department of Information Security, 정보보호학과), 필요시 대학원명(기본값: Graudate School, 일반대학원) 수정

* 학위논문 저자, 교수님 성함, 전공명에 따라 출력되는 줄바꿈 등이 어색할 수 있습니다. 이 경우 클래스 파일(KUThsis.cls)에서 직접 해당 부분 줄바꿈(\\) 혹은 글자크기 조정 등을 통해 해결하셔야 합니다.



주의
====

이 템플릿 파일을 사용해서 발생하는 모든 문제에 대해서 템플릿 작성자들은 어떠한 책임도 지지 않습니다.

참고 자료
=========

https://github.com/KUNPL/KUThesis
https://graduate.korea.ac.kr/community/notice_view.html?no=659&page=1
