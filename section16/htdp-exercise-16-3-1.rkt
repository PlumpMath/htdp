;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname htdp-exercise-16-3-1) (read-case-sensitive #t) (teachpacks ((lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "dir.rkt" "teachpack" "htdp")))))
#| 파일
파일은 다음 구조체다.
(make-file n s x) : n은 기호, s는 수, x는 임의의 scheme 값이다.

;; template
(define (fun-for-file a-file)
  ... (file-name a-file) ...
  ... (file-size a-file) ...
  ... (file-content a-file) ...)
|#
  

#| 파일 리스트(LOF)
파일 리스트(LOF)는 리스트이며, 다음 중 하나다.
1. empty
2. (cons f lof) : f는 파일, lof는 파일 리스트다.

;; template
(define (fun-for-lof a-lof)
  (cond ((empty? a-lof) ...)
        ((cons? a-lof) ... (first a-lof) ... (fun-for-lof (rest a-lof)) ...)
        (else (error 'fun-for-lof "invalid list of files"))))
|#


#| 디렉토리
디렉토리는 다음 구조체다.
(make-dir n ds fs) : n은 기호, ds는 디렉토리 리스트, fs는 파일 리스트다.

;; template
(define (fun-for-dir a-dir)
  ... (dir-name a-dir) ...
  ... (dir-dirs a-dir) ...
  ... (dir-files a-dir) ...)
|#


#| 디렉토리 리스트(LOD)
디렉토리 리스트(LOD)는 리스트이며, 구체적으로 다음 중 하나다.
1. empty
2. (cons d lod) : d는 디렉토리, lod는 디렉토리 리스트다.

;; template
(define (fun-for-lod a-lod)
  (cond ((empty? a-lod) ...)
        ((cons? a-lod) ... (first a-lod) ... (fun-for-lod (rest a-lod)))
        (else (error 'fun-for-lod "invalid list of directories"))))

|#

(define D44
  (make-dir 'TD
            (list (make-dir 'Text
                            empty
                            (list (make-file 'part1
                                             99
                                             empty)
                                  (make-file 'part2
                                             52
                                             empty)
                                  (make-file 'part3
                                             17
                                             empty)))
                  (make-dir 'Libs
                            (list (make-dir 'Code
                                            empty
                                            (list (make-file 'hang
                                                             8
                                                             empty)
                                                  (make-file 'draw
                                                             2
                                                             empty)))
                                  (make-dir 'Docs
                                            empty
                                            (list (make-file 'read!
                                                             19
                                                             empty))))
                            empty))
            (list (make-file 'read!
                             10
                             empty))))


(define D1
  (make-dir '|c:\Intel|
            (list (make-dir '|c:\Intel\Logs|
                            empty
                            (list (make-file 'IntelChipset.log 256098 "")
                                  (make-file 'IntelGFX.log 110872 ""))))
            empty))

(define D2
  (make-dir
   '|e:\driver|
   (list
    (make-dir
     '|e:\driver\롯데|
     empty
     (list
      (make-file 'easyprinttoolbox_v120eng1.exe 697703 "")
      (make-file 'i6500_win2kxp_v163kr.exe 2736143 "")
      (make-file 'lbp4280k_Win2KXP.exe 916025 "")
      (make-file 'lbp6525k_Win2K_S2003_XP.exe 950441 "")))
    (make-dir
     '|e:\driver\청호|
     empty
     (list (make-file '428.exe 11275039 "") (make-file '430.exe 11274840 "") (make-file '4600.exe 11275039 "") (make-file '932.exe 11274840 ""))))
   empty))

(define D3
  (make-dir
   '|c:\jumin|
   (list
    (make-dir
     '|c:\jumin\font|
     empty
     (list
      (make-file 'ENG_24.RAS 3744 "")
      (make-file 'hanja.fnt 0 "")
      (make-file 'HAN_24.RAS 172872 "")
      (make-file 'OJUPD.CTL 700 "")
      (make-file 'OJUPD.EXE 18773 "")
      (make-file 'Orum00.ttf 3214420 "")
      (make-file 'ORUM01.TTF 2638620 "")
      (make-file 'ORUM02.TTF 2720852 "")
      (make-file 'ORUM03.TTF 2778408 "")
      (make-file 'ORUM04.TTF 2106928 "")
      (make-file 'ORUM05.TTF 2051664 "")
      (make-file 'ORUM06.TTF 1946220 "")
      (make-file 'ORUM07.TTF 1929668 "")
      (make-file 'ORUM08.TTF 1874432 "")
      (make-file 'ORUM09.TTF 1891404 "")
      (make-file 'ORUM1.TTF 1656040 "")
      (make-file 'ORUM10.TTF 1910672 "")
      (make-file 'ORUM11.TTF 1808320 "")
      (make-file 'ORUM12.TTF 1740220 "")
      (make-file 'ORUM13.TTF 1750820 "")
      (make-file 'ORUM14.TTF 1702652 "")
      (make-file 'ORUM15.TTF 1725564 "")
      (make-file 'ORUM2.TTF 3153812 "")
      (make-file 'ORUM3.TTF 3204424 "")
      (make-file 'ORUM4.TTF 748768 "")
      (make-file 'set0523.exe 1621126 "")
      (make-file 'setfont.exe 291840 "")
      (make-file 'setup.bat 173 "")
      (make-file 'setup.PIF 2857 "")
      (make-file 'setup_H.bat 119 "")
      (make-file 'setup_H.PIF 2857 "")
      (make-file 'sim_16.ras 64 "")
      (make-file 'sim_24.ras 96 "")
      (make-file 'Sim_40.ras 320 "")
      (make-file 'TCPJUMIN.exe 722432 "")
      (make-file 'UNI16_1.RAS 688128 "")
      (make-file 'UNI16_2.RAS 1934752 "")
      (make-file 'UNI24_1.RAS 1548288 "")
      (make-file 'UNI24_2.RAS 4353192 "")
      (make-file 'UNI40_1.RAS 4300800 "")
      (make-file 'UNI40_2.RAS 12092200 "")
      (make-file 'unibi.dat 14664 "")
      (make-file 'UNICODE.RAS 8554 "")
      (make-file 'UniCodeW.ras 6744 "")
      (make-file 'UNIFONT.RAS 583944 "")
      (make-file 'UniFontW.ras 95226 "")
      (make-file 'unihanw.dll 21504 "")
      (make-file 'UNIORUM1.TBL 216264 "")
      (make-file 'UNIORUM2.TBL 605454 "")
      (make-file 'UniOrum_1.tbl 173158 "")
      (make-file 'UniOrum_2.tbl 304910 "")
      (make-file 'upd16.ras 960 "")
      (make-file 'upd24.ras 2160 "")
      (make-file 'upd40.ras 6000 "")
      (make-file '설치안내0523.hwp 82460 ""))))
   empty))
