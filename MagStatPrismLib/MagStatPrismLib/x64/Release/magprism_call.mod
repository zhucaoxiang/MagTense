	  Ïp  ñ   k820309    4          12.1        (èXX                                                                                                           
       D:\work\magnetostatic_prisms\MagStatPrismVoronoi\MagStatPrismLib\MagStatPrismLib\MagPrism.f90 MAGPRISM_CALL                                                    
                                                          
                            @                             
                         @               @                '                    #T    #H    #M    #TCRIT_COOL    #TCRIT_HEAT 	   #HCRIT_COOL 
   #HCRIT_HEAT    #NT    #NH    #NCRITCOOL    #NCRITHEAT                                                                            
            &                                                                                                 H                 
            &                                                                                                                  
            &                   &                                                                                                 ð                 
            &                                                                                     	            8                
            &                                                                                     
                            
            &                                                                                                 È                
            &                                                                                                                                                               	                                                             
                                                                   #         @                                                  #QSORTC%SIZE    #A                                                     SIZE           
                                                   
               &                                           #         @                                                    #TXT    #DBLARR                                                                                                                                        
 	              &                                           #         @                                                    #TXT    #VALINT    #VALDBL                                                                                                                                                                                 
       #         @                                                    #TABLE    #XVAL    #YVAL    #N1    #N2    #X     #Y !   #RES "            
                                                      
      p        5 O p        p          5 O p          5 O p            5 O p          5 O p                                   
                                                      
    p          5 O p            5 O p                                   
                                                      
    p          5 O p            5 O p                                    
                                                       
                                                       
                                        
                
                                  !     
                                                 "     
                                                    #                                                       0                                             $                                                      1#         @                                 %                   #X &   #Y '   #XVAL (   #N )   #YVAL *            
                                  &                    
    p          5 O p            5 O p                                   
                                  '                    
    p          5 O p            5 O p                                    
                                  (     
                
                        @         )                     
                                 *     
                                                    +     
                 
                 PERTû!	@        3.141592654#         @                                  ,                  #CALCH%CSHIFT -   #CALCH%CEILING .   #CALCH%ABS /   #CALCH%SQRT 0   #CALCH%PRESENT 1   #CALCH%MAXVAL 2   #POS 3   #DIMS 5   #DIR 6   #MAGTYPE 7   #HEXT 8   #T 9   #N 4   #STATEFCN :   #STATEFCNINDICES <   #M ;   #SOLPTS =   #L >   #SPACEDIM ?   #HOUT @   #MOUT A   #NITE B   #ROTANGLES C   #HYST_MAP_INIT D   #HYST_MAP E   #HINT_INIT F                                              -     CSHIFT                                            .     CEILING                                            /     ABS                                            0     SQRT                                            1     PRESENT                                            2     MAXVAL          
  @                               3                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                                   
  @                               5                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                                   
  @                               6                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                                   
  @                               7                        p          5  p        r 4       5  p        r 4                              
                                  8                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                                   
  @                               9                    
    p          5  p        r 4       5  p        r 4                               
  @                     @         4                    
  @                               :                         p          5  p 
       r ;       5  p 
       r ;                     #STATEFUNCTION             
  @                               <                     	   p          5  p        r 4       5  p        r 4                               
  @                     @         ;                    
  @                               =                    
 
     p        5  p        r >   p          5  p        r >     p            5  p        r >     p                                    
  @                               >                     
  @                               ?                   D @                               @                   
               &                   &                                                   D @                               A                   
               &                   &                                                     
D                                 B                     
  @                               C                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                                   
  @                               D                        p          5  p        r 4       5  p        r 4                              
D @                               E                         p          5  p        r 4       5  p        r 4                              
 @                               F                    
      p        5  p        r 4   p          5  p        r 4     p            5  p        r 4     p                          #         @                                 G                  #FINDROTATIONMATRICES%TRANSPOSE H   #FINDROTATIONMATRICES%MATMUL I   #ROTANGLES J   #N K   #ROTMAT L   #ROTMATINV M                                              H     TRANSPOSE                                            I     MATMUL          
  @                               J                    
 ?     p        5  p        r K   p          5  p        r K     p            5  p        r K     p                                    
                        @         K                   
D                                 L                   
 @              &                   &                   &                                                   
D                                 M                   
 A              &                   &                   &                                           #         @                                 N                  #CALCNTENSOR%MATMUL O   #POS P   #DIMS R   #N_OUT S   #N Q   #SPACEDIM T   #ROTMAT U                                              O     MATMUL          
                                 P                    
 ;     p        5  p        r Q   p          5  p        r Q     p            5  p        r Q     p                                   
  @                              R                    
 :     p        5  p        r Q   p          5  p        r Q     p            5  p        r Q     p                                  
D @                              S                   
 <              &                   &                   &                   &                                                     
                        H         Q                     
                                 T                    
                                 U                    
 =       p        p        p        5  p        r Q   p          5  p        r Q     p          p            5  p        r Q     p          p                          #         @                                 V               
   #GETM%SQRT W   #H X   #T Z   #MOUT [   #DIR \   #MAGTYPE ]   #N Y   #STATEFCN ^   #STATEFCNINDICES `   #M _   #HYST_MAP a                                              W     SQRT          
                                 X                    
 %     p        5  p        r Y   p          5  p        r Y     p            5  p        r Y     p                                   
  @                              Z                    
 '   p          5  p        r Y       5  p        r Y                              
D                                [                    
 (      p        5  p        r Y   p          5  p        r Y     p            5  p        r Y     p                                   
                                 \                    
 &     p        5  p        r Y   p          5  p        r Y     p            5  p        r Y     p                                   
                                 ]                     )   p          5  p        r Y       5  p        r Y                               
                        H         Y                    
                                 ^                    *     p           n                                           25  p 	       r _        n                                      25  p 	       r _                     #STATEFUNCTION                  
                                 `                     +   p          5  p        r Y       5  p        r Y                               
                                 _                    
                                 a                     ,   p          5  p        r Y       5  p        r Y                     #         @                                 b                  #GETHDEM%MATMUL c   #M d   #N e   #HDEM f   #N_OUT g   #ROTMATINV h                                              c     MATMUL          
                                 d                    
 5     p        5  p        r e   p          5  p        r e     p            5  p        r e     p                                    
                        H         e                    
D                                f                    
 7      p        5  p        r e   p          5  p        r e     p            5  p        r e     p                                   
                                 g                    
 8         p        p        p        5  p        r e   p        5  p        r e   p          5  p        r e     5  p        r e     p          p            5  p        r e     5  p        r e     p          p                                   
                                 h                    
 6       p        p        p        5  p        r e   p          5  p        r e     p          p            5  p        r e     p          p                          #         @                                 i                  #UPDATEHYSTERESISTRACKING%SQRT j   #T k   #H m   #HYST_MAP_INIT n   #HYST_MAP o   #N l   #STATEFCN p   #STATEFCNINDICES r   #M q                                              j     SQRT          
  @                               k                    
 .   p          5  p        r l       5  p        r l                              
                                  m                    
 /     p        5  p        r l   p          5  p        r l     p            5  p        r l     p                                   
                                  n                     0   p          5  p        r l       5  p        r l                              
D                                 o                     1    p          5  p        r l       5  p        r l                               
                        @         l                    
                                  p                    2     p           n                                           25  p        r q        n                                      25  p        r q                     #STATEFUNCTION                  
                                  r                     3   p          5  p        r l       5  p        r l                               
                                  q           #         @                                 s                   #LAMBDA t   #MAXDIFF u   #LCH v             
D                                 t     
                 
                                  u                   
 $   p          p            p                                    
D                                 v            #         @                                 w               
   #GETSOLUTION%MATMUL x   #SOLPTS y   #L z   #M {   #DIMS }   #POS ~   #N |   #SPACEDIM    #HOUT    #ROTMAT    #ROTMATINV                                               x     MATMUL          
                                  y                    
      p        5  p        r z   p          5  p        r z     p            5  p        r z     p                                    
                        @         z                    
                                  {                    
      p        5  p        r |   p          5  p        r |     p            5  p        r |     p                                   
  @                               }                    
      p        5  p        r |   p          5  p        r |     p            5  p        r |     p                                   
                                  ~                    
      p        5  p        r |   p          5  p        r |     p            5  p        r |     p                                    
                        @         |                     
                                                      
D                                                     
       p        5  p        r z   p          5  p        r z     p            5  p        r z     p                                   
                                                      
        p        p        p        5  p        r |   p          5  p        r |     p          p            5  p        r |     p          p                                   
                                                      
         p        p        p        5  p        r |   p          5  p        r |     p          p            5  p        r |     p          p                          #         @                                                   #GETN_3D%LOG    #GETN_3D%ATAN    #A    #B    #C    #X    #Y    #Z    #N_OUT                                                    LOG                                                 ATAN           
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                D                                      	              
 K    p          p          p            p          p                          #         @                                                   #GETN_2D%LOG    #GETN_2D%ATAN    #A    #B    #C    #X    #Y    #Z    #N_OUT                                                    LOG                                                 ATAN           
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                
  @                                    
                D                                      	              
 M    p          p          p            p          p                          #         @                                                   #GETDOTPROD%SUM    #N    #M    #DOT_PROD                                                    SUM           
                                       	              
 H   p          p          p            p          p                                    
                                                     
 I   p          p            p                                    
D                                                    
 J    p          p            p                          #         @                                                   #GETROTX%SIN    #GETROTX%COS    #ANGLE    #ROTMAT                                                     SIN                                                 COS           
  @                                    
                
D                                       	              
 E    p          p          p            p          p                          #         @                                 ¡                  #GETROTY%SIN ¢   #GETROTY%COS £   #ANGLE ¤   #ROTMAT ¥                                              ¢     SIN                                            £     COS           
  @                               ¤     
                
D                                 ¥     	              
 F    p          p          p            p          p                          #         @                                 ¦                  #GETROTZ%SIN §   #GETROTZ%COS ¨   #ANGLE ©   #ROTMAT ª                                              §     SIN                                            ¨     COS           
  @                               ©     
                
D                                 ª     	              
 G    p          p          p            p          p                          %         @                                «                   
       #F_3D%SQRT ¬   #A ­   #B ®   #C ¯   #X °   #Y ±   #Z ²                                              ¬     SQRT           
                                  ­     
                
                                  ®     
                
                                  ¯     
                
                                  °     
                
                                  ±     
                
                                  ²     
      %         @                                ³                   
       #G_3D%SQRT ´   #A µ   #B ¶   #C ·   #X ¸   #Y ¹   #Z º                                              ´     SQRT           
                                  µ     
                
                                  ¶     
                
                                  ·     
                
                                  ¸     
                
                                  ¹     
                
                                  º     
      %         @                                »                   
       #H_3D%SQRT ¼   #A ½   #B ¾   #C ¿   #X À   #Y Á   #Z Â                                              ¼     SQRT           
                                  ½     
                
                                  ¾     
                
                                  ¿     
                
                                  À     
                
                                  Á     
                
                                  Â     
      %         @  @                             Ã                   
       #FF_3D%SQRT Ä   #A Å   #B Æ   #C Ç   #X È   #Y É   #Z Ê                                              Ä     SQRT           
                                  Å     
                
                                  Æ     
                
                                  Ç     
                
                                  È     
                
                                  É     
                
                                  Ê     
      %         @                                Ë                    
       #A Ì   #B Í   #C Î   #X Ï   #Y Ð   #Z Ñ   #FUNC Ò             
@ @                               Ì     
                
@ @                               Í     
                
@ @                               Î     
                
                                  Ï     
                
                                  Ð     
                
                                  Ñ     
      "                                        Ò       
     %         @  @                             Ó                   
       #GG_3D%SQRT Ô   #A Õ   #B Ö   #C ×   #X Ø   #Y Ù   #Z Ú                                              Ô     SQRT           
                                  Õ     
                
                                  Ö     
                
                                  ×     
                
                                  Ø     
                
                                  Ù     
                
                                  Ú     
      %         @  @                             Û                   
       #HH_3D%SQRT Ü   #A Ý   #B Þ   #C ß   #X à   #Y á   #Z â                                              Ü     SQRT           
                                  Ý     
                
                                  Þ     
                
                                  ß     
                
                                  à     
                
                                  á     
                
                                  â     
      %         @                                ã                    
       #A ä   #B å   #C æ   #X ç   #Y è   #Z é             
                                  ä     
                
                                  å     
                
                                  æ     
                
                                  ç     
                
                                  è     
                
                                  é     
      %         @                                ê                    
       #A ë   #B ì   #C í   #X î   #Y ï   #Z ð             
                                  ë     
                
                                  ì     
                
                                  í     
                
                                  î     
                
                                  ï     
                
                                  ð     
             t      fn#fn       @   J   PARAMETERS_CALL    T  @   J   UTIL_CALL      @   J   QSORT_C_MODULE .   Ô  Ó       STATEFUNCTION+PARAMETERS_CALL 0   §     a   STATEFUNCTION%T+PARAMETERS_CALL 0   ;     a   STATEFUNCTION%H+PARAMETERS_CALL 0   Ï  ¬   a   STATEFUNCTION%M+PARAMETERS_CALL 9   {     a   STATEFUNCTION%TCRIT_COOL+PARAMETERS_CALL 9        a   STATEFUNCTION%TCRIT_HEAT+PARAMETERS_CALL 9   £     a   STATEFUNCTION%HCRIT_COOL+PARAMETERS_CALL 9   7     a   STATEFUNCTION%HCRIT_HEAT+PARAMETERS_CALL 1   Ë  H   a   STATEFUNCTION%NT+PARAMETERS_CALL 1     H   a   STATEFUNCTION%NH+PARAMETERS_CALL 8   [  H   a   STATEFUNCTION%NCRITCOOL+PARAMETERS_CALL 8   £  H   a   STATEFUNCTION%NCRITHEAT+PARAMETERS_CALL &   ë  `       QSORTC+QSORT_C_MODULE +   K  =      QSORTC%SIZE+QSORT_C_MODULE (        a   QSORTC%A+QSORT_C_MODULE 6   	  ]       WRITEDEBUGSTRINGARR1D+PARAMETERS_CALL :   q	  P   a   WRITEDEBUGSTRINGARR1D%TXT+PARAMETERS_CALL =   Á	     a   WRITEDEBUGSTRINGARR1D%DBLARR+PARAMETERS_CALL 1   M
  i       WRITEDEBUGSTRING+PARAMETERS_CALL 5   ¶
  P   a   WRITEDEBUGSTRING%TXT+PARAMETERS_CALL 8     @   a   WRITEDEBUGSTRING%VALINT+PARAMETERS_CALL 8   F  @   a   WRITEDEBUGSTRING%VALDBL+PARAMETERS_CALL )            GETBILININTERP+UTIL_CALL /     ü   a   GETBILININTERP%TABLE+UTIL_CALL .     ¤   a   GETBILININTERP%XVAL+UTIL_CALL .   ´  ¤   a   GETBILININTERP%YVAL+UTIL_CALL ,   X  @   a   GETBILININTERP%N1+UTIL_CALL ,     @   a   GETBILININTERP%N2+UTIL_CALL +   Ø  @   a   GETBILININTERP%X+UTIL_CALL +     @   a   GETBILININTERP%Y+UTIL_CALL -   X  @   a   GETBILININTERP%RES+UTIL_CALL ,     q       MAGTYPESOFT+PARAMETERS_CALL ,   	  q       MAGTYPEHARD+PARAMETERS_CALL "   z  q       INTERP1+UTIL_CALL $   ë  ¤   a   INTERP1%X+UTIL_CALL $     ¤   a   INTERP1%Y+UTIL_CALL '   3  @   a   INTERP1%XVAL+UTIL_CALL $   s  @   a   INTERP1%N+UTIL_CALL '   ³  @   a   INTERP1%YVAL+UTIL_CALL #   ó  {       PI+PARAMETERS_CALL    n        CALCH      ?      CALCH%CSHIFT    G  @      CALCH%CEILING      <      CALCH%ABS    Ã  =      CALCH%SQRT       @      CALCH%PRESENT    @  ?      CALCH%MAXVAL        a   CALCH%POS        a   CALCH%DIMS        a   CALCH%DIR      ´   a   CALCH%MAGTYPE    ?    a   CALCH%HEXT    C  ´   a   CALCH%T    ÷  @   a   CALCH%N    7  Ç   a   CALCH%STATEFCN &   þ  ´   a   CALCH%STATEFCNINDICES    ²  @   a   CALCH%M    ò    a   CALCH%SOLPTS    ö  @   a   CALCH%L    6  @   a   CALCH%SPACEDIM    v  ¤   a   CALCH%HOUT       ¤   a   CALCH%MOUT    ¾   @   a   CALCH%NITE     þ     a   CALCH%ROTANGLES $   "  ´   a   CALCH%HYST_MAP_INIT    ¶"  ´   a   CALCH%HYST_MAP     j#    a   CALCH%HINT_INIT %   n$  ¾       FINDROTATIONMATRICES /   ,%  B      FINDROTATIONMATRICES%TRANSPOSE ,   n%  ?      FINDROTATIONMATRICES%MATMUL /   ­%    a   FINDROTATIONMATRICES%ROTANGLES '   ±&  @   a   FINDROTATIONMATRICES%N ,   ñ&  ¼   a   FINDROTATIONMATRICES%ROTMAT /   ­'  ¼   a   FINDROTATIONMATRICES%ROTMATINV    i(         CALCNTENSOR #   )  ?      CALCNTENSOR%MATMUL     G)    a   CALCNTENSOR%POS !   K*    a   CALCNTENSOR%DIMS "   O+  Ô   a   CALCNTENSOR%N_OUT    #,  @   a   CALCNTENSOR%N %   c,  @   a   CALCNTENSOR%SPACEDIM #   £,  D  a   CALCNTENSOR%ROTMAT    ç-  Ä       GETM    «.  =      GETM%SQRT    è.    a   GETM%H    ì/  ´   a   GETM%T     0    a   GETM%MOUT    ¤1    a   GETM%DIR    ¨2  ´   a   GETM%MAGTYPE    \3  @   a   GETM%N    3  9  a   GETM%STATEFCN %   Õ4  ´   a   GETM%STATEFCNINDICES    5  @   a   GETM%M    É5  ´   a   GETM%HYST_MAP    }6         GETHDEM    7  ?      GETHDEM%MATMUL    J7    a   GETHDEM%M    N8  @   a   GETHDEM%N    8    a   GETHDEM%HDEM    9  ´  a   GETHDEM%N_OUT "   F;  D  a   GETHDEM%ROTMATINV )   <  Ë       UPDATEHYSTERESISTRACKING .   U=  =      UPDATEHYSTERESISTRACKING%SQRT +   =  ´   a   UPDATEHYSTERESISTRACKING%T +   F>    a   UPDATEHYSTERESISTRACKING%H 7   J?  ´   a   UPDATEHYSTERESISTRACKING%HYST_MAP_INIT 2   þ?  ´   a   UPDATEHYSTERESISTRACKING%HYST_MAP +   ²@  @   a   UPDATEHYSTERESISTRACKING%N 2   ò@  9  a   UPDATEHYSTERESISTRACKING%STATEFCN 9   +B  ´   a   UPDATEHYSTERESISTRACKING%STATEFCNINDICES +   ßB  @   a   UPDATEHYSTERESISTRACKING%M    C  j       UPDATELAMBDA $   C  @   a   UPDATELAMBDA%LAMBDA %   ÉC     a   UPDATELAMBDA%MAXDIFF !   ]D  @   a   UPDATELAMBDA%LCH    D  Ç       GETSOLUTION #   dE  ?      GETSOLUTION%MATMUL #   £E    a   GETSOLUTION%SOLPTS    §F  @   a   GETSOLUTION%L    çF    a   GETSOLUTION%M !   ëG    a   GETSOLUTION%DIMS     ïH    a   GETSOLUTION%POS    óI  @   a   GETSOLUTION%N %   3J  @   a   GETSOLUTION%SPACEDIM !   sJ    a   GETSOLUTION%HOUT #   wK  D  a   GETSOLUTION%ROTMAT &   »L  D  a   GETSOLUTION%ROTMATINV    ÿM          GETN_3D    N  <      GETN_3D%LOG    ÛN  =      GETN_3D%ATAN    O  @   a   GETN_3D%A    XO  @   a   GETN_3D%B    O  @   a   GETN_3D%C    ØO  @   a   GETN_3D%X    P  @   a   GETN_3D%Y    XP  @   a   GETN_3D%Z    P  ´   a   GETN_3D%N_OUT    LQ          GETN_2D    ìQ  <      GETN_2D%LOG    (R  =      GETN_2D%ATAN    eR  @   a   GETN_2D%A    ¥R  @   a   GETN_2D%B    åR  @   a   GETN_2D%C    %S  @   a   GETN_2D%X    eS  @   a   GETN_2D%Y    ¥S  @   a   GETN_2D%Z    åS  ´   a   GETN_2D%N_OUT    T  x       GETDOTPROD    U  <      GETDOTPROD%SUM    MU  ´   a   GETDOTPROD%N    V     a   GETDOTPROD%M $   V     a   GETDOTPROD%DOT_PROD    )W         GETROTX    ªW  <      GETROTX%SIN    æW  <      GETROTX%COS    "X  @   a   GETROTX%ANGLE    bX  ´   a   GETROTX%ROTMAT    Y         GETROTY    Y  <      GETROTY%SIN    ÓY  <      GETROTY%COS    Z  @   a   GETROTY%ANGLE    OZ  ´   a   GETROTY%ROTMAT    [         GETROTZ    [  <      GETROTZ%SIN    À[  <      GETROTZ%COS    ü[  @   a   GETROTZ%ANGLE    <\  ´   a   GETROTZ%ROTMAT    ð\         F_3D    y]  =      F_3D%SQRT    ¶]  @   a   F_3D%A    ö]  @   a   F_3D%B    6^  @   a   F_3D%C    v^  @   a   F_3D%X    ¶^  @   a   F_3D%Y    ö^  @   a   F_3D%Z    6_         G_3D    ¿_  =      G_3D%SQRT    ü_  @   a   G_3D%A    <`  @   a   G_3D%B    |`  @   a   G_3D%C    ¼`  @   a   G_3D%X    ü`  @   a   G_3D%Y    <a  @   a   G_3D%Z    |a         H_3D    b  =      H_3D%SQRT    Bb  @   a   H_3D%A    b  @   a   H_3D%B    Âb  @   a   H_3D%C    c  @   a   H_3D%X    Bc  @   a   H_3D%Y    c  @   a   H_3D%Z    Âc         FF_3D    Ld  =      FF_3D%SQRT    d  @   a   FF_3D%A    Éd  @   a   FF_3D%B    	e  @   a   FF_3D%C    Ie  @   a   FF_3D%X    e  @   a   FF_3D%Y    Ée  @   a   FF_3D%Z    	f         GETF_LIMIT    f  @   a   GETF_LIMIT%A    Íf  @   a   GETF_LIMIT%B    g  @   a   GETF_LIMIT%C    Mg  @   a   GETF_LIMIT%X    g  @   a   GETF_LIMIT%Y    Íg  @   a   GETF_LIMIT%Z     h  @      GETF_LIMIT%FUNC    Mh         GG_3D    ×h  =      GG_3D%SQRT    i  @   a   GG_3D%A    Ti  @   a   GG_3D%B    i  @   a   GG_3D%C    Ôi  @   a   GG_3D%X    j  @   a   GG_3D%Y    Tj  @   a   GG_3D%Z    j         HH_3D    k  =      HH_3D%SQRT    [k  @   a   HH_3D%A    k  @   a   HH_3D%B    Ûk  @   a   HH_3D%C    l  @   a   HH_3D%X    [l  @   a   HH_3D%Y    l  @   a   HH_3D%Z    Ûl  z       F_2D    Um  @   a   F_2D%A    m  @   a   F_2D%B    Õm  @   a   F_2D%C    n  @   a   F_2D%X    Un  @   a   F_2D%Y    n  @   a   F_2D%Z    Õn  z       G_2D    Oo  @   a   G_2D%A    o  @   a   G_2D%B    Ïo  @   a   G_2D%C    p  @   a   G_2D%X    Op  @   a   G_2D%Y    p  @   a   G_2D%Z 