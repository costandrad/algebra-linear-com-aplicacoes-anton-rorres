#import "../styles.typ": *

= Sistemas de Equações Lineares e Matrizes



== Introdução aos sistemas de equações lineares 

#set heading(numbering: none)
=== Conjunto de exercícios (página 9)

+ Em cada parte, determine se a equação é linear em $x_1$, $x_2$ e $x_3$.
  #set enum(numbering: "(a)")
  + $x_1 + 5x_2 - sqrt(2) x_3 = 1$
  + $x_1 + 3x_2^2 + x_1 x_3$
  + $x_1 = -7x_2 + 3x_3$
  + $x_1^(-2) + x_2 + 8x_3$
  + $x_1^(3/5) - 2x_2 + x_3 = 4$
  + $pi x_1 - sqrt(2) x_2 + 1/3 x_ 3 = 7^(1/3)$

  #solution([
    São lineares as equações (a), (c) e (f).
  ])
+ Em cada parte, determine se as equações formam um sistema linear.
  #set enum(numbering: "(a)")
  + $
      -2x + 4y + z &= 2\
      3x - 2/y &= 0
    $

  + $
      x &= 4\
      2x &= 8
    $

  + $
      4&x - &y + 2&z &= -1\
      -&x + (ln 2) &y - 3&z &= 0
    $

  + $
      3z + x &= -4\
      y + 5z &= 1\
      6x + 2z &= 3\
      -x - y - z = 4
    $

  #solution([
    São lineares as equações que formam os sistemas (b), (c) e (d).
  ])

+ Em cada parte, determine se as equações formam um sistema linear.
  #set enum(numbering: "(a)")
  + $
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
    $

  + $
      sin(2x_1 + x_3) &= sqrt(5)\
      e^(-2x_2 - 2x_4) &= 1/x_2\
      4x+4 &= 4
    $ 

  + $
    7&x_1 -   &x_2 +  2 &x_3  &= 0\
    2&x_1 +   &x_2 - x_3&x_4  &= 3\
    -&x_1 +  5&x_2 -    &x_4  &= -1
    $

  + $x_1 + x_2 = x_3 + x_4$

  #solution([
    São lineares as equações que formam os sistemas em (a) e (d).
  ])

+ Para cada sistema do Exercício 2 que for linear, detemine se é consistente.
  #set enum(numbering: "(a)", start: 2)
  + $
      x &= 4\
      2x &= 8
    $

  #solution([
    No sistema dado, consideremos a segunda equação: $2x = 8$. Dividindo-a por $2$, obtemos $x = 4$, que é exatamente a primeira equação. Assim, o sistema possui uma solução: $x = 4$ e é *consistente*.
  ])

  + $
      4&x - &y + 2&z &= -1\
      -&x + (ln 2) &y - 3&z &= 0
    $

  #solution([
    Temos duas equações e três incógnitas. Geometricamente, representam dois planos no espaço tridimensional ($RR^3$). Inicialmente, vamos eliminar $x$ da primeira equação somando 4 vezes a segunda equação à primeira. O sistema simplificado é mostrado abaixo:

    $
       & &(4ln 2-1) &y -10  &z &= -1\
      -&x + &(ln 2)  &y - 3&z &= 0
    $

    Arbitrariamente, parametrizemos $y = t$. Assim, a primeira equação assume a forma:
    $
      (4 ln 2 - 1) y -10z = -1 &arrow.double (4 ln 2 - 1)t - 10z = -1\
      &arrow.double z = frac(1 + (1 - 4ln 2)t, 10)
    $

    Substituindo as expressões parametrizadas de $y$ e $z$ na segunda equação, obtemos:
    $
      -x + (ln 2)y - 3z = 0 &arrow.double x = (ln 2)y - 3z\
      &arrow.double x = (ln 2) t - 3 dot frac(1 + (1 - 4ln 2)t, 10)\
      &arrow.double x = frac((10ln 2)t - 3 - (1 + 4ln 2)t, 10)\
      &arrow.double x = frac((6ln 2 - 1)t - 3, 10)
    $
    A solução do sistema é
    $
      cases(
        x = display(frac((6ln 2 - 1)t - 3, 10))\
        y = t\
        z = display(frac(1 + (1 - 4ln 2)t, 10))
      ) 
    $
    para $t in RR$. Em particular, tomando $t = 0$, encontramos a solução $(x, y, z) = (display(-3/10), 0, display(1/10))$.

    Portanto, o sistema possui infinitas soluções e é *consistente*.
    
  ])

  + $
      3z + x &= -4\
      y + 5z &= 1\
      6x + 2z &= 3\
      -x - y - z &= 4
    $

  #solution([
    A matriz aumentada representativa do sistema dado é a seguinte:

    #set math.mat(align: right, delim: "[")
    $
      mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        6, 0, 2, 3;
        -1, -1, -1, 4
      )
    $


    No que segue, consideremos a seguinte notação, representativa das operações elementares sobre matrizes:
    - $L_m$: Representa a linha $m$, com $m = 1, 2, 3, 4$;
    - $L_m arrow.l.r L_n$: As linhas $m$ e $n$ trocam de lugar, com $m, n = 1, 2, 3, 4$;
    - $L_m arrow a L_m + b L_n$: A linha $m$ é substituída por $a$ vezes a linha $m$ somado a $b$ vezes a linha $n$, em que $a$ e $b$. 

    Assim, façamos as seguinte manipulações sobre a matriz aumentada:
    $
      & & &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        6, 0, 2, 3;
        -1, -1, -1, 4
      )\
      &(L_3 arrow 6L_1 - L_3) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 14, -21;
        -1, -1, -1, 4
      )\
      &(L_3 arrow L_3/7)  &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        -1, -1, -1, 4       
      )\
      &(L_4 arrow L_1 + L_2 + L_4) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        0, 0, 7, 1       
      )\
      &(L_4 arrow L_4/7) &arrow.double &mat(
        1, 0, 3, -4;
        0, 1, 5, 1;
        0, 0, 1, -3/2;
        0, 0, 1, 1/7         
      ) 
    $

    Note que as linhas 3 e 4 acima equivalem às equações $z = -3/2$ e $z = 1/7$, respectivamente. Isso representa uma contradição. Portanto, o sistema não possui solução e é *inconsistente*.
  ])

+ Para cada sistema do Exercício 3 que for linear, determine se é consistente.

  #set enum(numbering: "(a)")
  + $
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
    $

  #solution([
    Parametrizemos:
    $
      cases(
        x_1 &= r\
        x_2 &= s
      )
    $
    Então,
    $
      cases(
      2&x_1     &       & -   &x_4 &= 5\
      -&x_1 + 4 &x_2 + 3&x_3-2&x_4 &= -1
      )
      &arrow.double 
      cases(
      2&r     &       & -   &x_4 &= 5\
      -&r + 4 &s + 3&x_3-2&x_4 &= -1
      )\
      &arrow.double 
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-1 + r - 4s + 2x_4, 3))
      )\
      &arrow.double 
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-1 + r - 4s + 2 dot (2r - 5), 3))
      )\
      &arrow.double
      cases(
        x_4 &= 2r - 5\
        x_3 &= display(frac(-11 + 5r - 4s, 3))
      )
    $
    Portanto, o sistema possui infintas soluções da forma:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= display(frac(-11 + 5r - 4s, 3))\
        x_4 &= 2r - 5
      )
    $
    Em particular,  tomando $r = s = 0$, obtemos a solução $(0, 0, -11/3, 5)$.
  ])


  #set enum(start: 4)
  + $x_1 + x_2 = x_3 + x_4$
  #solution([
    Parametrizemos:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= t
      ) 
    $
    Portanto,
    $
      x_1 + x_2 = x_3 + x_4 arrow.double r + s = t + x_4 arrow.double x_4 = r+ s - t
    $
    O sistema possui infinitas soluções da forma:
    $
      cases(
        x_1 &= r\
        x_2 &= s\
        x_3 &= t\
        x_4 &= r+s-t
      )
    $
    Em particular, tomando $r = s = t = 0$, obtemos a solução trivial $(0,0,0,0)$.
  ])
  
